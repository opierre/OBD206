import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4

Rectangle{

    id: root

    width: parent.height/2
    height:  parent.height/2


    property real cercleRadius: height/3
    property int percentage1: 100
    property real textsize: height/10
    property string lruName: "DSU"
    property int _index;

    property ExclusiveGroup exgroupe;

    RadioButton{

        property int _index: root._index
        exclusiveGroup:exgroupe

        style: RadioButtonStyle
            {

                indicator: Rectangle
                {
                    implicitWidth: root.width
                    implicitHeight: root.height
                    border.color: "transparent"



                }
            }

    }




SequentialAnimation{
    id: sqanim1
    running:  true
    loops: Animation.Infinite
    NumberAnimation{target: root; properties: "percentage1"; from : 0; to : 100; duration: 5000 }
    NumberAnimation{target: root; properties: "percentage1"; from : 100; to : 0; duration: 5000 }
}
onPercentage1Changed: mycanvas.requestPaint()

Text{
    id:text1
    text: lruName
    font.pixelSize: textsize
    color: 'grey'
    anchors{
        centerIn: mycanvas
        verticalCenterOffset: -parent.height/10
    }
}
Text{
    id:text2
    text: Number(percentage1) + "%"
    font.pixelSize: textsize
    color: 'grey'
    anchors{
        centerIn: mycanvas
        verticalCenterOffset: parent.height/10
    }
}

Canvas {
  id: mycanvasblur
  width: parent.height
  height: parent.height

  anchors.centerIn: parent
  onPaint: {
       var ctx = getContext("2d");
        ctx.clearRect(0,0,width,height)

        ctx.lineWidth = 15;



        ctx.beginPath();
        ctx.strokeStyle="grey";
        ctx.arc(width/2,height/2,cercleRadius,-5*Math.PI/4,0.75*2*Math.PI-5*Math.PI/4,false);
        ctx.stroke();
  }
}

Canvas {
  id: mycanvas
  width: parent.height
  height: parent.height

  anchors.centerIn: parent
  onPaint: {
       var ctx = getContext("2d");
        ctx.clearRect(0,0,width,height)

        ctx.lineWidth = 15;

//          ctx.shadowColor = 'rgba(0,0,0,0.34)';
//          ctx.shadowBlur = 3
//          ctx.shadowOffsetX = 8
//          ctx.shadowOffsetY = 15

        ctx.beginPath();
        ctx.strokeStyle="#004B88";
        ctx.arc(width/2,height/2,cercleRadius,-5*Math.PI/4,(percentage1*0.75/100)*2*Math.PI-5*Math.PI/4,false);
        ctx.stroke();
  }
}

}
