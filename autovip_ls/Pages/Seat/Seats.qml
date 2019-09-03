import QtQuick 2.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import ck.gmachine 1.0
import "../../Components"

BasePage {
    id:root
    caption:  qsTr("SEATS") + mytrans.emptyString
    function init()
    {
        ani.restart();
    }
    function end()
    {
        ani.stop();
    }
    function selectSeat(seat_no)
    {
        var data = seatsModel.get(seat_no - 1);
        GSystem.selectedSeat = seat_no
        GSystem.selectedSeatText = data.name;
        GSystem.state = data.name;
        GSystem.changePage(data.st);
    }
    Image{
        id: seatsimg
        anchors.centerIn: parent
        width:580
        source:"qrc:/design/seats/seats_bg.png"
        fillMode: Image.PreserveAspectFit
            Image{
                id:one
                x:340
                y:122
                source:"qrc:/design/general/one.svg"
                sourceSize.height: 55
                fillMode: Image.PreserveAspectFit
                MouseArea{
                    anchors.fill: parent
                    onClicked: selectSeat(1)
                }
            }
            Image{
                id:two
                x:390
                y:159
                source:"qrc:/design/general/two.svg"
                sourceSize.height: 55
                fillMode: Image.PreserveAspectFit
                MouseArea{
                    anchors.fill: parent
                    onClicked: selectSeat(2)
                }
            }
            Image{
                id:three
                x:161
                y:134
                source:"qrc:/design/general/three.svg"
                sourceSize.height: 55
                fillMode: Image.PreserveAspectFit
                MouseArea{
                    anchors.fill: parent
                    onClicked: selectSeat(3)
                }
            }
            Image{
                id:four
                x:205
                y:165
                source:"qrc:/design/general/four.svg"
                sourceSize.height: 55
                fillMode: Image.PreserveAspectFit
                MouseArea{
                    anchors.fill: parent
                    onClicked: selectSeat(4)
                }
            }
        }
    LeftTextMenu{
            id:leftMenu
            model:seatsModel
            //delegate: menuDelegate
            onClicked: function(ind)
            {
                var item = leftMenu.model.get(ind);
                GSystem.selectedSeat = item.seat_no
                GSystem.selectedSeatText = item.name;
                GSystem.state = item.st;
                GSystem.changePage(item.st);
            }
            /*
            Component {
                id:menuDelegate
                LeftTextButton{
                   text: qsTr(name) + mytrans.emptyString
                   area.onClicked: {
                        GSystem.selectedSeat = seat_no
                        GSystem.selectedSeatText = text;
                        GSystem.state = name;
                        GSystem.changePage(st);
                    }

                }
            }
            */

            ListModel {
                id: seatsModel

                ListElement {
                   name: qsTr("First Seat")
                   st: "OneSeat"
                   seat_no:1
                }
                ListElement {
                   name: qsTr("Second Seat")
                   st: "OneSeat"
                   seat_no:2
                }
                ListElement {
                   name: qsTr("Third Seat")
                   st: "OneSeat"
                   seat_no:3
                }
                ListElement {
                   name: qsTr("Fourth Seat")
                   st: "OneSeat"
                   seat_no:4
                }
            }

        }
//    SequentialAnimation{
//        id:ani
//        loops: Animation.Infinite
//        running: true
//        SequentialAnimation{
//            NumberAnimation{
//                target:one
//                properties:"y"
//                to:110
//                duration:500
//            }
//            NumberAnimation{
//                target:one
//                properties:"y"
//                to:122
//                duration:500
//            }
//        }
//        SequentialAnimation{
//            NumberAnimation{
//                target:two
//                properties:"y"
//                to:149
//                duration:500
//            }
//            NumberAnimation{
//                target:two
//                properties:"y"
//                to:159
//                duration:500
//            }
//        }
//        SequentialAnimation{
//            NumberAnimation{
//                target:three
//                properties:"y"
//                to:124
//                duration:500
//            }
//            NumberAnimation{
//                target:three
//                properties:"y"
//                to:134
//                duration:500
//            }
//        }
//        SequentialAnimation{
//            NumberAnimation{
//                target:four
//                properties:"y"
//                to:155
//                duration:500
//            }
//            NumberAnimation{
//                target:four
//                properties:"y"
//                to:165
//                duration:500
//            }
//        }
//    }
}
