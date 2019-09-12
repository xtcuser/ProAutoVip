import QtQuick 2.11
import QtQuick.Window 2.10
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
import ck.gmachine 1.0
import "Components"
import QtMultimedia 5.6
import MyLang 1.0
import QtQuick.Controls.Material 2.2
import closx.updater 1.0



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
    Connections{
       target: nvidia_conn_manager
       onChangeQmlPage: function(page){
           GSystem.state = page;
           GSystem.changePage(page,false);
       }
    }
    Connections {
        target: update_manager
        onDoUpdateOverlay: function(){
            updateOverlayTimer.running = startBtn.visible;
        }
    }
    Timer{
        id:updateOverlayTimer
        running: false
        repeat: true
        interval: 100
        onTriggered: {
            if(startBtn.visible==true){
                return;
            }else{
                updaterbtn.visible=true;
                updater.visible=true;
                updateOverlayTimer.running=false;
            }
        }
    }

//    AnimatedImage {
//        x:0
//        y:0
//        source: "qrc:/design/general/background.gif"
//        width:parent.width
//        height:parent.height
//        Body{
//            id: bodyPart
//            x:0
//            y:0
//        }
//        BottomMenu
//        {
//            id: iBottomMenu
//            x:0
//            y:690
//        }
//    }

    Rectangle{
        x:0
        y:0
        width:parent.width
        height:parent.height
//        AnimatedImage {
//            x:0
//            y:0
//            source: "qrc:/design/general/background.gif"
//            speed: 1
//            width:parent.width
//            height:parent.height
////            cache: false
//        }

        Image{
            x:0
            y:0
            width:parent.width
            height:parent.height
            source: "qrc:/design/general/background.png"
        }

//        MediaPlayer {
//            id:player
//            source: "file:///"+workingDirPath+"/background.mp4"
////            onStopped: play()
//            autoPlay: true
//            loops: Animation.Infinite
//            }

//        VideoOutput {
////            anchors.fill: parent
//            x:0
//            y:0
//            width:1230
//            height:920
//            source: player
//        }
//        Component.onCompleted: {
//                player.play();
//        }
        Image {
                x:0
                y:0
                source: "qrc:/design/general/backgroundoverlay.png"
                width:parent.width
                height:parent.height
        }

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
        width:root.width
        height:root.height
    }
    RestartOverlay{
        id:rstarter
        z:332
        width: root.width
        height: root.height
    }
    InfoOverlay{
        id:infoverlay
        z:332
        width: root.width
        height: root.height
    }

    Item{
       id:start
       width:root.width
       height:root.height
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



    //////////////////////////////////// INFO OVERLAY'ININ BAŞLADIĞI YER





    //////////////////////////////////// INFO OVERLAY'ININ BİTTİĞİ YER








       Rectangle{
           id:startBtn
           anchors.centerIn: start;
           border.width: 2
           border.color:Qt.rgba(0/255, 108/255, 128/255,0.6)
           width: 300
           height: 300
           color: Qt.rgba(0,0,0,0.8)
           z:334
           property int systemstate: serial_mng.systemstate
           onSystemstateChanged: {
               switch(systemstate)
               {
               case -1:
               case 0:
                        start.visible=true;
                        startBtn.visible=true;
                        GSystem.syscheck.repeat=true;
                   break;
               case 1:
                        start.visible=false;
                        startBtn.visible=false;
                        GSystem.syscheck.repeat=true;
                   break;
               }
           }
           Image{
               anchors.centerIn: parent
               source:"qrc:/design/general/on-button.svg"
               sourceSize.width: 200
               sourceSize.height: 200
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
       }



       ///////////////////////////// UPDATER OVERLAY BAŞLANGICI

       Updater{
           id:updateMe
       }


       Rectangle{
           id:updater
           width: 1024
           height:768
           color:"black"
           z:330
           opacity: 0.8
           visible: false
           MouseArea{
               anchors.fill: parent
               onClicked: {
                   updater.visible=false;
                   updaterbtn.visible=false;
               }
           }
       }

       Rectangle{
           id:updaterbtn
           anchors.centerIn: updater;
           width: 400
           height:240
           color: "#1c1c1c"
           border.width: 3
           border.color:Qt.rgba(0/255, 108/255, 128/255,0.6)
           z:330
           opacity: 1
           visible: false
           MouseArea{
               anchors.fill: parent
               onClicked: {
                   updater.visible=true;
                   updaterbtn.visible=true;
               }
           }
           ColumnLayout
              {
                  width: 400
                  height: 200
                  Rectangle{
                      id: updaterheader
                      width: 394
                      height: 30
                      anchors.top: parent.top
                      anchors.topMargin: 3
                      anchors.left: parent.left
                      anchors.leftMargin: 3
                      color: "#0f0f0f"
                      Text {
                          anchors.centerIn: parent
                          text: qsTr("New Update Found!") + mytrans.emptyString
                          font.pixelSize: 16
                          font.italic: true
                          color: "white"
                      }
                  }

                  Rectangle{
                      width:400
                      height: 100
                      anchors.top: updaterheader.bottom
                      anchors.topMargin: 20
                      color:"transparent"
                      Text{
                          anchors.centerIn: parent
                          text:qsTr("There is a new update of the system software.\nDo you want to install it?\n(System will be restarted.)") + mytrans.emptyString
                          font.family:GSystem.myriadproita.name
                          font.pixelSize: 22
                          font.italic: true
                          color: "white"
                      }
                  }

                  Rectangle{
                      width:400
                      height: 100
                      color:"transparent"
                      RowLayout{
                          width: 400
                          height: 100
                          Rectangle{
                              width: 200
                              height: 100
                              color:"transparent"
                              Rectangle{
                                  id: updaterbg
                                  width: 120
                                  height: 50
                                  color:"#0f0f0f"
                                  border.width: 1
                                  border.color:Qt.rgba(0/255, 108/255, 128/255,0.6)
                                  anchors.verticalCenter: parent.verticalCenter
                                  anchors.right: parent.right
                                  anchors.rightMargin: 20
                                  z:344
                                  Text{
                                      anchors.centerIn: parent
                                      text:qsTr("Restart") + mytrans.emptyString
                                      font.family:GSystem.myriadproita.name
                                      font.pixelSize: 18
                                      color: "white"
                                  }
                                  MouseArea{
                                      anchors.fill: parent
                                      onClicked: {
                                          updateMe.makeUpdate()
                                      }
                                      onPressed: {
                                          updaterbg.color = Qt.rgba(0/255, 108/255, 128/255,0.6)
                                      }
                                      onReleased: {
                                          updaterbg.color = "#0f0f0f"
                                      }
                                  }
                              }

                          }
                          Rectangle{
                              width: 200
                              height: 100
                              color: "transparent"
                              Rectangle{
                                  id: cancelbg
                                  width: 120
                                  height: 50
                                  color:"#0f0f0f"
                                  border.width: 1
                                  border.color:Qt.rgba(0/255, 108/255, 128/255,0.6)
                                  anchors.verticalCenter: parent.verticalCenter
                                  anchors.left: parent.left
                                  anchors.leftMargin: 20
                                  z:344
                                  Text{
                                      anchors.centerIn: parent
                                      text:qsTr("Cancel") + mytrans.emptyString
                                      font.family:GSystem.myriadproita.name
                                      font.pixelSize: 18
                                      color: "white"
                                  }
                                  MouseArea{
                                      anchors.fill: parent
                                      onClicked: {
                                          updater.visible=false;
                                          updaterbtn.visible=false;
                                      }
                                      onPressed: {
                                          cancelbg.color =  Qt.rgba(0/255, 108/255, 128/255,0.6)
                                      }
                                      onReleased: {
                                          cancelbg.color =  "#0f0f0f"
                                      }
                                  }
                              }
                          }

                      }
                  }

              }

          }

         ///////////////////////////// UPDATER OVERLAY BİTİŞİ


    Component.onCompleted: {
        GSystem.phistory = ["Home"];
        GSystem.state = "Home"
        GSystem.setInfo(info);
        GSystem.setRestarter(rstarter);
        GSystem.setInfoverlay(infoverlay);
        console.log(SM.value("main/lang"));
        console.log("Serial Con : "+serial_mng.isConnected());

    }
}
