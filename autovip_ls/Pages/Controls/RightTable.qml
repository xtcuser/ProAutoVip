import QtQuick 2.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import ck.gmachine 1.0
import "../../Components"

BasePage {
    id:root
    caption: qsTr("RIGHT TABLE") + mytrans.emptyString
    pageName: "RightTable"
    Image{
        x:0
        y:0
        width:parent.width
        height:parent.height
        LeftTextMenu
        {
            id: leftMenu
            model:tmodel
        }
        ListModel{
            id: tmodel
            ListElement{
                name: qsTr("Open")
                beforecode:"fourth_seat/table_open"
                releasecode:"fourth_seat/table_stop"
            }
            ListElement{
                name: qsTr("Close")
                beforecode:"fourth_seat/table_close"
                releasecode:"fourth_seat/table_stop"
            }
        }

//        Repeater {
//            model:tmodel
//            Text {
//                text: name
//            }
//        }

            Image{
                x:252
                anchors.verticalCenter: parent.verticalCenter
                source:"qrc:/design/controls/righttable.png"
            }

        }
}
