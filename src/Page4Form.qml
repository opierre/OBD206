import QtQuick 2.9
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4

Page {

//    background: LinearGradient {
//        anchors.fill: parent
//        start: Qt.point(0, parent.height)
//        end: Qt.point(0, 0)
//        gradient: Gradient {
//            GradientStop { position: 0.0; color: "#19212A" }
//            GradientStop { position: 1.0; color: "#0D1016" }
//        }
//    }
    Image {
        id: background
        source: "qrc:background_clair.png"
        scale: 1
    }

//    Item {
//        width: 300
//        height: 300

//        ProgressDSU {
//            width : parent.width/2
//            height: parent.width/2
//        }
//    }

//    property int offset : 2;
//    property int size   : 50;

//    Item { // outter circle
//        id: circleOutter;
//        width: 250;
//        height: width;
//        anchors.centerIn: parent;

//        Canvas {  // draws the ring
//            opacity: 0.35;
//            antialiasing: true;
//            contextType: "2d";
//            anchors.fill: parent;
//            onPaint: {
//                if (context) {
//                    context.reset ();
//                    context.globalCompositeOperation = "source-over";
//                    context.fillStyle = "black";
//                    context.beginPath ();
//                    context.ellipse (0, 0, width/2, height/2);
//                    context.fill ();
//                    context.globalCompositeOperation = "xor";
//                    context.fillStyle = "black";
//                    context.beginPath ();
////                        context.ellipse (circleInner.x, circleInner.y, circleInner.width, circleInner.height);
//                    context.fill ();
//                }
//            }
//            onWidthChanged:  { requestPaint (); }
//            onHeightChanged: { requestPaint (); }
//        }
//        Rectangle { // draws the outter shadow/highlight
//            id: sourceOutter;
//            radius: (width / 2);
//            antialiasing: true;
//            gradient: Gradient {
//                GradientStop { position: 0.0; color: "black"; }
//                GradientStop { position: 0.5; color: "transparent"; }
//                GradientStop { position: 1.0; color: "white"; }
//            }
//            anchors {
//                fill: parent;
//                margins: -offset;
//            }
//        }
//        Rectangle { // mask for outer 3D effect
//            id: maskOutter;
//            color: "transparent";
//            radius: (width / 2);
//            antialiasing: true;
//            border {
//                width: offset;
//                color: "black";
//            }
//            anchors.fill: sourceOutter;
//        }
//        OpacityMask { // outter effect
//            opacity: 0.65;
//            source: ShaderEffectSource {
//                sourceItem: sourceOutter;
//                hideSource: true;
//            }
//            maskSource: ShaderEffectSource {
//                sourceItem: maskOutter;
//                hideSource: true;
//            }
//            anchors.fill: sourceOutter;
//        }
//        Item { // inner circle
//            id: circleInner;
//            anchors {
//                fill: parent;
//                margins: size;
//            }

//            Rectangle { // draws the inner highlight / shadow
//                id: sourceInner;
//                radius: (width / 2);
//                antialiasing: true;
//                gradient: Gradient {
//                    GradientStop { position: 0.0; color: "white"; }
//                    GradientStop { position: 0.5; color: "transparent"; }
//                    GradientStop { position: 1.0; color: "black"; }
//                }
//                anchors {
//                    fill: parent;
//                    margins: -offset;
//                }
//            }
//            Rectangle { // mask for inner 3D effect
//                id: maskInner;
//                color: "transparent";
//                radius: (width / 2);
//                antialiasing: true;
//                border {
//                    width: offset;
//                    color: "black";
//                }
//                anchors.fill: sourceInner;
//            }
//            OpacityMask { // inner effect
//                opacity: 0.65;
//                source: ShaderEffectSource {
//                    sourceItem: sourceInner;
//                    hideSource: true;
//                }
//                maskSource: ShaderEffectSource {
//                    sourceItem: maskInner;
//                    hideSource: true;
//                }
//                anchors.fill: sourceInner;
//            }
//        }
//    }

//    Gauge {
//        minimumValue: 0
//        value: 50
//        maximumValue: 100
//        anchors.centerIn: parent

//        style: GaugeStyleTest {}
//    }

}
