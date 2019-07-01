import QtQuick 2.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import ck.gmachine 1.0
import "../../Components"

BasePage {
    id:root
    caption: qsTr("RIGHT WINDOW") + mytrans.emptyString
    pageName: "RightWindow"
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
                beforecode:"controls/window_rightopen"
            }
            ListElement{
                name: qsTr("Close")
                beforecode:"controls/window_rightclose"
            }
        }

        Repeater {
            model:tmodel
            Text {
                text: name
            }
        }

    }

        Image{
            width:500
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
            source:"qrc:/design/controls/right-window.png"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

        }

}
