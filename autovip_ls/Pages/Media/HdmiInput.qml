import QtQuick 2.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import ck.gmachine 1.0
import "../../Components"

BasePage {
    id:root
    caption: qsTr("HDMI INPUT") + mytrans.emptyString
    pageName: "HdmiInput"
    Image{
        x:0
        y:0
        width:parent.width
        height:parent.height
        Rectangle{
            id:leftMenu
            color:"#99000000"
            width: 246
            height:280
            x:0
            y:273

            ColumnLayout
            {
                width:parent.width
                height:parent.height
                LeftButton{
                   text: "Open"
                   onClicked: {
                       serial_mng.sendKey("media/hdmi")
                   }

                }

            }
        }


        }

    Image{
        source:"qrc:/design/media/hdmi.svg"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        sourceSize.width: 400
        sourceSize.height: 400
        MouseArea{
            anchors.fill: parent
            onClicked: {
                       serial_mng.sendKey("media/hdmi")
            }
        }

    }
}
