import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0

Item {
    property real valueKmsLeft: 0

    ColumnLayout {
        id: columnTherm
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 0

        FontLoader {
            id: fontValKmOpenSans
            source:"qrc:OpenSans-ExtraBold.ttf"
        }

        FontLoader {
            id: fontKmLeftOpenSans
            source:"qrc:OpenSans-Light.ttf"
        }

        Text {
            id: valKM
            font.family: fontValKmOpenSans.name
            color: "#BBBCBE"
        //            anchors.top: canvasTherm.bottom
        //            anchors.horizontalCenter: columnTherm.horizontalCenter
            Layout.alignment: Qt.AlignHCenter
            text: valueKmsLeft.toFixed(0).toString()
            opacity: 0.8
            fontSizeMode: Text.Fit
            minimumPixelSize: 10
            font.pixelSize: 40
        }

        Text {
            id: kmLeft
            font.family: fontKmLeftOpenSans.name
            color: "#BBBCBE"
        //            anchors.top: canvasTherm.bottom
        //            anchors.horizontalCenter: columnTherm.horizontalCenter
            Layout.alignment: Qt.AlignHCenter
            text: "km left"
            opacity: 0.6
            fontSizeMode: Text.Fit
            minimumPixelSize: 10
            font.pixelSize: 20
        }

        Item {
            height: 20
            width: 1
        }

        ProgressBar {
            id: progress
            value: (valueKmsLeft/800)
            background: Rectangle {
                id: backProgress
                color: "#41454A"
                implicitWidth: 120
                implicitHeight: 5
                radius: 10
            }

            contentItem: Item {

                Rectangle {
                    id: bar
                    x: 0
                    y: -1
                    implicitWidth: progress.value * backProgress.implicitWidth
                    implicitHeight: 7
                    radius: 20
                }

                LinearGradient {
                    anchors.fill: bar
                    start: Qt.point(10, 0)
                    end: Qt.point(140, 0)
                    source: bar
                    gradient: Gradient {
                        GradientStop { position: 0.00*progress.value; color: "#03FFCF" }
                        GradientStop { position: 0.50*progress.value; color: "#03FFCF" }
                        GradientStop { position: 1.00*progress.value; color: "#03FFCF" }
                    }
                }
            }
        }
    }
}
