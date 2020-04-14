import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    width: 600
    height: 400
    background: Rectangle {
        color: "#404040"
    }


    Label {
        text: qsTr("You are on Page 1.")
        anchors.centerIn: parent
    }
}
