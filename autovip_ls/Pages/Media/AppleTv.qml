import QtQuick 2.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import ck.gmachine 1.0
import "../../Components"

BasePage {
    id:root
    caption: qsTr("APPLE TV") + mytrans.emptyString
    pageName: "AppleTv"
    property int delay: 100
    function init()
    {
        serial_mng.sendKey("apple_tv/source");
    }

    Item{
        id: kumanda
        height: 720
        width: 550
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        Image{
            id:boskumanda
            source: "qrc:/design/media/appletv-kumanda/kumandatek.png"
            anchors.fill: parent
            antialiasing: true
        }

        KumandaMedia{
            x:117
            y:70
            scale: 0.4
        }

        Image{
            id:menubutton
            source: "qrc:/design/media/appletv-kumanda/menubutton.png"
            x: 210
            y: 270
            antialiasing: true
            MouseArea{
               onPressed: {
                   serial_mng.sendKey("apple_tv/menu",true,root.delay)
               }
               onReleased: {
                   serial_mng.sendKey("apple_tv/stop_code");
               }
           }

        }

        Image{
            id:altbutton
            source: "qrc:/design/media/appletv-kumanda/altbutton.png"
            x: 290
            y: 270
            antialiasing: true
            MouseArea{
               onPressed: {
                   serial_mng.sendKey("apple_tv/altbtn",true,root.delay)
               }
               onReleased: {
                   serial_mng.sendKey("apple_tv/stop_code");
               }
           }

        }

        Image{
            id:microphone
            source: "qrc:/design/media/appletv-kumanda/microfonbutton.png"
            x: 210
            y: 340
            antialiasing: true
            MouseArea{
               onPressed: {
                   serial_mng.sendKey("apple_tv/microphone",true,root.delay)
               }
               onReleased: {
                   serial_mng.sendKey("apple_tv/stop_code");
               }
           }

        }

        Image{
            id:playstop
            source: "qrc:/design/media/appletv-kumanda/playbutton.png"
            x: 210
            y: 400
            antialiasing: true
            MouseArea{
               onPressed: {
                   serial_mng.sendKey("apple_tv/play_pause",true,root.delay);
               }
               onReleased: {
                   serial_mng.sendKey("apple_tv/stop_code");
               }
           }

        }

        Image{
            id:artirazalt
            source: "qrc:/design/media/appletv-kumanda/butontek.png"
            x: 290
            y: 340
            antialiasing: true
            width:50
            height:115
        }

        Image{
            id:artir
            source: "qrc:/design/media/appletv-kumanda/arti.png"
            x: 290
            y: 350
            antialiasing: true
            width:50
            height:60
            //anchors.fill:Image.PreserveAspectFit
            MouseArea{
               anchors.fill: artir
               onPressed:{
                   serial_mng.sendKey("apple_tv/volume_up",true,root.delay)
               }
               onReleased: {
                   serial_mng.sendKey("apple_tv/stop_code");
               }
           }

        }

        Image{
            id:azalt
            source: "qrc:/design/media/appletv-kumanda/eksi.png"
            x: 290
            y: 385
            antialiasing: true
            //anchors.fill:Image.PreserveAspectFit
            width:50
            height:60
            MouseArea{
                anchors.fill: azalt
                onPressed: {
                   serial_mng.sendKey("apple_tv/volume_down",true,root.delay);
               }
               onReleased: {
                   serial_mng.sendKey("apple_tv/stop_code");
               }
           }

        }

    }
    Component.onCompleted: {
        root.delay = serial_mng.getAppltvDelay();
    }
}


