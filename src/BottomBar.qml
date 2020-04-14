import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.0
import QtLocation 5.9
import QtPositioning 5.9


Item {
    id: bottomBar

    property alias traffic: trafficButton.checked
    property alias night: nightButton.checked

    height: 70

    Image {
        anchors.fill: parent

        source: "qrc:bottom.png"
    }

    RowLayout {
        anchors.fill: parent
        spacing: 80

        Button {
            id: navig

            background: Image {
                source: navig.pressed? "qrc:navigation_pressed_test.png" : "qrc:navigation_test.png"
                scale: 0.9
            }

            Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
        }

        Button {
            id: locate

            background: Image {
                source: locate.pressed? "qrc:target_pressed_test.png" : "qrc:target_test.png"
                scale: 0.9
            }

            Layout.alignment: Qt.AlignVCenter

            onClicked: {
                map.center = QtPositioning.coordinate(
                                src.position.coordinate.latitude,
                                src.position.coordinate.longitude)
            }
        }

        FontLoader {
            id: digitalFont
            source:"qrc:digital-7.ttf"
        }

        Rectangle {
            height: 60
            width: 142
            color: "transparent"

            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

            Text {
                id: foo
                font.family: digitalFont.name
                color: "#F2EFDC" //"#037E8C"
//                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                function set() {
                    foo.text = Qt.formatTime(new Date(),"HH:mm")
                }
                fontSizeMode: Text.Fit
                minimumPixelSize: 12
                font.pixelSize: 71
            }
        }

        Timer {
            id: textTimer
            interval: 1000
            repeat: true
            running: true
            triggeredOnStart: true
            onTriggered: foo.set()
        }

        Button {
            id: trafficButton
            checkable: true
            background: Image {
                source: trafficButton.checked? "qrc:traffic-light_pressed_test.png" : "qrc:traffic-light_test.png"
                scale: 0.9
            }
            Layout.alignment: Qt.AlignVCenter
        }

        Button {
            id: nightButton
            checkable: true
            background: Image {
                source: nightButton.checked? "qrc:idea_pressed_test.png" : "qrc:idea_test.png"
                scale: 0.9
            }
            Layout.alignment: Qt.AlignVCenter | Qt.AlignRight
        }
    }
}
