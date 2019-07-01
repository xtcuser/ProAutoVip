import QtQuick 2.0
import ck.gmachine 1.0
import QtGraphicalEffects 1.0

Item {
    id:root
    property string message: "info"
    property alias src:icon.source
    signal finished
    width:1024
    height:768
    visible: false
    function start()
    {
        root.visible = true;
        ani.restart();
    }
    Rectangle{
        id:bg
        z:332
        anchors.fill: root
        color:"black"
        opacity: 0
    }
    Rectangle{
        id:info
        z:333
        anchors.centerIn: parent
        width:300
        height:300
        radius: 15
        opacity: 0
        border.width: 4
        border.color: "white"
        color:"black"

        Column
        {
            anchors.centerIn: parent
            spacing: 10
            Image{
                id:icon
                sourceSize.width: 200
                fillMode: Image.PreserveAspectFit
            }
            Text{
                    font.family: GSystem.myriadproita.name
                    font.italic: true
                    font.pixelSize: 24
                    color: "white"
                    anchors.centerIn: parent
            }
        }

    }
    SequentialAnimation{
        id:ani
        ParallelAnimation{
            PropertyAnimation {
                property: "opacity"
                target: bg;
                from: 0;
                to: 0.7;
                duration: 500
            }
            PropertyAnimation {
                property: "opacity"
                target: info;
                from: 0;
                to: 1;
                duration: 500
            }
        }
        PauseAnimation {
            duration: 300
        }
        ParallelAnimation{
            PropertyAnimation {
                property: "opacity"
                target: bg;
                from: 0.7;
                to: 0;
                duration: 500
            }
            PropertyAnimation {
                property: "opacity"
                target: info;
                from: 1;
                to: 0;
                duration: 500

            }
        }

    }
}
