import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0

Item {
    height: 400
    width: 400

    ValueSource {
        id: valueSource
    }

    CircularGauge {
        id: speedometerLeft
        value: valueSource.kph
        anchors.verticalCenter: parent.verticalCenter
        maximumValue: 80
        // We set the width to the height, because the height will always be
        // the more limited factor. Also, all circular controls letterbox
        // their contents to ensure that they remain circular. However, we
        // don't want to extra space on the left and right of our gauges,
        // because they're laid out horizontally, and that would create
        // large horizontal gaps between gauges on wide screens.
        width: height
        height: parent.height * 0.8

        style: DashboardGaugeStyle {
            minimumValueAngle: -130
            maximumValueAngle: -45
        }
    }

    CircularGauge {
        id: speedometerRight
        value: valueSource.kph
        anchors.verticalCenter: parent.verticalCenter
        minimumValue: 80
        maximumValue: 160
        // We set the width to the height, because the height will always be
        // the more limited factor. Also, all circular controls letterbox
        // their contents to ensure that they remain circular. However, we
        // don't want to extra space on the left and right of our gauges,
        // because they're laid out horizontally, and that would create
        // large horizontal gaps between gauges on wide screens.
        width: height
        height: parent.height * 0.8

        style: DashboardGaugeStyle {
            minimumValueAngle: 45
            maximumValueAngle: 130
        }
    }


}
