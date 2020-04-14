import QtQuick 2.9
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtGraphicalEffects 1.0

DashboardGaugeStyle {
    id: fuelGaugeStyle
    tickmarkInset: toPixels(0.04)
    minorTickmarkInset: tickmarkInset

    minimumValueAngle: -60
    maximumValueAngle: 60
    tickmarkStepSize: 1
    labelStepSize: 1
    labelInset: toPixels(-0.15)
    minorTickmarkCount: 5

//    needleLength: toPixels(0.85)
//    needleBaseWidth: toPixels(0.08)
//    needleTipWidth: toPixels(0.03)

    halfGauge: true

    property string icon: ""
    property real valueToColor: 0
    property color glowToColor: "transparent"
    property color minWarningColor: "transparent"
    property color maxWarningColor: "transparent"
    readonly property real minWarningStartAngle: minimumValueAngle - 90
    readonly property real maxWarningStartAngle: maximumValueAngle - 90

    needle: ScriptAction {
        script: fuelGaugeStyle.needle.destroy()
    }

    tickmark: Rectangle {
        implicitWidth: toPixels(0.06)
        antialiasing: true
        implicitHeight: toPixels(0.2)
        color: "#F2EFDC"
    }

    minorTickmark: Rectangle {
        implicitWidth: toPixels(0.03)
        antialiasing: true
        implicitHeight: toPixels(0.15)
        color: "#F2EFDC"
    }

    background: Item {
        Canvas {
            id: gasWidget
            anchors.fill: parent
            onPaint: {
                var ctx = getContext("2d");
                ctx.reset();

//                paintBackground(ctx);

                ctx.beginPath();
                ctx.lineWidth = fuelGaugeStyle.toPixels(0.152);
                if (valueToColor < 0.13) {
                    ctx.strokeStyle = "#F21927";
                    glowToColor = "#F24C27";
                }
                else {
                    ctx.strokeStyle = "#024959";
                    glowToColor = "#037E8C";
                }
                ctx.arc(outerRadius, outerRadius,
                    // Start the line in from the decorations, and account for the width of the line itself.
                    outerRadius - tickmarkInset - ctx.lineWidth / 2,
                    degToRad(minWarningStartAngle),
                    degToRad(minWarningStartAngle)+valueSource.fuel*(2*Math.PI/3), false);
                ctx.stroke();

                if (maxWarningColor != "transparent") {
                    ctx.beginPath();
                    ctx.lineWidth = fuelGaugeStyle.toPixels(0.08);
                    ctx.strokeStyle = maxWarningColor;
                    ctx.arc(outerRadius, outerRadius,
                        // Start the line in from the decorations, and account for the width of the line itself.
                        outerRadius - tickmarkInset - ctx.lineWidth / 2,
                        degToRad(maxWarningStartAngle - angleRange / (minorTickmarkCount + 1)),
                        degToRad(maxWarningStartAngle), false);
                    ctx.stroke();
                }
            }
        }

        ValueSource {
            onFuelChanged: gasWidget.requestPaint()
        }

        Image {
            id: gasIconFull
            source: "qrc:gas_blanc.png"
            anchors.bottom: parent.verticalCenter
            anchors.bottomMargin: toPixels(0.15)
            anchors.horizontalCenter: parent.horizontalCenter
            width: toPixels(0.37)
            height: width
            opacity: 0.8
            smooth: true
            fillMode: Image.PreserveAspectFit

            states: State {
                name: "heat"; when: valueToColor < 0.13
                PropertyChanges { target: gasIconFull; opacity: 0}
                PropertyChanges { target: gasIconEmpty; opacity: 1}
            }

            transitions: Transition {
                NumberAnimation { properties: "opacity"; easing.type: Easing.InOutQuad; duration: 1000  }
            }
        }

        Image {
            id: gasIconEmpty
            source: "qrc:gas_rouge.png"
            anchors.bottom: parent.verticalCenter
            anchors.bottomMargin: toPixels(0.15)
            anchors.horizontalCenter: parent.horizontalCenter
            width: toPixels(0.37)
            height: width
            opacity: 0
            smooth: true
            fillMode: Image.PreserveAspectFit
        }

        Glow {
            anchors.fill: parent
            radius: 1
            samples: 17
            color: glowToColor
            source: gasWidget
        }

        DropShadow {
            anchors.fill: parent
            horizontalOffset: 3
            verticalOffset: 3
            radius: 8.0
            samples: 17
            color: "#80000000"
            source: gasWidget
        }
    }
}
