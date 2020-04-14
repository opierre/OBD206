import QtQuick 2.9
import QtQuick.Window 2.1
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0

Item {
    id: container

    Image {
        id: background
        source: "qrc:backg_final.png"
        scale: 1
        z: 0
    }

    FontLoader {
        id: fontDateOpenSans
        source:"qrc:OpenSans-Light.ttf"
    }

    FontLoader {
        id: fontHourOpenSans
        source:"qrc:OpenSans-ExtraBold.ttf"
    }

    ValueSource {
        id: valueSource
    }

    TurnIndicator {
        id: leftIndicator
        //anchors.verticalCenter: parent.verticalCenter
        width: container.width/24.3
        height: container.width/24.3
        x: container.width*0.80/4 + 40
        y: container.height * 0.04
        direction: Qt.LeftArrow
        on: valueSource.turnSignal == Qt.LeftArrow
    }

    TurnIndicator {
        id: rightIndicator
        //anchors.verticalCenter: parent.verticalCenter
        width: container.width/24.3
        height: container.width/24.3
        x: container.width*3/4 - 40
        y: container.height * 0.04
        direction: Qt.RightArrow
        on: valueSource.turnSignal == Qt.RightArrow
    }

    Column {
        id: logoColumn
        height: container.height * 0.57
        width: height/1.8
        anchors.left: container.left
        anchors.leftMargin: container.width * 0.03
        anchors.verticalCenter: parent.verticalCenter
//        anchors.horizontalCenter: parent.horizontalCenter


        Text {
            id: hour
            font.family: fontHourOpenSans.name
            color: "#BBBCBE" //"#037E8C"
            anchors.horizontalCenter: parent.horizontalCenter
            function set() {
                hour.text = Qt.formatTime(new Date(),"HH:mm")
            }
            fontSizeMode: Text.Fit
            minimumPixelSize: 10
            opacity: 0.9
            font.pixelSize: 40
        }

        Timer {
            id: textTimer
            interval: 1000
            repeat: true
            running: true
            triggeredOnStart: true
            onTriggered: hour.set()
        }

        Item {
            width: 1
            height: 8
        }

        Text {
            id: date
            font.family: fontDateOpenSans.name
            color: "#BBBCBE" //"#037E8C"
            anchors.horizontalCenter: parent.horizontalCenter
            text: Qt.formatDateTime(new Date(),"dd/MM/yyyy")
            fontSizeMode: Text.Fit
            minimumPixelSize: 10
            font.pixelSize: 20
            opacity: 0.6
        }

        Item {
            width: 1
            height: -25
        }

        Image {
            id: logoPeugeot
            source: "qrc:logo.png"
            anchors.horizontalCenter: parent.horizontalCenter
            scale: 0.48
            fillMode: Image.PreserveAspectFit
            smooth: true
            layer.enabled: true
            layer.effect: Glow {
                id: glowLogo
                radius: 2
                samples: 5
                color: "#fdfdfd"
            }
        }
    }

    Arcs {
        id: arcLeft
        z: 1
        flip: false
        height: container.height * 0.7
        width: container.height * 0.12
        anchors.left: logoColumn.right
        anchors.leftMargin: - container.width * 0.0015
        anchors.verticalCenter: logoColumn.verticalCenter
    }

    Arcs {
        id: arcRight
        z: 1
        flip: true
        height: container.height * 0.7
        width: container.height * 0.12
        anchors.right: stackView.left
        anchors.rightMargin: - container.width * 0.004
        anchors.verticalCenter: stackView.verticalCenter
    }


    InfoStackView {
        id: stackView
        height: container.height * 0.57
        width: height/1.8
        anchors.right: container.right
        anchors.rightMargin: container.width * 0.04
        anchors.verticalCenter: logoColumn.verticalCenter
    }

    GaugeCentral {
        id: compteur
        anchors.centerIn: parent
        value: valueSource.kph
    }


//    Row {
//        id: bottom
//        width: parent.width
//        height: parent.height/6
//        anchors.bottom: parent.bottom
//        anchors.horizontalCenter: container.horizontalCenter
//        //anchors.centerIn: parent

//        Item {
//            width: 50
//            height: 50

//            Image {
//                id: absIconLow
//                anchors.horizontalCenter: parent.horizontalCenter
//                source: "qrc:abs_off.svg"
//                scale: 0.47
//                opacity: 0.2
//                smooth: true
//                fillMode: Image.PreserveAspectFit

//                states: State {
//                    name: "absState"; when: valueSource.temperature > 80
//                    PropertyChanges { target: absIconLow; opacity: 0}
//                    PropertyChanges { target: absIconHigh; opacity: 1}
//                }

//                transitions: Transition {
//                    NumberAnimation { properties: "opacity"; easing.type: Easing.InOutQuad; duration: 1000  }
//                }
//            }

//            Image {
//                id: absIconHigh
//                anchors.horizontalCenter: parent.horizontalCenter
//                source: "qrc:abs_on.svg"
//                scale: 0.47
//                opacity: 0
//                smooth: true
//                fillMode: Image.PreserveAspectFit
//            }
//        }

//        Item {
//            width: 18
//            height: 1
//        }

//        Item {
//            width: 50
//            height: 50

//            Image {
//                id: engineIconLow
//                anchors.horizontalCenter: parent.horizontalCenter
//                source: "qrc:engine_off.svg"
//                scale: 0.47
//                opacity: 0.2
//                smooth: true
//                fillMode: Image.PreserveAspectFit

//                states: State {
//                    name: "absState"; when: valueSource.temperature > 80
//                    PropertyChanges { target: engineIconLow; opacity: 0}
//                    PropertyChanges { target: engineIconHigh; opacity: 1}
//                }

//                transitions: Transition {
//                    NumberAnimation { properties: "opacity"; easing.type: Easing.InOutQuad; duration: 1000  }
//                }
//            }

//            Image {
//                id: engineIconHigh
//                anchors.horizontalCenter: parent.horizontalCenter
//                source: "qrc:engine_on.svg"
//                scale: 0.47
//                opacity: 0
//                smooth: true
//                fillMode: Image.PreserveAspectFit
//            }
//        }

//        Item {
//            width: 15
//            height: 1
//        }

//        Item {
//            width: 50
//            height: 50

//            Image {
//                id: fogIconLow
//                anchors.horizontalCenter: parent.horizontalCenter
//                source: "qrc:fog-light_off.svg"
//                scale: 0.47
//                opacity: 0.2
//                smooth: true
//                fillMode: Image.PreserveAspectFit

//                states: State {
//                    name: "absState"; when: valueSource.temperature > 80
//                    PropertyChanges { target: fogIconLow; opacity: 0}
//                    PropertyChanges { target: fogIconHigh; opacity: 1}
//                }

//                transitions: Transition {
//                    NumberAnimation { properties: "opacity"; easing.type: Easing.InOutQuad; duration: 1000  }
//                }
//            }

//            Image {
//                id: fogIconHigh
//                anchors.horizontalCenter: parent.horizontalCenter
//                source: "qrc:fog-light_on.svg"
//                scale: 0.47
//                opacity: 0
//                smooth: true
//                fillMode: Image.PreserveAspectFit
//            }
//        }

//        Item {
//            width: 13
//            height: 1
//        }

//        Item {
//            width: 50
//            height: 50

//            Image {
//                id: croisIconLow
//                anchors.horizontalCenter: parent.horizontalCenter
//                source: "qrc:low-beam_off.svg"
//                scale: 0.47
//                opacity: 0.2
//                smooth: true
//                fillMode: Image.PreserveAspectFit

//                states: State {
//                    name: "absState"; when: valueSource.temperature > 80
//                    PropertyChanges { target: croisIconLow; opacity: 0}
//                    PropertyChanges { target: croisIconHigh; opacity: 1}
//                }

//                transitions: Transition {
//                    NumberAnimation { properties: "opacity"; easing.type: Easing.InOutQuad; duration: 1000  }
//                }
//            }

//            Image {
//                id: croisIconHigh
//                anchors.horizontalCenter: parent.horizontalCenter
//                source: "qrc:low-beam_on.svg"
//                scale: 0.47
//                opacity: 0
//                smooth: true
//                fillMode: Image.PreserveAspectFit
//            }
//        }

//        Item {
//            width: 13
//            height: 1
//        }

//        Item {
//            width: 50
//            height: 50

//            Image {
//                id: routeIconLow
//                anchors.horizontalCenter: parent.horizontalCenter
//                source: "qrc:high-beam_off.svg"
//                scale: 0.47
//                opacity: 0.2
//                smooth: true
//                fillMode: Image.PreserveAspectFit

//                states: State {
//                    name: "absState"; when: valueSource.temperature > 80
//                    PropertyChanges { target: routeIconLow; opacity: 0}
//                    PropertyChanges { target: routeIconHigh; opacity: 1}
//                }

//                transitions: Transition {
//                    NumberAnimation { properties: "opacity"; easing.type: Easing.InOutQuad; duration: 1000  }
//                }
//            }

//            Image {
//                id: routeIconHigh
//                anchors.horizontalCenter: parent.horizontalCenter
//                source: "qrc:high-beam_on.svg"
//                scale: 0.47
//                opacity: 0
//                smooth: true
//                fillMode: Image.PreserveAspectFit
//            }
//        }

//        Item {
//            width: 13
//            height: 1
//        }

//        Item {
//            width: 50
//            height: 50

//            Image {
//                id: freinIconLow
//                anchors.horizontalCenter: parent.horizontalCenter
//                source: "qrc:brake-system-warning_off.svg"
//                scale: 0.47
//                opacity: 0.2
//                smooth: true
//                fillMode: Image.PreserveAspectFit

//                states: State {
//                    name: "absState"; when: valueSource.temperature > 80
//                    PropertyChanges { target: freinIconLow; opacity: 0}
//                    PropertyChanges { target: freinIconHigh; opacity: 1}
//                }

//                transitions: Transition {
//                    NumberAnimation { properties: "opacity"; easing.type: Easing.InOutQuad; duration: 1000  }
//                }
//            }

//            Image {
//                id: freinIconHigh
//                anchors.horizontalCenter: parent.horizontalCenter
//                source: "qrc:brake-system-warning_on.svg"
//                scale: 0.47
//                opacity: 0
//                smooth: true
//                fillMode: Image.PreserveAspectFit
//            }
//        }

//        Item {
//            width: 13
//            height: 1
//        }

//        Item {
//            width: 50
//            height: 50

//            Image {
//                id: batteryIconLow
//                anchors.horizontalCenter: parent.horizontalCenter
//                source: "qrc:battery_off.svg"
//                scale: 0.47
//                opacity: 0.2
//                smooth: true
//                fillMode: Image.PreserveAspectFit

//                states: State {
//                    name: "absState"; when: valueSource.temperature > 80
//                    PropertyChanges { target: batteryIconLow; opacity: 0}
//                    PropertyChanges { target: batteryIconHigh; opacity: 1}
//                }

//                transitions: Transition {
//                    NumberAnimation { properties: "opacity"; easing.type: Easing.InOutQuad; duration: 1000  }
//                }
//            }

//            Image {
//                id: batteryIconHigh
//                anchors.horizontalCenter: parent.horizontalCenter
//                source: "qrc:battery_on.svg"
//                scale: 0.47
//                opacity: 0
//                smooth: true
//                fillMode: Image.PreserveAspectFit
//            }
//        }

//        Item {
//            width: 14
//            height: 1
//        }

//        Item {
//            width: 50
//            height: 50

//            Image {
//                id: oilIconLow
//                anchors.horizontalCenter: parent.horizontalCenter
//                source: "qrc:car-oil_off.svg"
//                scale: 0.47
//                opacity: 0.2
//                smooth: true
//                fillMode: Image.PreserveAspectFit

//                states: State {
//                    name: "absState"; when: valueSource.temperature > 80
//                    PropertyChanges { target: oilIconLow; opacity: 0}
//                    PropertyChanges { target: oilIconHigh; opacity: 1}
//                }

//                transitions: Transition {
//                    NumberAnimation { properties: "opacity"; easing.type: Easing.InOutQuad; duration: 1000  }
//                }
//            }

//            Image {
//                id: oilIconHigh
//                anchors.horizontalCenter: parent.horizontalCenter
//                source: "qrc:car-oil_on.svg"
//                scale: 0.47
//                opacity: 0
//                smooth: true
//                fillMode: Image.PreserveAspectFit
//            }
//        }
//    }
}
