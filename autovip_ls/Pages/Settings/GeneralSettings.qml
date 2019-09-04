import QtQuick 2.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import ck.gmachine 1.0
import MyLang 1.0
import QtGraphicalEffects 1.0
import "../../Components"
import closx.smanager 1.0
import QtQuick.Extras 1.4
import QtGraphicalEffects 1.0
import closx.restarter 1.0


BasePage {
    id:root
    caption: qsTr("GENERAL SETTINGS") + mytrans.emptyString
    pageName: "GeneralSettings"
    property date cur_date: new Date()
    function init()
    {
        timesetter.refresh();
        autotime.checked = csetter.isAutoTimeSync();
    }
    SettingsManager{
        id:smanager
    }


    Text{
        id:textSingleton
        font.family: GSystem.myriadproita.name
        font.pixelSize: 10
    }
    Rectangle{
        y:200
        width:250
        height:250
        color:"#00000000"
        //color:"white"
        MouseArea{
                anchors.fill: parent
                onPressAndHold: {
                        GSystem.changePage("Calibration");
                    }
        }
    }

    Restarter {
        id:restarter
    }



    ////////////////////////////////////////////////


    Rectangle{
        id:restart
        width: 1024
        height:768
        color:"black"
        z:343
        opacity: 0.8
        visible: false
        MouseArea{
            anchors.fill: parent
            onClicked: {
                restart.visible=false;
                restartbtn.visible=false;
            }
        }
    }
       Rectangle{
           id:restartbtn
           anchors.centerIn: restart;
           radius: 8
           width: 400
           height:220
           color:"#212121"
           z:344
           opacity: 1
           visible: false
           MouseArea{
               anchors.fill: parent
               onClicked: {
                   restart.visible=true;
                   restartbtn.visible=true;
               }
           }
           ColumnLayout
           {
               width: 400
               height: 200


               Rectangle{
                   width:400
                   height: 100
                   color:"transparent"
                   Text{
                       anchors.centerIn: parent
                       text:qsTr("System should be restarted to\n apply all language changes.") + mytrans.emptyString
                       font.family:GSystem.myriadproita.name
                       font.pixelSize: 18
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
                               id: restartbg
                               width: 120
                               height: 70
                               radius: 8
                               color:"black"
                               anchors.centerIn: parent
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
                                       restarter.makeRestart()
                                   }
                                   onPressed: {
                                       restartbg.color = "#1c1c1c"
                                   }
                                   onReleased: {
                                       restartbg.color = "black"
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
                               height: 70
                               color:"black"
                               radius: 8
                               anchors.centerIn: parent
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
                                       restart.visible=false;
                                       restartbtn.visible=false;
                                   }
                                   onPressed: {
                                       cancelbg.color = "#1c1c1c"
                                   }
                                   onReleased: {
                                       cancelbg.color = "black"
                                   }
                               }
                           }
                       }

                   }
               }

           }

       }




    ////////////////////////////////////////////////



    Rectangle{
        width:612
        height:380
        color:"transparent"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        ColumnLayout
        {
            width:300
            height:300
            spacing: 40
            Rectangle{
                color:"transparent"
                height:100

                RowLayout{
                    width: 640
                    height: 100
                    spacing:20
                    Rectangle{
                        width:100
                        height: 30
                        color:"transparent"
                        Text{
                            text:qsTr("Language:") + mytrans.emptyString
                            font.family:GSystem.myriadproita.name
                            font.pixelSize: 24
                            color: "white"
                        }
                    }
                    Rectangle
                    {
                        id:languageRectangle
                        width:120
                        height:80
                        color: "transparent"
                        border.width: 2
                        border.color:Qt.rgba(0/255, 108/255, 128/255,0.6)
                        Image{
                            id:turkish
                            source:"qrc:/design/settings/turkish.png"
                            sourceSize.height: 80
                            sourceSize.width: 120
                            width: 120
                            height: 80
                            fillMode: Image.Stretch
                            antialiasing: true
                            smooth: true
                            opacity: smanager.lang==125 ? 1 : 0.2
                                MouseArea{
                                anchors.fill: parent
                                onClicked: {
                                    SM.lang = MyLang.TR
                                    chinese.opacity = 0.2
                                    english.opacity = 0.2
                                    turkish.opacity = 1
//                                    restarter.makeRestart()
                                    restart.visible=true;
                                    restartbtn.visible=true;
                                    }
                                }
                            }
                    }









                    Rectangle{
                        id: rectangle
                        width:120
                        height:80
                        color: "transparent"
                        border.width: 2
                        border.color:Qt.rgba(0/255, 108/255, 128/255,0.6)
                        Image{
                            id:english
                            x: 0
                            y: 0
                            source:"qrc:/design/settings/english.png"
                            sourceSize.height: 80
                            sourceSize.width: 120
                            width: 120
                            height:80
                            opacity: smanager.lang==31 ? 1 : 0.2
                            fillMode: Image.Stretch
                            MouseArea{
                                anchors.fill: parent
                            onClicked: {
                                SM.lang = MyLang.ENG
                                chinese.opacity = 0.2
                                turkish.opacity = 0.2
                                english.opacity = 1
                                restart.visible=true;
                                restartbtn.visible=true;
                                }
                            }
                        }
                    }









                    Rectangle{
                        id:chRectangle
                        width:120
                        height:80
                        color: "transparent"
                        border.width: 2
                        border.color:Qt.rgba(0/255, 108/255, 128/255,0.6)
                        Image{
                            id:chinese
                            source:"qrc:/design/settings/chinese.png"
                            sourceSize.height: 80
                            sourceSize.width: 120
                            width: 120
                            height:80
                            fillMode: Image.Stretch
                            antialiasing: true
                            smooth: true
                            opacity: smanager.lang==25 ? 1 : 0.2
                            MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                SM.lang = MyLang.CH
                                chinese.opacity = 1
                                turkish.opacity = 0.2
                                english.opacity = 0.2
                                restart.visible=true;
                                restartbtn.visible=true;
                                }
                            }
                            }
//                        DropShadow {
//                            anchors.fill: english
//                            radius: 8
//                            samples: 12
//                            visible: (SM.lang == MyLang.ENG)?true:false
//                            verticalOffset: 3
//                            color: "blue"
//                            source:english
//                        }
                    }

                }
            }
            Rectangle{
                height:100
                color:"transparent"

                RowLayout{
                    width: 400
                    height: 100
                    spacing:20
                    Rectangle{
                        width:100
                        height: 30
                        color:"transparent"
                        Text{
                            text:qsTr("Auto Time:") + mytrans.emptyString
                            font.family:GSystem.myriadproita.name
                            font.pixelSize: 24
                            color: "white"
                        }
                    }
                    Switch{
                        id:autotime
                        text:qsTr("Auto") + mytrans.emptyString

                    }
                }
            }
            TimeSetter{
                id:timesetter
                mode:!autotime.checked
            }
        }

        }

}





/*##^## Designer {
    D{i:33;anchors_y:0}
}
 ##^##*/
