import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0
import Process 1.0


Item {
    id: popup
    width: parent.width
    height: parent.height

    property real valueLuminosity: 1
    property real valueSound: 0.2
    property bool closeDrawer: false
    property real settingLaunch: 0

    FontLoader {
        id: fontSettingsNeoSans
        source:"qrc:Neo_Sans_Std_Medium.ttf"
    }

    Text {
        id: text
    }

    Process {
        id: process
        onReadyRead: {
            text.text = readAll();
            console.log(text.text);
        }
    }

    Dialog {
        id: dialog
        parent: Overlay.overlay
        visible: false

        x: Math.round((parent.width - width) / 2)
        y: Math.round((parent.height - height) / 2)
        width: 500
        height: 350

        background: Image {
            id: backgroundSettings
            width: 500
            height: 350
            source: settingLaunch == 1?
                        "qrc:bt_background.png"
                      : "qrc:wifi_background.png"
            scale: 1
            z: 0
        }

        header: Text {
            id: title
            text: settingLaunch == 1? "Bluetooth Settings" : "Wifi Settings"
            font.family: fontSettingsNeoSans.name
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 10
            fontSizeMode: Text.Fit
            minimumPixelSize: 10
            font.pixelSize: 22
            color: "#aaabac"

        }

        contentItem: Settings {
            id: settingsId
            setting: settingLaunch
        }

        onOpened: {
            closeDrawer = true;
        }

        onClosed: {
            settingsId.closed = true;
            settingsId.runningBlt = false;
            settingsId.scanningBlt = false;
            closeDrawer = false;
        }
    }

    Item {
        id: luminosity
        height: 55
        width: parent.width

        Image {
            id: luminosityIcon
            source: "qrc:luminosity.png"
            scale: 0.35
            anchors.top: parent.top
        }
        Text {
            text: "Luminosity"
            font.family: fontSettingsNeoSans.name
            anchors.left: luminosityIcon.right
            anchors.leftMargin: -10
            anchors.top: parent.top
            anchors.topMargin: 22
            fontSizeMode: Text.Fit
            minimumPixelSize: 10
            font.pixelSize: 22
            color: "#BBBCBE"
        }
    }

    Slider {
        id: luminositySlider
        width: parent.width/2
        anchors.top: luminosity.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        value: valueLuminosity

        background: Rectangle {
            x: luminositySlider.leftPadding
            y: luminositySlider.topPadding + luminositySlider.availableHeight / 2 - height / 2
            implicitWidth: 200
            implicitHeight: 4
            width: luminositySlider.availableWidth
            height: implicitHeight
            radius: 2
            color: "#0D1016"

            Rectangle {
                width: luminositySlider.visualPosition * parent.width
                height: parent.height
                color: "#03FFCF"
                radius: 2
            }
        }

        handle: Rectangle {
            x: luminositySlider.leftPadding + luminositySlider.visualPosition * (luminositySlider.availableWidth - width)
            y: luminositySlider.topPadding + luminositySlider.availableHeight / 2 - height / 2
            implicitWidth: 26
            implicitHeight: 26
            radius: 13
            color: luminositySlider.pressed ? "#f0f0f0" : "#f6f6f6"
            border.color: "#bdbebf"
        }

        property string cmd: "bash";
        property string arg1: "-c";
        property string arg2: "echo " + (valueLuminosity*255).toFixed(0).toString() + " > /sys/class/backlight/rpi_backlight/brightness";

        onValueChanged: {
            valueLuminosity = luminositySlider.value;
            process.start(cmd, [arg1, arg2]);
        }
    }

    Button {
        id: buttonMinusLuminosity
        width: 25
        height: 25
        contentItem: Text {
            text: "-"
            font.family: fontSettingsNeoSans.name
            color: "#BBBCBE"//buttonMinus.pressed ? "#1E50BA": "#0D192E"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            fontSizeMode: Text.Fit
            minimumPixelSize: 40
            font.pixelSize: 40
        }
        background: Rectangle {
            implicitWidth: 25
            implicitHeight: 25
            border.color: "transparent"
            color: "transparent"//buttonMinus.pressed ? "#41454A": "#BBBCBE"
            border.width: 1
            radius: 4
        }

        anchors.topMargin: 8
        anchors.top: luminosity.bottom
        anchors.right: luminositySlider.left
        anchors.rightMargin: 15

        onClicked: {
            if(valueLuminosity != 0.0)
                valueLuminosity = valueLuminosity - 0.1;
        }
    }

    Button {
        id: buttonPlusLuminosity
        width: 25
        height: 25
        contentItem: Text {
            text: "+"
            font.family: fontSettingsNeoSans.name
            color: "#BBBCBE"//buttonMinus.pressed ? "#1E50BA": "#0D192E"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            fontSizeMode: Text.Fit
            minimumPixelSize: 40
            font.pixelSize: 40
        }
        background: Rectangle {
            implicitWidth: 25
            implicitHeight: 25
            border.color: "transparent"
            color: "transparent"//buttonMinus.pressed ? "#41454A": "#BBBCBE"
            border.width: 1
            radius: 4
        }

        anchors.topMargin: 12
        anchors.top: luminosity.bottom
        anchors.left: luminositySlider.right
        anchors.leftMargin: 15

        onClicked: {
            if(valueLuminosity != 1.0)
                valueLuminosity = valueLuminosity + 0.1;
        }
    }

    Item {
        id: sound
        height: 55
        width: parent.width
        anchors.topMargin: 10
        anchors.top: luminositySlider.bottom

        Image {
            id: soundIcon
            source: ""
            scale: 0.35
        }
        Text {
            text: "Sound"
            font.family: fontSettingsNeoSans.name
            anchors.left: soundIcon.right
            anchors.leftMargin: -10
            anchors.top: parent.top
            anchors.topMargin: 22
            fontSizeMode: Text.Fit
            minimumPixelSize: 10
            font.pixelSize: 22
            color: "#BBBCBE"
        }
    }

    Slider {
        id: soundSlider
        width: parent.width/2
        anchors.top: sound.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        value: valueSound

        background: Rectangle {
            x: soundSlider.leftPadding
            y: soundSlider.topPadding + soundSlider.availableHeight / 2 - height / 2
            implicitWidth: 200
            implicitHeight: 4
            width: soundSlider.availableWidth
            height: implicitHeight
            radius: 2
            color: "#0D1016"

            Rectangle {
                width: soundSlider.visualPosition * parent.width
                height: parent.height
                color: "#03FFCF"
                radius: 2
            }
        }

        handle: Rectangle {
            x: soundSlider.leftPadding + soundSlider.visualPosition * (soundSlider.availableWidth - width)
            y: soundSlider.topPadding + soundSlider.availableHeight / 2 - height / 2
            implicitWidth: 26
            implicitHeight: 26
            radius: 13
            color: soundSlider.pressed ? "#f0f0f0" : "#f6f6f6"
            border.color: "#bdbebf"
        }

        onValueChanged: {
            valueSound = soundSlider.value;
            if (valueSound == 0)
                soundIcon.source = "qrc:speaker_0.png";
            else if (valueSound > 0.0 && valueSound <= 0.3)
                soundIcon.source = "qrc:speaker_1.png";
            else if (valueSound > 0.3 && valueSound <= 0.6)
                soundIcon.source = "qrc:speaker_2.png";
            else if (valueSound > 0.6)
                soundIcon.source = "qrc:speaker_3.png";
        }
    }

    Button {
        id: buttonMinusSound
        width: 25
        height: 25
        contentItem: Text {
            text: "-"
            font.family: fontSettingsNeoSans.name
            color: "#BBBCBE"//buttonMinus.pressed ? "#1E50BA": "#0D192E"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            fontSizeMode: Text.Fit
            minimumPixelSize: 40
            font.pixelSize: 40
        }
        background: Rectangle {
            implicitWidth: 25
            implicitHeight: 25
            border.color: "transparent"
            color: "transparent"//buttonMinus.pressed ? "#41454A": "#BBBCBE"
            border.width: 1
            radius: 4
        }

        anchors.topMargin: 8
        anchors.top: sound.bottom
        anchors.right: soundSlider.left
        anchors.rightMargin: 15

        onClicked: {
            if(valueSound != 0.0)
                valueSound = valueSound - 0.1;
        }
    }

    Button {
        id: buttonPlusSound
        width: 25
        height: 25
        contentItem: Text {
            text: "+"
            font.family: fontSettingsNeoSans.name
            color: "#BBBCBE"//buttonMinus.pressed ? "#1E50BA": "#0D192E"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            fontSizeMode: Text.Fit
            minimumPixelSize: 40
            font.pixelSize: 40
        }
        background: Rectangle {
            implicitWidth: 25
            implicitHeight: 25
            border.color: "transparent"
            color: "transparent"//buttonMinus.pressed ? "#41454A": "#BBBCBE"
            border.width: 1
            radius: 4
        }

        anchors.topMargin: 12
        anchors.top: sound.bottom
        anchors.left: soundSlider.right
        anchors.leftMargin: 15

        onClicked: {
            if(valueSound != 1.0)
                valueSound = valueSound + 0.1;
        }
    }

    Item {
        id: wifi
        height: 55
        width: parent.width/2.9
        anchors.topMargin: 25
        anchors.top: soundSlider.bottom

        Image {
            id: wifiIcon
            source: "qrc:wifi.png"
            scale: 0.35
        }
        Text {
            text: "Wifi"
            font.family: fontSettingsNeoSans.name
            anchors.left: wifiIcon.right
            anchors.leftMargin: -10
            anchors.top: parent.top
            anchors.topMargin: 22
            fontSizeMode: Text.Fit
            minimumPixelSize: 10
            font.pixelSize: 22
            color: "#BBBCBE"
        }
    }

    SwitchDelegate {
        id: wifiSwitch
        checked: true
        anchors.topMargin: 37
        anchors.top: soundSlider.bottom
        anchors.left: night.right
        anchors.leftMargin: -2

        indicator: Rectangle {
            implicitWidth: 55
            implicitHeight: 13
            x: wifiSwitch.width - width - wifiSwitch.rightPadding
            y: parent.height / 2 - height / 2
            radius: 13
            color: wifiSwitch.checked ? "#03FFCF" : "#0D1016"
            border.color: wifiSwitch.checked ? "#03FFCF" : "#BBBCBE"

            Rectangle {
                x: wifiSwitch.checked ? parent.width - width : 0
                y: parent.height / 2 - height / 2
                width: 26
                height: 26
                radius: 13
                color: wifiSwitch.pressed ? "#f0f0f0" : "#f6f6f6"
                border.color: "#bdbebf"
            }
        }

        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 40
            visible: false
            color: "transparent"
        }

        property string cmd: "sudo";
        property string arg0: "ifconfig";
        property string arg1: "wlan0";
        property string arg21: "down";
        property string arg22: "up";
//        property string arg3: "dhcpcd.service";


        onCheckedChanged: {
            if(wifiSwitch.checked)
            {
                process.start(cmd, [arg0, arg1, arg22]);
                settingLaunch = 2;
                dialog.open();
            }else
                process.start(cmd, [arg0, arg1, arg21]);
        }
    }

    Item {
        id: bluetooth
        height: 55
        width: parent.width/2.9
        anchors.topMargin: 12
        anchors.top: wifi.bottom

        Image {
            id: bluetoothIcon
            source: "qrc:blueetooth-logo.png"
            scale: 0.35
        }
        Text {
            text: "Bluetooth"
            font.family: fontSettingsNeoSans.name
            anchors.left: bluetoothIcon.right
            anchors.leftMargin: -10
            anchors.top: parent.top
            anchors.topMargin: 22
            fontSizeMode: Text.Fit
            minimumPixelSize: 10
            font.pixelSize: 22
            color: "#BBBCBE"
        }
    }

    SwitchDelegate {
        id: bluetoothSwitch
        checked: false
        anchors.topMargin: 25
        anchors.top: wifi.bottom
        anchors.left: bluetooth.right
        anchors.leftMargin: -2

        indicator: Rectangle {
            implicitWidth: 55
            implicitHeight: 13
            x: bluetoothSwitch.width - width - bluetoothSwitch.rightPadding
            y: parent.height / 2 - height / 2
            radius: 13
            color: bluetoothSwitch.checked ? "#03FFCF" : "#0D1016"
            border.color: bluetoothSwitch.checked ? "#03FFCF" : "#BBBCBE"

            Rectangle {
                x: bluetoothSwitch.checked ? parent.width - width : 0
                y: parent.height / 2 - height / 2
                width: 26
                height: 26
                radius: 13
                color: bluetoothSwitch.pressed ? "#f0f0f0" : "#f6f6f6"
                border.color: "#bdbebf"
            }
        }

        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 40
            visible: false
            color: "transparent"
        }

        property string cmd: "sudo";
        property string arg1: "systemctl";
        property string arg21: "stop";
        property string arg22: "start";
        property string arg3: "bluetooth";


        onCheckedChanged: {
            if(bluetoothSwitch.checked)
            {
                process.start(cmd, [arg1, arg22, arg3]);
                settingLaunch = 1;
                dialog.open();
            }else
                process.start(cmd, [arg1, arg21, arg3]);
        }
    }

    Item {
        id: night
        height: 55
        width: parent.width/2.9
        anchors.topMargin: 12
        anchors.top: bluetooth.bottom

        Image {
            id: nightIcon
            source: "qrc:camera-night-mode.png"
            scale: 0.35
        }
        Text {
            text: "Night Mode"
            font.family: fontSettingsNeoSans.name
            anchors.left: nightIcon.right
            anchors.leftMargin: -10
            anchors.top: parent.top
            anchors.topMargin: 22
            fontSizeMode: Text.Fit
            minimumPixelSize: 10
            font.pixelSize: 22
            color: "#BBBCBE"
        }
    }

    SwitchDelegate {
        id: nightSwitch
        checked: true
        anchors.topMargin: 25
        anchors.top: bluetooth.bottom
        anchors.left: night.right
        anchors.leftMargin: -2
        enabled: false

        indicator: Rectangle {
            implicitWidth: 55
            implicitHeight: 13
            x: nightSwitch.width - width - nightSwitch.rightPadding
            y: parent.height / 2 - height / 2
            radius: 13
            color: nightSwitch.checked ? "#03FFCF" : "#0D1016"
            border.color: nightSwitch.checked ? "#03FFCF" : "#BBBCBE"

            Rectangle {
                x: nightSwitch.checked ? parent.width - width : 0
                y: parent.height / 2 - height / 2
                width: 26
                height: 26
                radius: 13
                color: nightSwitch.pressed ? "#f0f0f0" : "#f6f6f6"
                border.color: "#bdbebf"
            }
        }

        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 40
            visible: false
            color: "transparent"
        }
    }
}
