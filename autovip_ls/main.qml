import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import ck.gmachine 1.0
import "Components"
import QtMultimedia 5.6
import MyLang 1.0
import QtQuick.Controls.Material 2.2



Window {
    id: root
    visible:true
    width: 1024
    height: 768
    title: qsTr("autovip") + mytrans.emptyString
    modality: Qt.ApplicationModal
    flags: Qt.Window | Qt.FramelessWindowHint
    Material.theme: Material.Dark
    Material.accent: Material.Purple
    color: "black"
    Intro{
        x:0
        y:0
        z:1334
        width:1024
        height:768
        opacity: 1
    }

    Image {
        x:0
        y:0
        source: "qrc:/design/general/background.svg"
        width:parent.width
        height:parent.height
        Body{
            id: bodyPart
            x:0
            y:0
        }
        BottomMenu
        {
            id: iBottomMenu
            x:0
            y:690
        }
    }
    CommandInfo{
        id:info
        z:332
        width:1024
        height:768

    }
    Item{
       id:start
       width:1024
       height:768
       opacity: 0.7
       Rectangle{
           x:0
           y:0
           width:1024
           height:768
           color:"black"
           z:333
           MouseArea{
              anchors.fill: parent
           }
       }
    }
       Rectangle{
           id:startBtn
           anchors.centerIn: start;
           radius: 50
           width: 200
           height:200
           color:"white"
           z:334
           opacity: 1
           property int systemstate: serial_mng.systemstate
           onSystemstateChanged: {
               switch(systemstate)
               {
               case -1:
               case 0:
                        start.visible=true;
                        startBtn.visible=true;
                   break;
               case 1:
                        start.visible=false;
                        startBtn.visible=false;
                   break;
               }
           }
           Image{
               anchors.centerIn: parent
               source:"qrc:/design/general/on-button.svg"
               sourceSize.width: 150
               sourceSize.height: 150
              z:334
               MouseArea{
                   anchors.fill: parent
                   onClicked: {
                       GSystem.systemOnOff();
                   }
               }
           }
           MouseArea{
               anchors.fill: parent
           }

       }
   MouseArea {
    anchors.fill: parent
    enabled: false
    //cursorShape: Qt.BlankCursor
  }


    Component.onCompleted: {
        GSystem.phistory = ["Home"];
        GSystem.state = "Home"
        GSystem.setInfo(info);
        console.log(SM.value("main/lang"));
        console.log("Serial Con : "+serial_mng.isConnected());

    }
}
