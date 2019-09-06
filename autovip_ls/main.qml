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



    //////////////////////////////////// INFO OVERLAY'ININ BAŞLADIĞI YER




    Rectangle{
        id:infoverlay
        width: 1024
        height:768
        color:"black"
        z:343
        opacity: 0.8
        visible: false
        MouseArea{
            anchors.fill: parent
            onClicked: {
                infoverlay.visible=false;
                infomenu.visible=false;
                infoheader.visible=false;
                infoclose.visible=false;
            }
        }
    }

    Rectangle{
        id:infomenu
        anchors.centerIn: infoverlay;
        width: 900
        height:600
        color:"#1c1c1c"
        border.width: 3
        border.color:Qt.rgba(0/255, 108/255, 128/255,0.6)
        z:344
        opacity: 1
        visible: false
        MouseArea{
            anchors.fill: parent
            onClicked: {
                infoverlay.visible=true;
                infomenu.visible=true;
                infoheader.visible=true;
                infoclose.visible=true;
            }
        }

            TableView {
                id:infoverlayTable
                width: 800
                height: 450
                model: GSystem.infoverlayModel
                anchors.centerIn: infomenu
                horizontalScrollBarPolicy : Qt.ScrollBarAlwaysOff
                verticalScrollBarPolicy : Qt.ScrollBarAlwaysOff

                TableViewColumn {
                    role: "command"
                    title: qsTr("Command") + mytrans.emptyString
                    width: 400
                    movable: false
                    resizable: false
                }
                TableViewColumn {
                    role: "action"
                    title: qsTr("Action") + mytrans.emptyString
                    width: 400
                    movable: false
                    resizable: false
                }

                itemDelegate: Item {
                                        Text {
                                          anchors.verticalCenter: parent.verticalCenter
                                          anchors.horizontalCenter: parent.horizontalCenter
                                          color: "white"
                                          elide: styleData.elideMode
                                          text: styleData.value
                                          font.pixelSize: 15
                                        }
                                 }

                style: TableViewStyle {
                    headerDelegate: Rectangle {
                        height: textItem.implicitHeight * 2
                        width: textItem.implicitWidth
                        color: "#141414"
                        Text {
                            id: textItem
                            anchors.fill: parent
                            verticalAlignment: Text.AlignVCenter
//                            horizontalAlignment: styleData.textAlignment
                            horizontalAlignment: Text.AlignHCenter
                            text: styleData.value
                            elide: Text.ElideRight
                            color: "white"
                            renderType: Text.NativeRendering
                        }
                        Rectangle {
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 1
                            anchors.topMargin: 1
                            width: 1
                            color: "#ccc"
                        }
                    }

                    backgroundColor: "#212121"
                    alternateBackgroundColor: "#313131"
                    textColor: "white"


                }

            }

    }

    Rectangle{
        id:infoheader
        height: 30
        width: infomenu.width - 6
        anchors.top:infomenu.top
        anchors.topMargin: 3
        anchors.leftMargin: 3
        anchors.left:infomenu.left
        visible: false
        z:345
        color: "#0f0f0f"
        Text {
            text:qsTr("Command list that you can ask from the voice assistant.") + mytrans.emptyString
            font.pixelSize: 16
            font.italic: true
            color: "white"
            anchors.centerIn: parent
        }
    }

    Text{
        anchors.horizontalCenter: parent.horizontalCenter
        visible: false
        y:120
        z:345
        font.family:GSystem.myriadproita.name
        font.italic: true
        font.pixelSize: 25
        color: "white"
    }


        Rectangle{
            id: infoclose
            width: 120
            height: 50
            color:"#0f0f0f"
            border.width: 1
            border.color:Qt.rgba(0/255, 108/255, 128/255,0.6)
            visible: false
            anchors.horizontalCenter: parent.horizontalCenter
            y:620
            z:346
            Text{
                anchors.centerIn: parent
                text:qsTr("Close") + mytrans.emptyString
                font.family:GSystem.myriadproita.name
                font.italic: true
                font.pixelSize: 18
                color: "white"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    infoverlay.visible=false;
                    infomenu.visible=false;
                    infoheader.visible=false;
                    infoclose.visible=false;
                }
                onPressed: {
                    infoclose.color = Qt.rgba(0/255, 108/255, 128/255,0.6)
                }
                onReleased: {
                    infoclose.color = "#0f0f0f"
                }
            }
        }




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
