import QtQuick 2.10
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
        radius: 8
        width: 900
        height:600
        color:"#212121"
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

            ListModel {
                id: libraryModel
                ListElement {
                    command: qsTr("First table open")
                    action: qsTr("Opens the First Table")
                }
                ListElement {
                    command: qsTr("First table close")
                    action: qsTr("Closes the First Table")
                }
                ListElement {
                    command: qsTr("Second table open")
                    action: qsTr("Opens the Second Table")
                }
                ListElement {
                    command: qsTr("Second table close")
                    action: qsTr("Closes the Second Table")
                }
                ListElement {
                    command: qsTr("Third table open")
                    action: qsTr("Opens the Third Table")
                }
                ListElement {
                    command: qsTr("Third table close")
                    action: qsTr("Closes the Third Table")
                }
                ListElement {
                    command: qsTr("Fourth table open")
                    action: qsTr("Opens the Fourth Table")
                }
                ListElement {
                    command: qsTr("Fourth table close")
                    action: qsTr("Closes the Fourth Table")
                }
                ListElement {
                    command: qsTr("Fifth table open")
                    action: qsTr("Opens the Fifth Table")
                }
                ListElement {
                    command: qsTr("Fifth table close")
                    action: qsTr("Closes the Fifth Table")
                }
                ListElement {
                    command: qsTr("Sixth table open")
                    action: qsTr("Opens the Sixth Table")
                }
                ListElement {
                    command: qsTr("Sixth table close")
                    action: qsTr("Closes the Sixth Table")
                }
                ListElement {
                    command: qsTr("Left table open")
                    action: qsTr("Opens the Left Table")
                }
                ListElement {
                    command: qsTr("Left table close")
                    action: qsTr("Closes the Left Table")
                }
                ListElement {
                    command: qsTr("Right table open")
                    action: qsTr("Opens the Right Table")
                }
                ListElement {
                    command: qsTr("Right table close")
                    action: qsTr("Closes the Right Table")
                }




                ListElement {
                    command: qsTr("First seat footrest open")
                    action: qsTr("Opens the First seat footrest")
                }
                ListElement {
                    command: qsTr("First seat footrest close")
                    action: qsTr("Closes the First seat footrest")
                }
                ListElement {
                    command: qsTr("Second seat footrest open")
                    action: qsTr("Opens the Second seat footrest")
                }
                ListElement {
                    command: qsTr("Second seat footrest close")
                    action: qsTr("Closes the Second seat footrest")
                }
                ListElement {
                    command: qsTr("Third seat footrest open")
                    action: qsTr("Opens the Third seat footrest")
                }
                ListElement {
                    command: qsTr("Third seat footrest close")
                    action: qsTr("Closes the Third seat footrest")
                }
                ListElement {
                    command: qsTr("Fourth seat footrest open")
                    action: qsTr("Opens the Fourth seat footrest")
                }
                ListElement {
                    command: qsTr("Fourth seat footrest close")
                    action: qsTr("Closes the Fourth seat footrest")
                }
                ListElement {
                    command: qsTr("Fifth seat footrest open")
                    action: qsTr("Opens the Fifth seat footrest")
                }
                ListElement {
                    command: qsTr("Fifth seat footrest close")
                    action: qsTr("Closes the Fifth seat footrest")
                }
                ListElement {
                    command: qsTr("Sixth seat footrest open")
                    action: qsTr("Opens the Sixth seat footrest")
                }
                ListElement {
                    command: qsTr("Sixth seat footrest close")
                    action: qsTr("Closes the Sixth seat footrest")
                }
                ListElement {
                    command: qsTr("Right seat footrest open")
                    action: qsTr("Opens the Right seat footrest")
                }
                ListElement {
                    command: qsTr("Right seat footrest close")
                    action: qsTr("Closes the Right seat footrest")
                }
                ListElement {
                    command: qsTr("Left seat footrest open")
                    action: qsTr("Opens the Left seat footrest")
                }
                ListElement {
                    command: qsTr("Left seat footrest close")
                    action: qsTr("Closes the Left seat footrest")
                }




                ListElement {
                    command: qsTr("First Curtain open")
                    action: qsTr("Opens the First Curtain")
                }
                ListElement {
                    command: qsTr("First Curtain close")
                    action: qsTr("Closes the First Curtain")
                }
                ListElement {
                    command: qsTr("Second Curtain open")
                    action: qsTr("Opens the Second Curtain")
                }
                ListElement {
                    command: qsTr("Second Curtain close")
                    action: qsTr("Closes the Second Curtain")
                }
                ListElement {
                    command: qsTr("Third Curtain open")
                    action: qsTr("Opens the Third Curtain")
                }
                ListElement {
                    command: qsTr("Third Curtain close")
                    action: qsTr("Closes the Third Curtain")
                }
                ListElement {
                    command: qsTr("Fourth Curtain open")
                    action: qsTr("Opens the Fourth Curtain")
                }
                ListElement {
                    command: qsTr("Fourth Curtain close")
                    action: qsTr("Closes the Fourth Curtain")
                }
                ListElement {
                    command: qsTr("Fifth Curtain open")
                    action: qsTr("Opens the Fifth Curtain")
                }
                ListElement {
                    command: qsTr("Fifth Curtain close")
                    action: qsTr("Closes the Fifth Curtain")
                }
                ListElement {
                    command: qsTr("Sixth Curtain open")
                    action: qsTr("Opens the Sixth Curtain")
                }
                ListElement {
                    command: qsTr("Sixth Curtain close")
                    action: qsTr("Closes the Sixth Curtain")
                }
                ListElement {
                    command: qsTr("Right Curtain open")
                    action: qsTr("Opens the Right Curtain")
                }
                ListElement {
                    command: qsTr("Right Curtain close")
                    action: qsTr("Closes the Right Curtain")
                }
                ListElement {
                    command: qsTr("Left Curtain open")
                    action: qsTr("Opens the Left Curtain")
                }
                ListElement {
                    command: qsTr("Left Curtain close")
                    action: qsTr("Closes the Left Curtain")
                }





                ListElement {
                    command: qsTr("First Seat Massage open")
                    action: qsTr("Opens the First Seat Massage")
                }
                ListElement {
                    command: qsTr("First Seat Massage close")
                    action: qsTr("Closes the First Seat Massage")
                }
                ListElement {
                    command: qsTr("Second Seat Massage open")
                    action: qsTr("Opens the Second Seat Massage")
                }
                ListElement {
                    command: qsTr("Second Seat Massage close")
                    action: qsTr("Closes the Second Seat Massage")
                }
                ListElement {
                    command: qsTr("Third Seat Massage open")
                    action: qsTr("Opens the Third Seat Massage")
                }
                ListElement {
                    command: qsTr("Third Seat Massage close")
                    action: qsTr("Closes the Third Seat Massage")
                }
                ListElement {
                    command: qsTr("Fourth Seat Massage open")
                    action: qsTr("Opens the Fourth Seat Massage")
                }
                ListElement {
                    command: qsTr("Fourth Seat Massage close")
                    action: qsTr("Closes the Fourth Seat Massage")
                }
                ListElement {
                    command: qsTr("Fifth Seat Massage open")
                    action: qsTr("Opens the Fifth Seat Massage")
                }
                ListElement {
                    command: qsTr("Fifth Seat Massage close")
                    action: qsTr("Closes the Fifth Seat Massage")
                }
                ListElement {
                    command: qsTr("Sixth Seat Massage open")
                    action: qsTr("Opens the Sixth Seat Massage")
                }
                ListElement {
                    command: qsTr("Sixth Seat Massage close")
                    action: qsTr("Closes the Sixth Seat Massage")
                }
                ListElement {
                    command: qsTr("Right Seat Massage open")
                    action: qsTr("Opens the Right Seat Massage")
                }
                ListElement {
                    command: qsTr("Right Seat Massage close")
                    action: qsTr("Closes the Right Seat Massage")
                }
                ListElement {
                    command: qsTr("Left Seat Massage open")
                    action: qsTr("Opens the Left Seat Massage")
                }
                ListElement {
                    command: qsTr("Left Seat Massage close")
                    action: qsTr("Closes the Left Seat Massage")
                }





                ListElement {
                    command: qsTr("Nespresso open")
                    action: qsTr("Opens the Nespresso")
                }
                ListElement {
                    command: qsTr("Nespresso close")
                    action: qsTr("Closes the Nespresso")
                }
                ListElement {
                    command: qsTr("Front Nespresso open")
                    action: qsTr("Opens the Front Nespresso")
                }
                ListElement {
                    command: qsTr("Front Nespresso close")
                    action: qsTr("Closes the Front Nespresso")
                }
                ListElement {
                    command: qsTr("Rear Nespresso open")
                    action: qsTr("Opens the Rear Nespresso")
                }
                ListElement {
                    command: qsTr("Rear Nespresso close")
                    action: qsTr("Closes the Rear Nespresso")
                }



                ListElement {
                    command: qsTr("Door open")
                    action: qsTr("Opens the Door")
                }
                ListElement {
                    command: qsTr("Door close")
                    action: qsTr("Closes the Door")
                }
                ListElement {
                    command: qsTr("Right Door open")
                    action: qsTr("Opens the Right Door")
                }
                ListElement {
                    command: qsTr("Right Door close")
                    action: qsTr("Closes the Right Door")
                }
                ListElement {
                    command: qsTr("Left Door open")
                    action: qsTr("Opens the Left Door")
                }
                ListElement {
                    command: qsTr("Left Door close")
                    action: qsTr("Closes the Left Door")
                }




                ListElement {
                    command: qsTr("TV up")
                    action: qsTr("Puts the TV up")
                }
                ListElement {
                    command: qsTr("Tv down")
                    action: qsTr("Puts the TV down")
                }
                ListElement {
                    command: qsTr("Turn on TV")
                    action: qsTr("Turns the TV on")
                }
                ListElement {
                    command: qsTr("Turn on TV")
                    action: qsTr("Turns the TV off")
                }
                ListElement {
                    command: qsTr("TV Volume up")
                    action: qsTr("Increases the TV volume")
                }
                ListElement {
                    command: qsTr("TV Volume down")
                    action: qsTr("Decreases the TV volume")
                }




                ListElement {
                    command: qsTr("Open Apple TV")
                    action: qsTr("Opens the Apple TV")
                }





                ListElement {
                    command: qsTr("Front camera open")
                    action: qsTr("Opens the Front Camera")
                }
                ListElement {
                    command: qsTr("Rear camera open")
                    action: qsTr("Opens the Rear Camera")
                }
                ListElement {
                    command: qsTr("Screen divider open")
                    action: qsTr("Opens the the Screen Divider")
                }
                ListElement {
                    command: qsTr("DVD open")
                    action: qsTr("Opens the DVD")
                }
                ListElement {
                    command: qsTr("Computer projection")
                    action: qsTr("Enables Computer Projection")
                }
                ListElement {
                    command: qsTr("Samsung dock projection")
                    action: qsTr("Enables Samsung Dock Projection")
                }




                ListElement {
                    command: qsTr("Turn on lights white")
                    action: qsTr("Turns white lights on")
                }
                ListElement {
                    command: qsTr("Turn on lights red")
                    action: qsTr("Turns red lights on")
                }
                ListElement {
                    command: qsTr("Turn on lights green")
                    action: qsTr("Turns green lights on")
                }
                ListElement {
                    command: qsTr("Turn on lights blue")
                    action: qsTr("Turns blue lights on")
                }
                ListElement {
                    command: qsTr("Turn off lights")
                    action: qsTr("Turns the lights off")
                }




                ListElement {
                    command: qsTr("Ceiling lights white turn on")
                    action: qsTr("Turns white ceiling lights on")
                }
                ListElement {
                    command: qsTr("Ceiling lights red turn on")
                    action: qsTr("Turns red ceiling lights on")
                }
                ListElement {
                    command: qsTr("Ceiling lights green turn on")
                    action: qsTr("Turns green ceiling lights on")
                }
                ListElement {
                    command: qsTr("Ceiling lights blue turn on")
                    action: qsTr("Turns blue ceiling lights on")
                }
                ListElement {
                    command: qsTr("Ceiling lights turn off")
                    action: qsTr("Turns ceiling lights off")
                }




                ListElement {
                    command: qsTr("Interior lights white turn on")
                    action: qsTr("Turns white Interior lights on")
                }
                ListElement {
                    command: qsTr("Interior lights red turn on")
                    action: qsTr("Turns red Interior lights on")
                }
                ListElement {
                    command: qsTr("Interior lights green turn on")
                    action: qsTr("Turns green Interior lights on")
                }
                ListElement {
                    command: qsTr("Interior lights blue turn on")
                    action: qsTr("Turns blue Interior lights on")
                }
                ListElement {
                    command: qsTr("Interior lights turn off")
                    action: qsTr("Turns Interior lights off")
                }




                ListElement {
                    command: qsTr("Side lights white turn on")
                    action: qsTr("Turns white Side lights on")
                }
                ListElement {
                    command: qsTr("Side lights red turn on")
                    action: qsTr("Turns red Side lights on")
                }
                ListElement {
                    command: qsTr("Side lights green turn on")
                    action: qsTr("Turns green Side lights on")
                }
                ListElement {
                    command: qsTr("Side lights blue turn on")
                    action: qsTr("Turns blue Side lights on")
                }
                ListElement {
                    command: qsTr("Side lights turn off")
                    action: qsTr("Turns Side lights off")
                }



                ListElement {
                    command: qsTr("Left Make Up Lights turn on")
                    action: qsTr("Turns Left Make Up Light on")
                }
                ListElement {
                    command: qsTr("Left Make Up Light turn off")
                    action: qsTr("Turns Left Make Up Light off")
                }
                ListElement {
                    command: qsTr("Right Make Up Light turn on")
                    action: qsTr("Turns Right Make Up Light on")
                }
                ListElement {
                    command: qsTr("Right Make Up Light turn off")
                    action: qsTr("Turns Right Make Up Light off")
                }



                ListElement {
                    command: qsTr("Left Reading Lights turn on")
                    action: qsTr("Turns Left Reading Light on")
                }
                ListElement {
                    command: qsTr("Left Reading Light turn off")
                    action: qsTr("Turns Left Reading Light off")
                }
                ListElement {
                    command: qsTr("Right Reading Light turn on")
                    action: qsTr("Turns Right Reading Light on")
                }
                ListElement {
                    command: qsTr("Right Reading Light turn off")
                    action: qsTr("Turns Right Reading Light off")
                }


                ListElement {
                    command: qsTr("Right Drawer Open")
                    action: qsTr("Opens the Right Drawer")
                }
                ListElement {
                    command: qsTr("Right Drawer Close")
                    action: qsTr("Closes the Right Drawer")
                }
                ListElement {
                    command: qsTr("Left Drawer Open")
                    action: qsTr("Opens the Left Drawer")
                }
                ListElement {
                    command: qsTr("Left Drawer Close")
                    action: qsTr("Closes the Left Drawer")
                }




                ListElement {
                    command: qsTr("Air conditioner turn on")
                    action: qsTr("Turns on the Air Conditioner")
                }
                ListElement {
                    command: qsTr("Air conditioner turn off")
                    action: qsTr("Turns off the Air Conditioner")
                }
                ListElement {
                    command: qsTr("Air conditioner Degree Increase")
                    action: qsTr("Increases the heat degree of AC")
                }
                ListElement {
                    command: qsTr("Air conditioner Degree Decrease")
                    action: qsTr("Decreases the heat degree of AC")
                }
                ListElement {
                    command: qsTr("Air conditioner Fan Increase")
                    action: qsTr("Increases the Fan Speed of AC")
                }
                ListElement {
                    command: qsTr("Air conditioner Fan Decrease")
                    action: qsTr("Decreases the Fan Speed of AC")
                }




                ListElement {
                    command: qsTr("Fridge degree increase")
                    action: qsTr("Increases heat of Fridge")
                }
                ListElement {
                    command: qsTr("Fridge degree decrease")
                    action: qsTr("Decreases heat of Fridge")
                }
                ListElement {
                    command: qsTr("Front Fridge degree increase")
                    action: qsTr("Increases heat of Front Fridge")
                }
                ListElement {
                    command: qsTr("Front Fridge degree decrease")
                    action: qsTr("Decreases heat of Front Fridge")
                }
                ListElement {
                    command: qsTr("Rear Fridge degree increase")
                    action: qsTr("Increases heat of Rear Fridge")
                }
                ListElement {
                    command: qsTr("Rear Fridge degree decrease")
                    action: qsTr("Decreases heat of Rear Fridge")
                }




                ListElement {
                    command: qsTr("Bottles Open")
                    action: qsTr("Opens the Bottles")
                }
                ListElement {
                    command: qsTr("Bottles Close")
                    action: qsTr("Closes the Bottles")
                }
                ListElement {
                    command: qsTr("Glasses Open")
                    action: qsTr("Opens the Glasses")
                }
                ListElement {
                    command: qsTr("Glasses Close")
                    action: qsTr("Closes the Glasses")
                }



                ListElement {
                    command: qsTr("Radio Channel Change")
                    action: qsTr("Changes the Radio Channel")
                }
                ListElement {
                    command: qsTr("Radio Channel Forward")
                    action: qsTr("Forwards the Radio Channel")
                }
                ListElement {
                    command: qsTr("Radio Channel Backward")
                    action: qsTr("Backwards the Radio Channel")
                }



                ListElement {
                    command: qsTr("Roof Monitor Open")
                    action: qsTr("Opens the Roof Monitor")
                }
                ListElement {
                    command: qsTr("Roof Monitor Close")
                    action: qsTr("Closes the Roof Monitor")
                }
                ListElement {
                    command: qsTr("Rear TV Open")
                    action: qsTr("Opens the Rear TV")
                }
                ListElement {
                    command: qsTr("Rear TV Close")
                    action: qsTr("Closes the Rear TV")
                }



                ListElement {
                    command: qsTr("Bar Open")
                    action: qsTr("Opens the Bar")
                }
                ListElement {
                    command: qsTr("Bar Close")
                    action: qsTr("Closes the Bar")
                }




                ListElement {
                    command: qsTr("First seat back take one step forward")
                    action: qsTr("Takes First Seat back one step forward")
                }
                ListElement {
                    command: qsTr("First seat back take two step forward")
                    action: qsTr("Takes First Seat back two step forward")
                }
                ListElement {
                    command: qsTr("First seat back take last point forward")
                    action: qsTr("Takes First Seat back last point forward")
                }
                ListElement {
                    command: qsTr("First seat back take one step backward")
                    action: qsTr("Takes First Seat back one step backward")
                }
                ListElement {
                    command: qsTr("First seat back take two step backward")
                    action: qsTr("Takes First Seat back two step backward")
                }
                ListElement {
                    command: qsTr("First seat back take last point backward")
                    action: qsTr("Takes First Seat back last point backward")
                }



                ListElement {
                    command: qsTr("First Seat take one step forward")
                    action: qsTr("Takes First Seat one step forward")
                }
                ListElement {
                    command: qsTr("First Seat take two step forward")
                    action: qsTr("Takes First Seat two step forward")
                }
                ListElement {
                    command: qsTr("First Seat take last point forward")
                    action: qsTr("Takes First Seat last point forward")
                }
                ListElement {
                    command: qsTr("First Seat take one step backward")
                    action: qsTr("Takes First Seat one step backward")
                }
                ListElement {
                    command: qsTr("First Seat take two step backward")
                    action: qsTr("Takes First Seat two step backward")
                }
                ListElement {
                    command: qsTr("First Seat take last point backward")
                    action: qsTr("Takes First Seat last point backward")
                }



                ListElement {
                    command: qsTr("First Seat take one step forward")
                    action: qsTr("Takes First Seat one step forward")
                }
                ListElement {
                    command: qsTr("First Seat take two step forward")
                    action: qsTr("Takes First Seat two step forward")
                }
                ListElement {
                    command: qsTr("First Seat take last point forward")
                    action: qsTr("Takes First Seat last point forward")
                }
                ListElement {
                    command: qsTr("First Seat take one step backward")
                    action: qsTr("Takes First Seat one step backward")
                }
                ListElement {
                    command: qsTr("First Seat take two step backward")
                    action: qsTr("Takes First Seat two step backward")
                }
                ListElement {
                    command: qsTr("First Seat take last point backward")
                    action: qsTr("Takes First Seat last point backward")
                }




                ListElement {
                    command: qsTr("First Seat Head take one step forward")
                    action: qsTr("Takes First Seat Head one step forward")
                }
                ListElement {
                    command: qsTr("First Seat Head take two step forward")
                    action: qsTr("Takes First Seat Head two step forward")
                }
                ListElement {
                    command: qsTr("First Seat Head take last point forward")
                    action: qsTr("Takes First Seat Head last point forward")
                }
                ListElement {
                    command: qsTr("First Seat Head take one step backward")
                    action: qsTr("Takes First Seat Head one step backward")
                }
                ListElement {
                    command: qsTr("First Seat Head take two step backward")
                    action: qsTr("Takes First Seat Head two step backward")
                }
                ListElement {
                    command: qsTr("First Seat Head take last point backward")
                    action: qsTr("Takes First Seat Head last point backward")
                }




                ListElement {
                    command: qsTr("Second seat back take one step forward")
                    action: qsTr("Takes Second Seat back one step forward")
                }
                ListElement {
                    command: qsTr("Second seat back take two step forward")
                    action: qsTr("Takes Second Seat back two step forward")
                }
                ListElement {
                    command: qsTr("Second seat back take last point forward")
                    action: qsTr("Takes Second Seat back last point forward")
                }
                ListElement {
                    command: qsTr("Second seat back take one step backward")
                    action: qsTr("Takes Second Seat back one step backward")
                }
                ListElement {
                    command: qsTr("Second seat back take two step backward")
                    action: qsTr("Takes Second Seat back two step backward")
                }
                ListElement {
                    command: qsTr("Second seat back take last point backward")
                    action: qsTr("Takes Second Seat back last point backward")
                }



                ListElement {
                    command: qsTr("Second Seat take one step forward")
                    action: qsTr("Takes Second Seat one step forward")
                }
                ListElement {
                    command: qsTr("Second Seat take two step forward")
                    action: qsTr("Takes Second Seat two step forward")
                }
                ListElement {
                    command: qsTr("Second Seat take last point forward")
                    action: qsTr("Takes Second Seat last point forward")
                }
                ListElement {
                    command: qsTr("Second Seat take one step backward")
                    action: qsTr("Takes Second Seat one step backward")
                }
                ListElement {
                    command: qsTr("Second Seat take two step backward")
                    action: qsTr("Takes Second Seat two step backward")
                }
                ListElement {
                    command: qsTr("Second Seat take last point backward")
                    action: qsTr("Takes Second Seat last point backward")
                }



                ListElement {
                    command: qsTr("Second Seat take one step forward")
                    action: qsTr("Takes Second Seat one step forward")
                }
                ListElement {
                    command: qsTr("Second Seat take two step forward")
                    action: qsTr("Takes Second Seat two step forward")
                }
                ListElement {
                    command: qsTr("Second Seat take last point forward")
                    action: qsTr("Takes Second Seat last point forward")
                }
                ListElement {
                    command: qsTr("Second Seat take one step backward")
                    action: qsTr("Takes Second Seat one step backward")
                }
                ListElement {
                    command: qsTr("Second Seat take two step backward")
                    action: qsTr("Takes Second Seat two step backward")
                }
                ListElement {
                    command: qsTr("Second Seat take last point backward")
                    action: qsTr("Takes Second Seat last point backward")
                }




                ListElement {
                    command: qsTr("Second Seat Head take one step forward")
                    action: qsTr("Takes Second Seat Head one step forward")
                }
                ListElement {
                    command: qsTr("Second Seat Head take two step forward")
                    action: qsTr("Takes Second Seat Head two step forward")
                }
                ListElement {
                    command: qsTr("Second Seat Head take last point forward")
                    action: qsTr("Takes Second Seat Head last point forward")
                }
                ListElement {
                    command: qsTr("Second Seat Head take one step backward")
                    action: qsTr("Takes Second Seat Head one step backward")
                }
                ListElement {
                    command: qsTr("Second Seat Head take two step backward")
                    action: qsTr("Takes Second Seat Head two step backward")
                }
                ListElement {
                    command: qsTr("Second Seat Head take last point backward")
                    action: qsTr("Takes Second Seat Head last point backward")
                }




                ListElement {
                    command: qsTr("Third seat back take one step forward")
                    action: qsTr("Takes Third Seat back one step forward")
                }
                ListElement {
                    command: qsTr("Third seat back take two step forward")
                    action: qsTr("Takes Third Seat back two step forward")
                }
                ListElement {
                    command: qsTr("Third seat back take last point forward")
                    action: qsTr("Takes Third Seat back last point forward")
                }
                ListElement {
                    command: qsTr("Third seat back take one step backward")
                    action: qsTr("Takes Third Seat back one step backward")
                }
                ListElement {
                    command: qsTr("Third seat back take two step backward")
                    action: qsTr("Takes Third Seat back two step backward")
                }
                ListElement {
                    command: qsTr("Third seat back take last point backward")
                    action: qsTr("Takes Third Seat back last point backward")
                }



                ListElement {
                    command: qsTr("Third Seat take one step forward")
                    action: qsTr("Takes Third Seat one step forward")
                }
                ListElement {
                    command: qsTr("Third Seat take two step forward")
                    action: qsTr("Takes Third Seat two step forward")
                }
                ListElement {
                    command: qsTr("Third Seat take last point forward")
                    action: qsTr("Takes Third Seat last point forward")
                }
                ListElement {
                    command: qsTr("Third Seat take one step backward")
                    action: qsTr("Takes Third Seat one step backward")
                }
                ListElement {
                    command: qsTr("Third Seat take two step backward")
                    action: qsTr("Takes Third Seat two step backward")
                }
                ListElement {
                    command: qsTr("Third Seat take last point backward")
                    action: qsTr("Takes Third Seat last point backward")
                }



                ListElement {
                    command: qsTr("Third Seat take one step forward")
                    action: qsTr("Takes Third Seat one step forward")
                }
                ListElement {
                    command: qsTr("Third Seat take two step forward")
                    action: qsTr("Takes Third Seat two step forward")
                }
                ListElement {
                    command: qsTr("Third Seat take last point forward")
                    action: qsTr("Takes Third Seat last point forward")
                }
                ListElement {
                    command: qsTr("Third Seat take one step backward")
                    action: qsTr("Takes Third Seat one step backward")
                }
                ListElement {
                    command: qsTr("Third Seat take two step backward")
                    action: qsTr("Takes Third Seat two step backward")
                }
                ListElement {
                    command: qsTr("Third Seat take last point backward")
                    action: qsTr("Takes Third Seat last point backward")
                }




                ListElement {
                    command: qsTr("Third Seat Head take one step forward")
                    action: qsTr("Takes Third Seat Head one step forward")
                }
                ListElement {
                    command: qsTr("Third Seat Head take two step forward")
                    action: qsTr("Takes Third Seat Head two step forward")
                }
                ListElement {
                    command: qsTr("Third Seat Head take last point forward")
                    action: qsTr("Takes Third Seat Head last point forward")
                }
                ListElement {
                    command: qsTr("Third Seat Head take one step backward")
                    action: qsTr("Takes Third Seat Head one step backward")
                }
                ListElement {
                    command: qsTr("Third Seat Head take two step backward")
                    action: qsTr("Takes Third Seat Head two step backward")
                }
                ListElement {
                    command: qsTr("Third Seat Head take last point backward")
                    action: qsTr("Takes Third Seat Head last point backward")
                }




                ListElement {
                    command: qsTr("Fourth seat back take one step forward")
                    action: qsTr("Takes Fourth Seat back one step forward")
                }
                ListElement {
                    command: qsTr("Fourth seat back take two step forward")
                    action: qsTr("Takes Fourth Seat back two step forward")
                }
                ListElement {
                    command: qsTr("Fourth seat back take last point forward")
                    action: qsTr("Takes Fourth Seat back last point forward")
                }
                ListElement {
                    command: qsTr("Fourth seat back take one step backward")
                    action: qsTr("Takes Fourth Seat back one step backward")
                }
                ListElement {
                    command: qsTr("Fourth seat back take two step backward")
                    action: qsTr("Takes Fourth Seat back two step backward")
                }
                ListElement {
                    command: qsTr("Fourth seat back take last point backward")
                    action: qsTr("Takes Fourth Seat back last point backward")
                }



                ListElement {
                    command: qsTr("Fourth Seat take one step forward")
                    action: qsTr("Takes Fourth Seat one step forward")
                }
                ListElement {
                    command: qsTr("Fourth Seat take two step forward")
                    action: qsTr("Takes Fourth Seat two step forward")
                }
                ListElement {
                    command: qsTr("Fourth Seat take last point forward")
                    action: qsTr("Takes Fourth Seat last point forward")
                }
                ListElement {
                    command: qsTr("Fourth Seat take one step backward")
                    action: qsTr("Takes Fourth Seat one step backward")
                }
                ListElement {
                    command: qsTr("Fourth Seat take two step backward")
                    action: qsTr("Takes Fourth Seat two step backward")
                }
                ListElement {
                    command: qsTr("Fourth Seat take last point backward")
                    action: qsTr("Takes Fourth Seat last point backward")
                }



                ListElement {
                    command: qsTr("Fourth Seat take one step forward")
                    action: qsTr("Takes Fourth Seat one step forward")
                }
                ListElement {
                    command: qsTr("Fourth Seat take two step forward")
                    action: qsTr("Takes Fourth Seat two step forward")
                }
                ListElement {
                    command: qsTr("Fourth Seat take last point forward")
                    action: qsTr("Takes Fourth Seat last point forward")
                }
                ListElement {
                    command: qsTr("Fourth Seat take one step backward")
                    action: qsTr("Takes Fourth Seat one step backward")
                }
                ListElement {
                    command: qsTr("Fourth Seat take two step backward")
                    action: qsTr("Takes Fourth Seat two step backward")
                }
                ListElement {
                    command: qsTr("Fourth Seat take last point backward")
                    action: qsTr("Takes Fourth Seat last point backward")
                }




                ListElement {
                    command: qsTr("Fourth Seat Head take one step forward")
                    action: qsTr("Takes Fourth Seat Head one step forward")
                }
                ListElement {
                    command: qsTr("Fourth Seat Head take two step forward")
                    action: qsTr("Takes Fourth Seat Head two step forward")
                }
                ListElement {
                    command: qsTr("Fourth Seat Head take last point forward")
                    action: qsTr("Takes Fourth Seat Head last point forward")
                }
                ListElement {
                    command: qsTr("Fourth Seat Head take one step backward")
                    action: qsTr("Takes Fourth Seat Head one step backward")
                }
                ListElement {
                    command: qsTr("Fourth Seat Head take two step backward")
                    action: qsTr("Takes Fourth Seat Head two step backward")
                }
                ListElement {
                    command: qsTr("Fourth Seat Head take last point backward")
                    action: qsTr("Takes Fourth Seat Head last point backward")
                }




                ListElement {
                    command: qsTr("Fifth seat back take one step forward")
                    action: qsTr("Takes Fifth Seat back one step forward")
                }
                ListElement {
                    command: qsTr("Fifth seat back take two step forward")
                    action: qsTr("Takes Fifth Seat back two step forward")
                }
                ListElement {
                    command: qsTr("Fifth seat back take last point forward")
                    action: qsTr("Takes Fifth Seat back last point forward")
                }
                ListElement {
                    command: qsTr("Fifth seat back take one step backward")
                    action: qsTr("Takes Fifth Seat back one step backward")
                }
                ListElement {
                    command: qsTr("Fifth seat back take two step backward")
                    action: qsTr("Takes Fifth Seat back two step backward")
                }
                ListElement {
                    command: qsTr("Fifth seat back take last point backward")
                    action: qsTr("Takes Fifth Seat back last point backward")
                }



                ListElement {
                    command: qsTr("Fifth Seat take one step forward")
                    action: qsTr("Takes Fifth Seat one step forward")
                }
                ListElement {
                    command: qsTr("Fifth Seat take two step forward")
                    action: qsTr("Takes Fifth Seat two step forward")
                }
                ListElement {
                    command: qsTr("Fifth Seat take last point forward")
                    action: qsTr("Takes Fifth Seat last point forward")
                }
                ListElement {
                    command: qsTr("Fifth Seat take one step backward")
                    action: qsTr("Takes Fifth Seat one step backward")
                }
                ListElement {
                    command: qsTr("Fifth Seat take two step backward")
                    action: qsTr("Takes Fifth Seat two step backward")
                }
                ListElement {
                    command: qsTr("Fifth Seat take last point backward")
                    action: qsTr("Takes Fifth Seat last point backward")
                }



                ListElement {
                    command: qsTr("Fifth Seat take one step forward")
                    action: qsTr("Takes Fifth Seat one step forward")
                }
                ListElement {
                    command: qsTr("Fifth Seat take two step forward")
                    action: qsTr("Takes Fifth Seat two step forward")
                }
                ListElement {
                    command: qsTr("Fifth Seat take last point forward")
                    action: qsTr("Takes Fifth Seat last point forward")
                }
                ListElement {
                    command: qsTr("Fifth Seat take one step backward")
                    action: qsTr("Takes Fifth Seat one step backward")
                }
                ListElement {
                    command: qsTr("Fifth Seat take two step backward")
                    action: qsTr("Takes Fifth Seat two step backward")
                }
                ListElement {
                    command: qsTr("Fifth Seat take last point backward")
                    action: qsTr("Takes Fifth Seat last point backward")
                }




                ListElement {
                    command: qsTr("Fifth Seat Head take one step forward")
                    action: qsTr("Takes Fifth Seat Head one step forward")
                }
                ListElement {
                    command: qsTr("Fifth Seat Head take two step forward")
                    action: qsTr("Takes Fifth Seat Head two step forward")
                }
                ListElement {
                    command: qsTr("Fifth Seat Head take last point forward")
                    action: qsTr("Takes Fifth Seat Head last point forward")
                }
                ListElement {
                    command: qsTr("Fifth Seat Head take one step backward")
                    action: qsTr("Takes Fifth Seat Head one step backward")
                }
                ListElement {
                    command: qsTr("Fifth Seat Head take two step backward")
                    action: qsTr("Takes Fifth Seat Head two step backward")
                }
                ListElement {
                    command: qsTr("Fifth Seat Head take last point backward")
                    action: qsTr("Takes Fifth Seat Head last point backward")
                }




                ListElement {
                    command: qsTr("Sixth seat back take one step forward")
                    action: qsTr("Takes Sixth Seat back one step forward")
                }
                ListElement {
                    command: qsTr("Sixth seat back take two step forward")
                    action: qsTr("Takes Sixth Seat back two step forward")
                }
                ListElement {
                    command: qsTr("Sixth seat back take last point forward")
                    action: qsTr("Takes Sixth Seat back last point forward")
                }
                ListElement {
                    command: qsTr("Sixth seat back take one step backward")
                    action: qsTr("Takes Sixth Seat back one step backward")
                }
                ListElement {
                    command: qsTr("Sixth seat back take two step backward")
                    action: qsTr("Takes Sixth Seat back two step backward")
                }
                ListElement {
                    command: qsTr("Sixth seat back take last point backward")
                    action: qsTr("Takes Sixth Seat back last point backward")
                }



                ListElement {
                    command: qsTr("Sixth Seat take one step forward")
                    action: qsTr("Takes Sixth Seat one step forward")
                }
                ListElement {
                    command: qsTr("Sixth Seat take two step forward")
                    action: qsTr("Takes Sixth Seat two step forward")
                }
                ListElement {
                    command: qsTr("Sixth Seat take last point forward")
                    action: qsTr("Takes Sixth Seat last point forward")
                }
                ListElement {
                    command: qsTr("Sixth Seat take one step backward")
                    action: qsTr("Takes Sixth Seat one step backward")
                }
                ListElement {
                    command: qsTr("Sixth Seat take two step backward")
                    action: qsTr("Takes Sixth Seat two step backward")
                }
                ListElement {
                    command: qsTr("Sixth Seat take last point backward")
                    action: qsTr("Takes Sixth Seat last point backward")
                }



                ListElement {
                    command: qsTr("Sixth Seat take one step forward")
                    action: qsTr("Takes Sixth Seat one step forward")
                }
                ListElement {
                    command: qsTr("Sixth Seat take two step forward")
                    action: qsTr("Takes Sixth Seat two step forward")
                }
                ListElement {
                    command: qsTr("Sixth Seat take last point forward")
                    action: qsTr("Takes Sixth Seat last point forward")
                }
                ListElement {
                    command: qsTr("Sixth Seat take one step backward")
                    action: qsTr("Takes Sixth Seat one step backward")
                }
                ListElement {
                    command: qsTr("Sixth Seat take two step backward")
                    action: qsTr("Takes Sixth Seat two step backward")
                }
                ListElement {
                    command: qsTr("Sixth Seat take last point backward")
                    action: qsTr("Takes Sixth Seat last point backward")
                }




                ListElement {
                    command: qsTr("Sixth Seat Head take one step forward")
                    action: qsTr("Takes Sixth Seat Head one step forward")
                }
                ListElement {
                    command: qsTr("Sixth Seat Head take two step forward")
                    action: qsTr("Takes Sixth Seat Head two step forward")
                }
                ListElement {
                    command: qsTr("Sixth Seat Head take last point forward")
                    action: qsTr("Takes Sixth Seat Head last point forward")
                }
                ListElement {
                    command: qsTr("Sixth Seat Head take one step backward")
                    action: qsTr("Takes Sixth Seat Head one step backward")
                }
                ListElement {
                    command: qsTr("Sixth Seat Head take two step backward")
                    action: qsTr("Takes Sixth Seat Head two step backward")
                }
                ListElement {
                    command: qsTr("Sixth Seat Head take last point backward")
                    action: qsTr("Takes Sixth Seat Head last point backward")
                }




                ListElement {
                    command: qsTr("Luggage Curtain Open")
                    action: qsTr("Opens the Luggage Curtain")
                }
                ListElement {
                    command: qsTr("Luggage Curtain Close")
                    action: qsTr("Closes the Luggage Curtain")
                }
                ListElement {
                    command: qsTr("All Curtain Open")
                    action: qsTr("Opens all the Curtain")
                }
                ListElement {
                    command: qsTr("All Curtain Close")
                    action: qsTr("Closes all the Curtain")
                }




                ListElement {
                    command: qsTr("Take the first seat in sleep mode")
                    action: qsTr("Takes the first seat in sleep mode")
                }
                ListElement {
                    command: qsTr("Take the second seat in sleep mode")
                    action: qsTr("Takes the second seat in sleep mode")
                }
                ListElement {
                    command: qsTr("Gather first seat")
                    action: qsTr("Gathers first seat")
                }
                ListElement {
                    command: qsTr("Gather second seat")
                    action: qsTr("Gathers second seat")
                }
                ListElement {
                    command: qsTr("Take cinema mode")
                    action: qsTr("Takes cinema mode")
                }
                ListElement {
                    command: qsTr("Take conference mode")
                    action: qsTr("Takes conference mode")
                }
                ListElement {
                    command: qsTr("All tables open")
                    action: qsTr("Opens all tables")
                }
                ListElement {
                    command: qsTr("All tables close")
                    action: qsTr("Closes all tables")
                }
                ListElement {
                    command: qsTr("Gather all seats")
                    action: qsTr("Gathers all seats")
                }



                ListElement {
                    command: qsTr("In lights turn on")
                    action: qsTr("Turns on in lights")
                }
                ListElement {
                    command: qsTr("In lights turn off")
                    action: qsTr("Turns off in lights")
                }
                ListElement {
                    command: qsTr("Side lights turn on")
                    action: qsTr("Turns on Side lights")
                }
                ListElement {
                    command: qsTr("Side lights turn off")
                    action: qsTr("Turns off Side lights")
                }
                ListElement {
                    command: qsTr("Ceiling lights turn on")
                    action: qsTr("Turns on Ceiling lights")
                }
                ListElement {
                    command: qsTr("Ceiling lights turn off")
                    action: qsTr("Turns off Ceiling lights")
                }
                ListElement {
                    command: qsTr("System off")
                    action: qsTr("Turns the System off")
                }


                ListElement {
                    command: qsTr("Return to The Homepage")
                    action: qsTr("Returns to The Homepage")
                }




            }
            TableView {
                width: 770
                height: 450
                anchors.centerIn: infomenu

                TableViewColumn {
                    role: "command"
                    title: qsTr("Command") + mytrans.emptyString
                    width: 350
                }
                TableViewColumn {
                    role: "action"
                    title: qsTr("Action") + mytrans.emptyString
                    width: 400
                }
                model: libraryModel

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


    Text{
        id:infoheader
        anchors.horizontalCenter: parent.horizontalCenter
        visible: false
        y:120
        z:345
        text:qsTr("Command list that you can ask from the voice assistant.") + mytrans.emptyString
        font.family:GSystem.myriadproita.name
        font.pixelSize: 25
        color: "white"
    }


        Rectangle{
            id: infoclose
            width: 120
            height: 50
            color:"black"
            radius: 8
            visible: false
            anchors.horizontalCenter: parent.horizontalCenter
            y:620
            z:346
            Text{
                anchors.centerIn: parent
                text:qsTr("Close") + mytrans.emptyString
                font.family:GSystem.myriadproita.name
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
                    infoclose.color = "#1c1c1c"
                }
                onReleased: {
                    infoclose.color = "black"
                }
            }
        }




    //////////////////////////////////// INFO OVERLAY'ININ BİTTİĞİ YER








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
