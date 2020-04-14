import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0
import QtBluetooth 5.11
import Process 1.0
import FileIO 1.0
import NetworkModel 1.0

Item {
    id: settingPanel
    height: parent.height
    width: parent.width

    property real setting: 0
    property bool closed: false
    property bool runningBlt: false
    property bool scanningBlt: false
    property bool scanningWifi: false
    property string errorString: ""
    property bool errorOccured: false
    property string remoteDeviceName: ""

    onSettingChanged: log.set();

    FontLoader {
        id: fontSettingsNeoSans
        source:"qrc:Neo_Sans_Std_Medium.ttf"
    }

    FontLoader {
        id: fontSettingsOpenSans
        source:"qrc:OpenSans-Light.ttf"
    }

    Process {
        id: process
    }

    FileIO {
        id: fileWifi
        source: "./tmpWifi.txt"
    }

    //sudo setcap 'cap_net_raw,cap_net_admin+eip' /home/pi/OBD_206
    BluetoothDiscoveryModel {
        id: btModel
        running: runningBlt
        discoveryMode: BluetoothDiscoveryModel.DeviceDiscovery
        onDeviceDiscovered: {
            log.set();
        }
        onServiceDiscovered: {
            console.log("Found new service " + service.deviceAddress + " " + service.deviceName + " " + service.serviceName);
            remoteDeviceName = service.deviceName
//            socket.setService(service)
        }

        onErrorChanged: {
                switch (btModel.error) {
                case BluetoothDiscoveryModel.PoweredOffError:
                    errorString = "ERROR: Bluetooth device not turned on";
                    scanningBlt = false;
                    errorOccured = true;
                    log.set();
                    break;
                case BluetoothDiscoveryModel.InputOutputError:
                    errorString = "ERROR: Bluetooth I/O Error";
                    scanningBlt = false;
                    errorOccured = true;
                    log.set();
                    break;
                case BluetoothDiscoveryModel.InvalidBluetoothAdapterError:
                    errorString = "ERROR: Invalid Bluetooth Adapter Error";
                    scanningBlt = false;
                    errorOccured = true;
                    log.set();
                    break;
                case BluetoothDiscoveryModel.NoError:
                    scanningBlt = true;
                    errorOccured = false;
                    break;
                default:
                    errorString = "ERROR: Unknown Error";
                    scanningBlt = false;
                    errorOccured = true;
                    log.set();
                    break;
                }
        }
    }

    Row {
        id: rowSettings
        anchors.top: parent.top
        anchors.topMargin: 34

        Button {
            id: scan
            text: setting == 1 ?
                      (scanningBlt ? "Scanning Devices" : "Scan Devices")
                    : (scanningWifi ? "Scanning Network" : "Scan Network")
            enabled: true

            contentItem: Text {
                text: scan.text
                font: fontSettingsNeoSans.name
                opacity: enabled ? 1.0 : 0.3
                color: setting == 1 ?
                            scanningBlt ? "#1E50BA" : "#aaabac"
                        :   scanningWifi ? "#1E50BA" : "#aaabac"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 100
                color: "transparent"
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                border.color: setting == 1 ?
                    scanningBlt ? "#1E50BA" : "#aaabac"
                :   scanningWifi ? "#1E50BA" : "#aaabac"
                border.width: 2
                radius: 8
            }

            property string cmd: "bash";
            property string arg1: "-c";
            property string arg2: "sudo iwlist wlan0 scanning | grep ESSID > tmpWifi.txt";

            onClicked: {
                if(setting == 1)
                {
                    scanningBlt = true;
                    runningBlt = true;
                }else if(setting == 2) {
                    scanningWifi = true;
                    process.start(cmd, [arg1, arg2]);
                }
            }
        }

        BusyIndicator {
            id: loadingScan
            scale: 0.4
            anchors.verticalCenter: scan.verticalCenter

            running: setting == 1 ? scanningBlt : scanningWifi
            visible: setting == 1 ? scanningBlt : scanningWifi

            onVisibleChanged: {
                myModel.clearNetworks();
                if(!visible && setting == 2)
                    myModel.addNetworks(fileWifi.read());
            }

            contentItem: Item {
                implicitWidth: 64
                implicitHeight: 64

                Item {
                    id: item
                    x: parent.width / 2 - 32
                    y: parent.height / 2 - 32
                    width: 64
                    height: 64
                    opacity: loadingScan.running ? 1 : 0

                    Behavior on opacity {
                        OpacityAnimator {
                            duration: 250
                        }
                    }

                    RotationAnimator {
                        target: item
                        running: loadingScan.visible && loadingScan.running
                        from: 0
                        to: 360
                        loops: Animation.Infinite
                        duration: 1250
                    }

                    Repeater {
                        id: repeater
                        model: 6

                        Rectangle {
                            x: item.width / 2 - width / 2
                            y: item.height / 2 - height / 2
                            implicitWidth: 10
                            implicitHeight: 10
                            radius: 5
                            color: "#03FFCF"
                            transform: [
                                Translate {
                                    y: -Math.min(item.width, item.height) * 0.5 + 5
                                },
                                Rotation {
                                    angle: index / repeater.count * 360
                                    origin.x: 5
                                    origin.y: 5
                                }
                            ]
                        }
                    }
                }
            }
        }
    }

    ListView {
        id: mainList
        width: settingPanel.width
        anchors.top: rowSettings.bottom
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.topMargin: 12
        clip: true
        spacing: 10

        highlightFollowsCurrentItem: true

        model: setting === 1 ? btModel : myModel
        delegate: Rectangle {
            id: btDelegate
            width: parent.width
            height: column.height + 10
            color: "transparent"
            border.color: "transparent"
            border.width: 2
            radius: 5

            property bool expended: false;
            clip: true

            Image {
                id: bticon
                source: setting === 1 ? "qrc:blueetooth-logo_on.png" : "qrc:wifi_on.png";
                width: bttext.height;
                height: bttext.height;
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.margins: 5
                opacity: 0.7
                scale: 0.7
            }

            Column {
                id: column
                anchors.left: bticon.right
                anchors.leftMargin: 5
                anchors.verticalCenter: bticon.verticalCenter
                Text {
                    id: bttext
                    text: setting == 1 ? (deviceName ? deviceName : name) : modelData
                    font.family: fontSettingsOpenSans.name
                    font.pointSize: 14
                    color: "#aaabac"
                }
            }
            Behavior on height { NumberAnimation { duration: 200} }

            MouseArea {
                anchors.top: parent.top
                anchors.fill: parent
                onClicked: {
                    console.log(service);
                    socket.setService(service)
                }
            }
        }
        focus: true
    }

    Timer {
        id: timeoutBlt
        interval: 15000
        repeat: false
        running: (runningBlt || scanningWifi)
        triggeredOnStart: false
        onTriggered: {
            runningBlt = false;
            scanningBlt = false;
            scanningWifi = false;
        }
    }


    Text {
        id: log
        visible: true
        function set() {
            if(setting === 1)
            {
                log.text = errorOccured ? errorString : btModel.rowCount().toString() + (btModel.rowCount() > 1 ? " devices found" : " device found");
                log.color = errorOccured ? "#F20900" : "#aaabac";
            }else if (setting === 2)
            {
                log.text = "";
            }
        }
        font.family: fontSettingsOpenSans.name
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        fontSizeMode: Text.Fit
        minimumPixelSize: 10
        font.pixelSize: 16
        opacity: 0.5
    }

    BluetoothSocket {
        id: socket
        connected: true

        onSocketStateChanged: {
            switch (socketState) {
                case BluetoothSocket.Unconnected:
                case BluetoothSocket.NoServiceSet:
                    console.log("\nNo connection. \n\nPlease restart app.");
                    break;
                case BluetoothSocket.Connected:
                    console.log("Connected to server ");
                    break;
                case BluetoothSocket.Connecting:
                case BluetoothSocket.ServiceLookup:
                case BluetoothSocket.Closing:
                case BluetoothSocket.Listening:
                case BluetoothSocket.Bound:
                    break;
            }
        }
        onStringDataChanged: {
            console.log("Received data: " )
            var data = remoteDeviceName + ": " + socket.stringData;
            data = data.substring(0, data.indexOf('\n'))
            console.log(data);
        }
        //...
    }
}
