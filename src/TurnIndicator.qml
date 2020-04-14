import QtQuick 2.9
import QtGraphicalEffects 1.0

Item {
    // This enum is actually keyboard-related, but it serves its purpose
    // as an indication of direction for us.
    property int direction: Qt.LeftArrow
    property bool on: false

    property bool flashing: false

    scale: direction === Qt.LeftArrow ? 1 : -1
    Timer {
        id: flashTimer
        interval: 500
        running: on
        repeat: true
        onTriggered: flashing = !flashing
    }
    function paintOutlinePath(ctx) {
        ctx.beginPath();
        ctx.moveTo(0, height * 0.5);
        ctx.lineTo(0.6 * width, 0);
        ctx.lineTo(0.6 * width, height * 0.28);
        ctx.lineTo(width, height * 0.28);
        ctx.lineTo(width, height * 0.72);
        ctx.lineTo(0.6 * width, height * 0.72);
        ctx.lineTo(0.6 * width, height);
        ctx.lineTo(0, height * 0.5);
    }
    Canvas {
        id: backgroundCanvas
        anchors.fill: parent

        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();

            paintOutlinePath(ctx);

            ctx.lineWidth = 1;
            ctx.strokeStyle = "#BBBCBE";
            ctx.globalAlpha = "0.02";
            ctx.stroke();
        }
    }

    Canvas {
        id: foregroundCanvas
        anchors.fill: parent
        visible: on && flashing

        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();

            paintOutlinePath(ctx);

            ctx.fillStyle = "#1E50BA";
            ctx.fill();
        }
    }
}
