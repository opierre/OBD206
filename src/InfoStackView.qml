import QtQuick 2.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.0

Item {

    ValueSource {
        id: valueSource
    }

    Rectangle {
        id: containerSwipe
        height: 240
        width: 150
        color: "transparent"
        clip: true

        SwipeView {
            id: view
            orientation: Qt.Vertical

            currentIndex: 1
            anchors.fill: parent

            TumblerKm {
                id: tumblerKm
                valueTumblerKm: valueSource.kms

                onValueTumblerKmChanged: tumblerKm.updateTumblerKm()
            }

            Thermometer {
                id: thermCar
                valueTherm: valueSource.temperature
//                anchors.right: parent.right
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }

            ProgressBarKm {
                id: progressKm
                valueKmsLeft: valueSource.kmsLeft
            }

        }
    }


}
