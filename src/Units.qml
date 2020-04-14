import QtQuick 2.0

Item {
    property int defaultResX: 800
    property int defaultResY: 480
    property int currentResX
    property int currentResY

    function dpX(pixel) {
       return pixel*(currentResX/defaultResX)
    }

    function dpY(pixel) {
       return pixel*(currentResY/defaultResY)
    }
}
