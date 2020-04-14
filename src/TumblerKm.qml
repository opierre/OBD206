import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.0

Item {
    property real valueTumblerKm: 0

    function updateTumblerKm()
    {
        tumbler.setCurrentIndexAt(0, (valueTumblerKm/100000));
        tumbler.setCurrentIndexAt(1, (valueTumblerKm/10000)-Math.floor(valueTumblerKm/100000)*10);
        tumbler.setCurrentIndexAt(2, (valueTumblerKm/1000)-Math.floor(valueTumblerKm/10000)*10);
        tumbler.setCurrentIndexAt(3, (valueTumblerKm/100)-Math.floor(valueTumblerKm/1000)*10);
        tumbler.setCurrentIndexAt(4, (valueTumblerKm/10)-Math.floor(valueTumblerKm/100)*10);
        tumbler.setCurrentIndexAt(5, (valueTumblerKm/1)-Math.floor(valueTumblerKm/10)*10);
    }


    ColumnLayout {
        id: columnTherm
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: -32

        FontLoader {
            id: fontTumblerOpenSans
            source:"qrc:OpenSans-Light.ttf"
        }

        FontLoader {
            id: digitalFont
            source:"qrc:digital-7.ttf"
        }

        Rectangle {
            id: canvasKm
            height: 190
            width: 170
            color: "transparent"

            Tumbler {
                id: tumbler
                enabled: false
                scale: 0.4
                implicitHeight: 180
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter

                TumblerColumn {
                    model: 10
                    width: 50
                }
                TumblerColumn {
                    model: 10
                    width: 50
                }
                TumblerColumn {
                    model: 10
                    width: 50
                }
                TumblerColumn {
                    model: 10
                    width: 50
                }
                TumblerColumn {
                    model: 10
                    width: 50
                }
                TumblerColumn {
                    model: 10
                    width: 50
                }

                style: TumblerStyle {
                    id: tumblerStyle

                    background: Rectangle { color: "transparent"}

                    visibleItemCount: 2

                    columnForeground: Rectangle
                    {
                        opacity: 0.30
                        radius: 10
                        gradient: Gradient {
                            GradientStop { position: 0.00; color: "#21262E" }
                            GradientStop { position: 0.12; color: "#3F4348" }
                            GradientStop { position: 0.24; color: "#8D8E8F" }
                            GradientStop { position: 0.45; color: "#BBBCBE" }
                            GradientStop { position: 0.55; color: "#BBBCBE" }
                            GradientStop { position: 0.76; color: "#8D8E8F" }
                            GradientStop { position: 0.88; color: "#3F4348" }
                            GradientStop { position: 1.00; color: "#21262E" }
                        }
                    }

                    separator: Rectangle {
                        implicitWidth: 5
                        opacity: 1
                        radius: 10
                        gradient: Gradient {
                            GradientStop { position: 0.00; color: "#21262E" }
                            GradientStop { position: 0.5; color: "#3F4348" }
                            GradientStop { position: 1.00; color: "#21262E" }
                        }
                    }

                    delegate: Item {
                        implicitHeight: (tumbler.height - padding.top - padding.bottom) / tumblerStyle.visibleItemCount
                        Text {
                            id: label

                            text: styleData.value
                            color: styleData.current ? "#03FFCF" : "#015242"
                            opacity: 0.4 + Math.max(0, 1 - Math.abs(styleData.displacement)) * 0.6
                            anchors.centerIn: parent
                            font.pixelSize: 65
                            font.family: digitalFont.name
                            font.bold: false
                        }
                    }
                }
            }

        }


        Text {
            id: tempLabel
            font.family: fontTumblerOpenSans.name
            color: "#BBBCBE"
//            anchors.top: canvasTherm.bottom
//            anchors.horizontalCenter: columnTherm.horizontalCenter
            Layout.alignment: Qt.AlignHCenter
            text: "kilometers"
            opacity: 0.6
            fontSizeMode: Text.Fit
            minimumPixelSize: 10
            font.pixelSize: 25
        }
    }
}
