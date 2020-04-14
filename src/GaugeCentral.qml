import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0

Item {
    property real value: 0
    property real startingPoint0: 0.97
    property real startingPoint1: 0.94
    property real startingPoint2: 0.91
    property real startingPoint3: 0.88
    property real startingPoint4: 0.85
    property int  speedMax: 140

    FontLoader {
        id: fontValLegend
        source:"qrc:Neo_Sans_Std_Regular.ttf"
    }

    FontLoader {
        id: fontValKm
        source:"qrc:Neo_Sans_Std_Medium.ttf"
    }

    Rectangle {
        id: canvasRect
        height: parent.height
        width: parent.width
        color: "transparent"

        property int offset : 2
        property int size   : 50

        Item { // outter circle
            id: circleOutter
            width: 285
            height: width
            anchors.centerIn: parent

            Canvas {
                opacity: 0.35
                antialiasing: true
                contextType: "2d"
                anchors.fill: parent
                property int hvalue: value
                property real spoint0: startingPoint0
                property real spoint1: startingPoint1
                property real spoint2: startingPoint2
                property real spoint3: startingPoint3
                property real spoint4: startingPoint4

                onPaint: {
                    if (context) {
                        if(startingPoint0 >= 2.0)
                            startingPoint0 = 0.00;
                        else if(startingPoint1 >= 2.0)
                            startingPoint1 = 0.00;
                        else if(startingPoint2 >= 2.0)
                            startingPoint2 = 0.00;
                        else if(startingPoint3 >= 2.0)
                            startingPoint3 = 0.00;
                        else if(startingPoint4 >= 2.0)
                            startingPoint4 = 0.00;
                        else
                        {
                            startingPoint0 = startingPoint0 + 0.01;
                            startingPoint1 = startingPoint1 + 0.01;
                            startingPoint2 = startingPoint2 + 0.01;
                            startingPoint3 = startingPoint3 + 0.01;
                            startingPoint4 = startingPoint4 + 0.01;
                        }

                        context.reset ();
                        context.globalCompositeOperation = "source-over";
                        context.fillStyle = "black";
                        context.beginPath ();
                        context.ellipse(0, 0, width, height);
                        context.fill ();

                        context.globalCompositeOperation = "source-over";
                        context.lineWidth = 8;
                        context.lineCap = "round";
                        var x1 = (width/2)-(width/2.81)*Math.cos((1-spoint0)*Math.PI);
                        var y1 = (width/2)+(width/2.81)*Math.sin((1-spoint0)*Math.PI);
                        var x2 = (width/2)+(width/2.81)*Math.sin((hvalue*2*Math.PI/speedMax)*0.97+(spoint0-1.5)*Math.PI);
                        var y2 = (width/2)-(width/2.81)*Math.cos((hvalue*2*Math.PI/speedMax)*0.97+(spoint0-1.5)*Math.PI);
                        var gradient_1 = context.createLinearGradient(x1, y1, x2, y2);
                        gradient_1.addColorStop(0.00, "transparent");
                        gradient_1.addColorStop(1.00, "#7025FF");
                        context.strokeStyle = gradient_1;
                        context.beginPath ();                   
                        context.arc(width/2, height/2, width/2.81, spoint0*Math.PI, (hvalue*2*Math.PI/speedMax)*0.97+spoint0*Math.PI, false);
                        context.stroke();

                        context.globalCompositeOperation = "source-over";
                        context.lineWidth = 8;
                        context.lineCap = "round";
                        x1 = (width/2)-(width/2.59)*Math.cos((1-spoint1)*Math.PI);
                        y1 = (width/2)+(width/2.59)*Math.sin((1-spoint1)*Math.PI);
                        x2 = (width/2)+(width/2.59)*Math.sin((hvalue*2*Math.PI/speedMax)*0.94+(spoint1-1.5)*Math.PI);
                        y2 = (width/2)-(width/2.59)*Math.cos((hvalue*2*Math.PI/speedMax)*0.94+(spoint1-1.5)*Math.PI);
                        var gradient_2 = context.createLinearGradient(x1, y1, x2, y2);
                        gradient_2.addColorStop(0.00, "transparent");
                        gradient_2.addColorStop(1.00, "#5C4BF6");
                        context.strokeStyle = gradient_2;
                        context.beginPath ();
                        context.arc(width/2, height/2, width/2.59, spoint1*Math.PI, (hvalue*2*Math.PI/speedMax)*0.94+spoint1*Math.PI, false);
                        context.stroke();

                        context.globalCompositeOperation = "source-over";
                        context.lineWidth = 8;
                        context.lineCap = "round";
                        x1 = (width/2)-(width/2.40)*Math.cos((1-spoint2)*Math.PI);
                        y1 = (width/2)+(width/2.40)*Math.sin((1-spoint2)*Math.PI);
                        x2 = (width/2)+(width/2.40)*Math.sin((hvalue*2*Math.PI/speedMax)*0.91+(spoint2-1.5)*Math.PI);
                        y2 = (width/2)-(width/2.40)*Math.cos((hvalue*2*Math.PI/speedMax)*0.91+(spoint2-1.5)*Math.PI);
                        var gradient_3 = context.createLinearGradient(x1, y1, x2, y2);
                        gradient_3.addColorStop(0.00, "transparent");
                        gradient_3.addColorStop(1.00, "#3598E5");
                        context.strokeStyle = gradient_3;
                        context.beginPath ();
                        context.arc(width/2, height/2, width/2.40, spoint2*Math.PI, (hvalue*2*Math.PI/speedMax)*0.91+spoint2*Math.PI, false);
                        context.stroke();

                        context.globalCompositeOperation = "source-over";
                        context.lineWidth = 8;
                        context.lineCap = "round";
                        x1 = (width/2)-(width/2.24)*Math.cos((1-spoint3)*Math.PI);
                        y1 = (width/2)+(width/2.24)*Math.sin((1-spoint3)*Math.PI);
                        x2 = (width/2)+(width/2.24)*Math.sin((hvalue*2*Math.PI/speedMax)*0.88+(spoint3-1.5)*Math.PI);
                        y2 = (width/2)-(width/2.24)*Math.cos((hvalue*2*Math.PI/speedMax)*0.88+(spoint3-1.5)*Math.PI);
                        var gradient_4 = context.createLinearGradient(x1, y1, x2, y2);
                        gradient_4.addColorStop(0.00, "transparent");
                        gradient_4.addColorStop(1.00, "#22BEDC");
                        context.strokeStyle = gradient_4;
                        context.beginPath ();
                        context.arc(width/2, height/2, width/2.24, spoint3*Math.PI, (hvalue*2*Math.PI/speedMax)*0.88+spoint3*Math.PI, false);
                        context.stroke();

                        context.globalCompositeOperation = "source-over";
                        context.lineWidth = 8;
                        context.lineCap = "round";
                        x1 = (width/2)-(width/2.10)*Math.cos((1-spoint4)*Math.PI);
                        y1 = (width/2)+(width/2.10)*Math.sin((1-spoint4)*Math.PI);
                        x2 = (width/2)+(width/2.10)*Math.sin((hvalue*2*Math.PI/speedMax)*0.85+(spoint4-1.5)*Math.PI);
                        y2 = (width/2)-(width/2.10)*Math.cos((hvalue*2*Math.PI/speedMax)*0.85+(spoint4-1.5)*Math.PI);
                        var gradient_5 = context.createLinearGradient(x1, y1, x2, y2);
                        gradient_5.addColorStop(0.00, "transparent");
                        gradient_5.addColorStop(1.00, "#03FFCF");
                        context.strokeStyle = gradient_5;
                        context.beginPath ();
                        context.arc(width/2, height/2, width/2.10, spoint4*Math.PI, (hvalue*2*Math.PI/speedMax)*0.85+spoint4*Math.PI, false);
                        context.stroke();

                        context.globalCompositeOperation = "xor";
                        context.fillStyle = "black";
                        context.beginPath ();
                        context.ellipse(circleInner.x, circleInner.y, circleInner.width, circleInner.height);
                        context.fill ();
                    }
                }
//                onHvalueChanged:    requestPaint()
                onSpoint0Changed:   requestPaint()
            }

            Timer {
                id: timerStartingPoint
                interval: 1
                running: true
                repeat: true
                triggeredOnStart: true
                onTriggered: {
                    if(startingPoint0 >= 2.0)
                        startingPoint0 = 0.00;
                    else if(startingPoint1 >= 2.0)
                        startingPoint1 = 0.00;
                    else if(startingPoint2 >= 2.0)
                        startingPoint2 = 0.00;
                    else if(startingPoint3 >= 2.0)
                        startingPoint3 = 0.00;
                    else if(startingPoint4 >= 2.0)
                        startingPoint4 = 0.00;
                    else
                    {
                        startingPoint0 = startingPoint0 + 0.01;
                        startingPoint1 = startingPoint1 + 0.01;
                        startingPoint2 = startingPoint2 + 0.01;
                        startingPoint3 = startingPoint3 + 0.01;
                        startingPoint4 = startingPoint4 + 0.01;
                    }
                }
            }

            Rectangle { // draws the outter shadow/highlight
                id: sourceOutter;
                radius: (width / 2);
                antialiasing: true;
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "black"; }
                    GradientStop { position: 0.5; color: "transparent"; }
                    GradientStop { position: 1.0; color: "white"; }
                }
                anchors {
                    fill: parent;
                    margins: -canvasRect.offset;
                }
            }
            Rectangle { // mask for outer 3D effect
                id: maskOutter;
                color: "transparent";
                radius: (width / 2);
                antialiasing: true;
                border {
                    width: canvasRect.offset;
                    color: "black";
                }
                anchors.fill: sourceOutter;
            }
            OpacityMask { // outter effect
                opacity: 0.65;
                source: ShaderEffectSource {
                    sourceItem: sourceOutter;
                    hideSource: true;
                }
                maskSource: ShaderEffectSource {
                    sourceItem: maskOutter;
                    hideSource: true;
                }
                anchors.fill: sourceOutter;
            }
            Item { // inner circle
                id: circleInner;
                anchors {
                    fill: parent;
                    margins: canvasRect.size;
                }

                Rectangle { // draws the inner highlight / shadow
                    id: sourceInner;
                    radius: (width / 2);
                    antialiasing: true;
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "white"; }
                        GradientStop { position: 0.5; color: "transparent"; }
                        GradientStop { position: 1.0; color: "black"; }
                    }
                    anchors {
                        fill: parent;
                        margins: -canvasRect.offset;
                    }

                }

                Item {
                    id: centerLegend
                    anchors.centerIn: sourceInner

                    Text {
                        id: kmhValue
                        font.family: fontValKm.name
                        text: value.toFixed().toString()
                        color: "#0D192E"
                        fontSizeMode: Text.Fit
                        minimumPixelSize: 10
                        font.pixelSize: 65
                        anchors.centerIn: centerLegend
                    }

                    Text {
                        id: kmhLegend
                        font.family: fontValLegend.name
                        text: "km/h"
                        color: "#F3F3F3"
                        fontSizeMode: Text.Fit
                        minimumPixelSize: 10
                        font.pixelSize: 20
                        anchors.top: kmhValue.bottom
                        anchors.horizontalCenter: kmhValue.horizontalCenter
                        opacity: 0.1
                    }

                    LinearGradient  {
                        anchors.fill: kmhValue
                        source: kmhValue
                        gradient: Gradient {
                            GradientStop { position: 1.0; color: "#0D192E" } //41454A
                            GradientStop { position: 0.6; color: "#1E50BA" }
                            GradientStop { position: 0.0; color: "#1E50BA" } //BBBCBE
                        }
                    }
                }


                Rectangle { // mask for inner 3D effect
                    id: maskInner;
                    color: "transparent";
                    radius: (width / 2);
                    antialiasing: true;
                    border {
                        width: canvasRect.offset;
                        color: "black";
                    }
                    anchors.fill: sourceInner;
                }
                OpacityMask { // inner effect
                    opacity: 0.65;
                    source: ShaderEffectSource {
                        sourceItem: sourceInner;
                        hideSource: true;
                    }
                    maskSource: ShaderEffectSource {
                        sourceItem: maskInner;
                        hideSource: true;
                    }
                    anchors.fill: sourceInner;
                }
            }
        }
    }
}
