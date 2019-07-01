import QtQuick 2.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import ck.gmachine 1.0
import "../../Components"

BasePage {
    id:root
    caption: qsTr("TABLES") + mytrans.emptyString
    Image{
        x:0
        y:0
        width:parent.width
        height:parent.height
        LeftTextMenu{
            id:leftMenu
            model:tablesModel

        }
        ListModel{
            id:tablesModel
            ListElement
            {
                name: qsTr("Left Table")
                st:"LeftTable"
            }
            ListElement
            {
                name: qsTr("Right Table")
                st:"RightTable"
            }

        }

        Repeater {
            model:tablesModel
            Text {
                text: name
            }
        }
        Image{
            x:252
            y:208
            source:"qrc:/design/controls/tables.png"
            Item{
                id:ltable
                x:0
                y:120
                width:322
                height:94
                Rectangle{
                    anchors.centerIn: parent
                    color:"white"
                    width: 20
                    height: 20
                    radius: width/2
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                                GSystem.state = "LeftTable";
                                GSystem.changePage("LeftTable");
                    }
                    cursorShape: Qt.PointingHandCursor
                }
            }
            Item{
                id:rtable
                x:parent.width - width
                y:120
                width:322
                height:94
                Rectangle{
                    anchors.centerIn: parent
                    color:"white"
                    width: 20
                    height: 20
                    radius: width/2
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                                GSystem.state = "RightTable";
                                GSystem.changePage("RightTable");
                    }
                    cursorShape: Qt.PointingHandCursor
                }
            }
        }

        }

}
