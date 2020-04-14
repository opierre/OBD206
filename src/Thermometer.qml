import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.0

Item {
    property real valueTherm: 0

    ColumnLayout {
        id: columnTherm
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: -20

        Rectangle {
            id: canvasRect
            height: 160
            width: 170
            color: "transparent"

            Canvas {
                id: canvasTherm
                anchors.fill: parent
        //        anchors.horizontalCenter: parent.horizontalCenter

                property int hvalue: 0
                onHvalueChanged: requestPaint()

                scale: 0.6

                onPaint: {
                    var ctx = getContext("2d");
                    ctx.reset();

                    ctx.transform(0.880229, 0.000000, 0.000000, 0.919448, -0.000000, -8.425417);

                    ctx.beginPath();
                    var my_gradient_stroke = ctx.createLinearGradient(0, 170, 0, 0);
                    my_gradient_stroke.addColorStop(0.00, 'transparent');
                    my_gradient_stroke.addColorStop(1.00, "#41454A");
                    ctx.strokeStyle = my_gradient_stroke;

                    ctx.miterLimit = 4;
                    ctx.lineWidth = 2.664549;
                    ctx.moveTo(185.358070, 147.322000);
                    ctx.bezierCurveTo(181.898730, 145.250000, 177.467150, 146.473000, 175.464730, 150.061000);
                    ctx.bezierCurveTo(170.894110, 158.250000, 162.392030, 163.336000, 153.278810, 163.336000);
                    ctx.bezierCurveTo(144.162680, 163.336000, 135.659640, 158.249000, 131.089030, 150.061000);
                    ctx.bezierCurveTo(129.794310, 147.743000, 127.404730, 146.315000, 124.819150, 146.315000);
                    ctx.bezierCurveTo(122.233580, 146.315000, 119.844000, 147.744000, 118.550250, 150.063000);
                    ctx.bezierCurveTo(113.983490, 158.251000, 105.482380, 163.336000, 96.367209, 163.336000);
                    ctx.bezierCurveTo(87.253979, 163.336000, 78.750937, 158.248000, 74.175494, 150.059000);
                    ctx.bezierCurveTo(72.880777, 147.742000, 70.489266, 146.315000, 67.904658, 146.315000);
                    ctx.bezierCurveTo(65.319084, 146.315000, 62.930469, 147.743000, 61.635752, 150.061000);
                    ctx.bezierCurveTo(57.064171, 158.250000, 48.563060, 163.336000, 39.448865, 163.336000);
                    ctx.bezierCurveTo(30.332738, 163.336000, 21.829696, 158.249000, 17.258115, 150.061000);
                    ctx.bezierCurveTo(15.256660, 146.474000, 10.826042, 145.252000, 7.364772, 147.322000);
                    ctx.bezierCurveTo(3.902536, 149.396000, 2.718849, 153.983000, 4.721269, 157.569000);
                    ctx.bezierCurveTo(11.872629, 170.378000, 25.178969, 178.337000, 39.448865, 178.337000);
                    ctx.bezierCurveTo(50.231422, 178.337000, 60.464617, 173.792000, 67.907555, 166.042000);
                    ctx.bezierCurveTo(75.352423, 173.792000, 85.585618, 178.337000, 96.367209, 178.337000);
                    ctx.bezierCurveTo(107.149770, 178.337000, 117.381040, 173.794000, 124.821090, 166.046000);
                    ctx.bezierCurveTo(132.264020, 173.793000, 142.497220, 178.337000, 153.279770, 178.337000);
                    ctx.bezierCurveTo(167.546770, 178.337000, 180.853110, 170.379000, 188.004470, 157.569000);
                    ctx.bezierCurveTo(190.004960, 153.983000, 188.820310, 149.396000, 185.358070, 147.322000);

                    // #path4
                    ctx.moveTo(131.088060, 115.350000);
                    ctx.bezierCurveTo(129.086600, 111.762000, 124.654050, 110.537000, 121.194710, 112.611000);
                    ctx.bezierCurveTo(117.732480, 114.684000, 116.547820, 119.272000, 118.550250, 122.858000);
                    ctx.bezierCurveTo(125.700640, 135.668000, 139.008910, 143.626000, 153.278810, 143.626000);
                    ctx.bezierCurveTo(167.546770, 143.626000, 180.852140, 135.668000, 188.003510, 122.858000);
                    ctx.bezierCurveTo(190.004960, 119.272000, 188.821270, 114.684000, 185.359040, 112.611000);
                    ctx.bezierCurveTo(181.896800, 110.538000, 177.467150, 111.764000, 175.465690, 115.350000);
                    ctx.bezierCurveTo(170.895080, 123.538000, 162.393960, 128.625000, 153.279770, 128.625000);
                    ctx.bezierCurveTo(144.161720, 128.626000, 135.659640, 123.539000, 131.088060, 115.350000);

                    // #path6
                    ctx.moveTo(39.449829, 143.626000);
                    ctx.bezierCurveTo(53.716828, 143.626000, 67.023168, 135.669000, 74.175494, 122.859000);
                    ctx.bezierCurveTo(76.177914, 119.273000, 74.994228, 114.685000, 71.532957, 112.612000);
                    ctx.bezierCurveTo(68.071687, 110.540000, 63.641068, 111.763000, 61.639614, 115.349000);
                    ctx.bezierCurveTo(57.067068, 123.538000, 48.564025, 128.625000, 39.450795, 128.625000);
                    ctx.bezierCurveTo(30.334669, 128.625000, 21.831626, 123.538000, 17.260046, 115.350000);
                    ctx.bezierCurveTo(15.257626, 111.763000, 10.828938, 110.537000, 7.366702, 112.611000);
                    ctx.bezierCurveTo(3.904467, 114.684000, 2.720780, 119.272000, 4.722234, 122.858000);
                    ctx.bezierCurveTo(11.872629, 135.668000, 25.178969, 143.626000, 39.449829, 143.626000);

                    var my_gradient = ctx.createLinearGradient(0, 170, 0, 0);
                    my_gradient.addColorStop(0.00, "#03FFCF");
                    my_gradient.addColorStop(0.40, "#3A92E7");
                    my_gradient.addColorStop(0.85, "#7025FF");

                    // #path8
                    ctx.moveTo(96.528446, 155.021000);
                    ctx.bezierCurveTo(107.137230, 155.021000, 115.735850, 146.114000, 115.735850, 135.125000);
                    ctx.bezierCurveTo(115.735850, 126.793000, 110.785800, 119.667000, 103.768640, 116.704000);
                    ctx.lineTo(103.768640, 101.124000);
                    ctx.lineTo(128.364420, 101.124000);
                    ctx.bezierCurveTo(132.364430, 101.124000, 135.605570, 97.767000, 135.605570, 93.624000);
                    ctx.bezierCurveTo(135.605570, 89.481000, 132.364430, 86.124000, 128.364420, 86.124000);
                    ctx.lineTo(103.768640, 86.124000);
                    ctx.lineTo(103.768640, 73.357000);
                    ctx.lineTo(128.364420, 73.357000);
                    ctx.bezierCurveTo(132.364430, 73.357000, 135.605570, 70.000000, 135.605570, 65.857000);
                    ctx.bezierCurveTo(135.605570, 61.714000, 132.364430, 58.357000, 128.364420, 58.357000);
                    ctx.lineTo(103.768640, 58.357000);
                    ctx.lineTo(103.768640, 45.588000);
                    ctx.lineTo(128.364420, 45.588000);
                    ctx.bezierCurveTo(132.364430, 45.588000, 135.605570, 42.231000, 135.605570, 38.088000);
                    ctx.bezierCurveTo(135.605570, 33.945000, 132.364430, 30.588000, 128.364420, 30.588000);
                    ctx.lineTo(103.768640, 30.588000);
                    ctx.lineTo(103.768640, 21.014000);
                    ctx.bezierCurveTo(103.768640, 16.871000, 100.527490, 13.514000, 96.528446, 13.514000);
                    ctx.bezierCurveTo(92.529400, 13.514000, 89.287294, 16.871000, 89.287294, 21.014000);
                    ctx.lineTo(89.287294, 116.704000);
                    ctx.bezierCurveTo(82.269171, 119.667000, 77.319120, 126.793000, 77.319120, 135.125000);
                    ctx.bezierCurveTo(77.318154, 146.114000, 85.919677, 155.021000, 96.528446, 155.021000);
                    ctx.stroke();
                    ctx.clip();
                    ctx.fillStyle = my_gradient;
                    ctx.fillRect(0, 180, 200, -hvalue);
                }
            }
        }

        FontLoader {
            id: fontThermOpenSans
            source:"qrc:OpenSans-ExtraBold.ttf"
        }

        FontLoader {
            id: fontDegOpenSans
            source:"qrc:OpenSans-Light.ttf"
        }

        RowLayout{
            Layout.alignment: Qt.AlignHCenter
            Text {
                id: tempLabel
                font.family: fontThermOpenSans.name
                color: "#BBBCBE"
                text: valueTherm.toFixed(0).toString()
                opacity: 0.8
                fontSizeMode: Text.Fit
                minimumPixelSize: 10
                font.pixelSize: 40
            }
            Text {
                id: tempLabelC
                font.family: fontDegOpenSans.name
                color: "#BBBCBE"
                text: " °C"
                opacity: 0.6
                fontSizeMode: Text.Fit
                minimumPixelSize: 10
                font.pixelSize: 20
            }
        }
    }

    Timer {
        id: timerTherm
        interval: 2;
        running: true;
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            if(canvasTherm.hvalue >= 1.5*canvasTherm.height)
            {
                timerTherm.stop()
            }
            canvasTherm.hvalue = valueTherm*1.4
        }
    }

}
