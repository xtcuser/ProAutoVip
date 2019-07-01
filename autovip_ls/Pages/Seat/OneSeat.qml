import QtQuick 2.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import ck.gmachine 1.0
import "../../Components"

BasePage {
    id:root
    caption: GSystem.selectedSeatText
    pageName: "OneSeat"
    property int cwidth: (width - oneseat.width) / 2
    property int cheight: (height - oneseat.height) / 2
    function init()
    {
        ani.restart();
    }
    function end(){
        ani.stop();
    }

    function selectPart(ppart)
    {
        switch(ppart)
        {
        case "SeatHead":
            break;
        case "SeatBack":
            break;
        case "SeatPart":
        break;
        case "SeatFeat":
        break;
        default:
            return;
        }

        GSystem.state = ppart;
        GSystem.changePage(ppart);

    }

    Image{
        id:oneseat
        x:(root.width - oneseat.width) / 2
        y:(root.height - oneseat.height) / 2
        width:305
        fillMode: Image.PreserveAspectFit
        source:"qrc:/design/seats/one_seat.png"
        Rectangle{
            id: head
            x:210
            y:0
            width:82
            height:82
            radius: width / 2
            color:"transparent"
            MouseArea{
                anchors.fill: parent
                onClicked: selectPart("SeatHead")
            }
        }
        Rectangle{
            id: back
            x:132
            y:92
            width:190
            height:180
            rotation: 24
            color:"transparent"
            MouseArea{
                anchors.fill: parent
                onClicked: selectPart("SeatBack")
            }
        }


        Rectangle{
            id: seat
            x:0
            y:232
            width:180
            height:100
            rotation: 30
            color:"transparent"
            MouseArea {
                anchors.fill: parent
                onClicked:  selectPart("SeatPart")
            }
            }
        Rectangle{
                id: feat
                x:-50
                y:345
                width:180
                height:100
                rotation: 30
                color:"transparent"
                MouseArea
                {
                    anchors.fill: parent
                    onClicked: selectPart("SeatFeat")
                }
                }
        }

    LeftTextMenu{
            id:leftMenu
            model: GSystem.oneSeatModel
            onClicked: function(ind)
            {
                var item = leftMenu.model.get(ind);
                GSystem.changePage(item.st);

            }
            /*
            delegate: menuDelegate

            Component {
                id:menuDelegate
                LeftTextButton{
                   text: qsTr(name) + mytrans.emptyString
                   visible: isvis
                   area.onClicked: {
                        GSystem.state = name;
                        GSystem.changePage(st);
                    }

                }
            }
            */


            Component.onCompleted: {
            }

        }

    RightTextMenu{
            id:rightMenu
            model: GSystem.oneSeatRightModel
            onClicked: function(ind)
            {
                var item = rightMenu.model.get(ind);
                GSystem.changePage(item.st);

            }
            //delegate: rmenuDelegate

            /*
            Component {
                id:rmenuDelegate
                LeftTextButton{
                   text: qsTr(name) + mytrans.emptyString
                   area.onClicked: {
                        GSystem.state = name;
                        GSystem.changePage(st);
                    }

                }
            }
            */


            Component.onCompleted: {
            }

        }

    SequentialAnimation{
        id:ani
        loops: Animation.Infinite
        running: true
        SequentialAnimation{
            NumberAnimation{
                target:oneseat
                properties:"y"
                to:root.cheight - 10
                duration:500
            }
            NumberAnimation{
                target:oneseat
                properties:"y"
                to:root.cheight
                duration:500
            }
        }
         }
}
