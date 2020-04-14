import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.0

Item {
    property string legend: "legend"
    property real value: 0
    property bool flip: false

    Canvas {
        id: canvasArc
        anchors.fill: parent

        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();

            ctx.save();
            ctx.beginPath();

            ctx.lineWidth = 4.664549;
            ctx.lineCap = "round";

            if (flip)
            {
                var my_gradient_right = ctx.createLinearGradient(0, parent.height, 0, 0);
                my_gradient_right.addColorStop(0.00, "#0D192E");
//                my_gradient_right.addColorStop(0.50, "#3A92E7");
                my_gradient_right.addColorStop(1.00, "#1E50BA");
                ctx.strokeStyle = my_gradient_right;

                ctx.moveTo(50, 10);
                ctx.bezierCurveTo(0, 100, 0, 200, 50, 300);
            }else
            {
                var my_gradient_left = ctx.createLinearGradient(0, parent.height, 0, 0);
                my_gradient_left.addColorStop(1.00, "#0D192E");
//                my_gradient_left.addColorStop(0.05, "#3A92E7");
                my_gradient_left.addColorStop(0.00, "#1E50BA");
                ctx.strokeStyle = my_gradient_left;

                ctx.moveTo(2, 10);
                ctx.bezierCurveTo(52, 100, 52, 200, 2, 300);
            }

            ctx.stroke();
            ctx.restore();

        }
    }

    Timer{
        interval: 25
        running: true
        repeat: true
        property bool _plus: true
        onTriggered: {
            if(_plus)
            {
                 canvasArrow.index++;
                 if(canvasArrow.index > 200)
                     _plus = false;
            }
            else
            {
                canvasArrow.index--;
                if(canvasArrow.index < 0)
                    _plus = true;
            }
        }
    }

    Rectangle{
        id: rectangleArrow
        anchors.fill: canvasArrow
        color:"transparent"
        border.color: "transparent"

        Canvas {
            id: arrow
            width: 171
            height: 293

            scale: 0.04
            anchors.horizontalCenter: rectangleArrow.right
            anchors.verticalCenter: rectangleArrow.top

            opacity: 0.8
            rotation: (flip == true)? 180:0

            onPaint: {
                var ctx = getContext("2d");
                ctx.reset();

                ctx.beginPath();
                var my_gradient = ctx.createLinearGradient(0, 170, 0, 0);
                my_gradient.addColorStop(1.00, "#19212A");
                my_gradient.addColorStop(1.00, "#41454A");

                ctx.strokeStyle = 'rgba(65, 69, 74, 1)';

                ctx.moveTo(0,0);
                ctx.lineTo(170.362,0);
                ctx.lineTo(170.362,292.362);
                ctx.lineTo(0,292.362);
                ctx.closePath();
                ctx.clip();
                ctx.translate(0,0);
                ctx.translate(0,0);
                ctx.scale(1,1);
                ctx.translate(0,0);
                ctx.lineCap = 'butt';
                ctx.lineJoin = 'miter';
                ctx.miterLimit = 4;
                ctx.save();
                ctx.restore();
                ctx.save();
                ctx.restore();
                ctx.save();
                ctx.transform(0,0.96228869,-0.97225891,0,223.67588,5.7032698);
                ctx.save();
                ctx.beginPath();
                ctx.moveTo(286.935,69.377);
                ctx.bezierCurveTo(283.321,65.75999999999999,279.037,63.952999999999996,274.087,63.952999999999996);
                ctx.lineTo(18.274,63.952999999999996);
                ctx.bezierCurveTo(13.322000000000001,63.952999999999996,9.041,65.75999999999999,5.424000000000001,69.377);
                ctx.bezierCurveTo(1.807,72.998,0,77.279,0,82.228);
                ctx.bezierCurveTo(0,87.17599999999999,1.807,91.457,5.424,95.07499999999999);
                ctx.lineTo(133.331,222.98199999999997);
                ctx.bezierCurveTo(136.952,226.59899999999996,141.23299999999998,228.40999999999997,146.18099999999998,228.40999999999997);
                ctx.bezierCurveTo(151.129,228.40999999999997,155.414,226.59899999999996,159.028,222.98199999999997);
                ctx.lineTo(286.935,95.074);
                ctx.bezierCurveTo(290.548,91.457,292.362,87.176,292.362,82.227);
                ctx.bezierCurveTo(292.362,77.279,290.548,72.998,286.935,69.37700000000001);
                ctx.closePath();
                ctx.fillStyle = my_gradient;
                ctx.fill();
                ctx.stroke();
                ctx.restore();
                ctx.restore();
                ctx.restore();
            }
        }
    }

    Canvas {

        id: canvasArrow
        width: 10
        height: 10

        rotation: (flip == true)? 180:0

        scale: 0.06

        property int index: 1
        property real t: index/200
        property real x0: (flip == true)? 50  : 23
        property real y0: 10
        property real x1: (flip == true)? 0   : 73
        property real y1: 100
        property real x2: (flip == true)? 0   : 73
        property real y2: 200
        property real x3: (flip == true)? 50  : 23
        property real y3: 300
        x: (1-t)*((1-t)*((1-t)*x0+t*x1)+t*((1-t)*x1+t*x2))+t*((1-t)*((1-t)*x1+t*x2)+t*((1-t)*x2+t*x3)) - 20
        y: (1-t)*((1-t)*((1-t)*y0+t*y1)+t*((1-t)*y1+t*y2))+t*((1-t)*((1-t)*y1+t*y2)+t*((1-t)*y2+t*y3))

//        (1-t)*((1-t)*((1-t)*50+t*0)+t*((1-t)*0+t*0))+t*((1-t)*((1-t)*0+t*0)+t*((1-t)*0+t*50))
//        (1-t)*((1-t)*((1-t)*10+t*100)+t*((1-t)*100+t*200))+t*((1-t)*((1-t)*100+t*200)+t*((1-t)*200+t*300))
        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();

            ctx.translate(0,0);
            ctx.beginPath();
            var my_gradient = ctx.createLinearGradient(0, 170, 0, 0);
            my_gradient.addColorStop(1.00, "#19212A");
            my_gradient.addColorStop(1.00, "#41454A");

            ctx.strokeStyle = 'rgba(65, 69, 74, 1)';

            ctx.moveTo(0,0);
            ctx.lineTo(170.362,0);
            ctx.lineTo(170.362,292.362);
            ctx.lineTo(0,292.362);
            ctx.closePath();
            ctx.clip();
            ctx.translate(0,0);
            ctx.translate(0,0);
            ctx.scale(1,1);
            ctx.translate(0,0);
            ctx.lineCap = 'butt';
            ctx.lineJoin = 'miter';
            ctx.miterLimit = 4;
            ctx.save();
            ctx.restore();
            ctx.save();
            ctx.restore();
            ctx.save();
            ctx.transform(0,0.96228869,-0.97225891,0,223.67588,5.7032698);
            ctx.save();
            ctx.beginPath();
            ctx.moveTo(286.935,69.377);
            ctx.bezierCurveTo(283.321,65.75999999999999,279.037,63.952999999999996,274.087,63.952999999999996);
            ctx.lineTo(18.274,63.952999999999996);
            ctx.bezierCurveTo(13.322000000000001,63.952999999999996,9.041,65.75999999999999,5.424000000000001,69.377);
            ctx.bezierCurveTo(1.807,72.998,0,77.279,0,82.228);
            ctx.bezierCurveTo(0,87.17599999999999,1.807,91.457,5.424,95.07499999999999);
            ctx.lineTo(133.331,222.98199999999997);
            ctx.bezierCurveTo(136.952,226.59899999999996,141.23299999999998,228.40999999999997,146.18099999999998,228.40999999999997);
            ctx.bezierCurveTo(151.129,228.40999999999997,155.414,226.59899999999996,159.028,222.98199999999997);
            ctx.lineTo(286.935,95.074);
            ctx.bezierCurveTo(290.548,91.457,292.362,87.176,292.362,82.227);
            ctx.bezierCurveTo(292.362,77.279,290.548,72.998,286.935,69.37700000000001);
            ctx.closePath();
            ctx.fillStyle = my_gradient;
            ctx.fill();
            ctx.stroke();
            ctx.restore();
            ctx.restore();
            ctx.restore();
        }
    }

    FontLoader {
        id: fontLegendOpenSans
        source:"qrc:OpenSans-Light.ttf"
    }

    Text {
        id: legendText
        font.family: fontLegendOpenSans.name
        color: "#BBBCBE"
        anchors.top: canvasArc.bottom
        anchors.topMargin: 10
        anchors.left: canvasArc.right
        anchors.leftMargin: -42
        text: flip ?"":"RPM\nx1000"
        opacity: 0.5
        fontSizeMode: Text.Fit
        minimumPixelSize: 10
        font.pixelSize: 12
    }

    Text {
        id: legendFull
        font.family: fontLegendOpenSans.name
        color: flip?"#1E50BA":"#142747"
        anchors.top: canvasArc.top
        anchors.topMargin: -14
        anchors.left: canvasArc.right
        anchors.leftMargin: flip?-12:-45
        text: flip ?"F":"5"
        opacity: 0.8
        fontSizeMode: Text.Fit
        minimumPixelSize: 10
        font.pixelSize: 10
    }

    Image {
        id: legendImage
        anchors.top: canvasArc.bottom
        anchors.topMargin: -8
        anchors.left: canvasArc.right
        anchors.leftMargin: -52
        opacity: 0.4
        scale: 0.38
        source: flip?"qrc:gas-station.png":""
    }
}
