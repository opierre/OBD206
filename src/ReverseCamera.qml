import QtQuick 2.9
import QtQuick.Controls 2.2
//import QtMultimedia 5.10

Page {

    Image {
        id: background
        source: "qrc:background_clair.png"
        scale: 1
    }

    Item {
        anchors.fill: parent

//        VideoOutput {
//            source: camera
//            anchors.fill: parent
//            focus : visible // to receive focus and capture key events when visible
//            fillMode: VideoOutput.PreserveAspectCrop


//            Camera {
//                id: camera
//                exposure {
//                    exposureCompensation: 0.0
//                    exposureMode: Camera.ExposureAuto
//                    manualIso: 0
//                    meteringMode: Camera.MeteringAverage
//                }


//                Component.onCompleted: {
//                    console.log(exposure.exposureCompensation);
//                    console.log(exposure.exposureMode);
//                    console.log(exposure.iso);
//                    console.log(exposure.meteringMode);
//                    console.log(imageProcessing.contrast);
//                    console.log(imageProcessing.saturation);
//                    console.log(imageProcessing.brightness);
//                    console.log(imageProcessing.sharpeningLevel);
//                }
//            }
//        }

    }

}
