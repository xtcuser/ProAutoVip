import QtQuick 2.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import ck.gmachine 1.0
import "../../Components"

BasePage {
    id:root
    caption: qsTr("PC HDMI") + mytrans.emptyString
    pageName: "PcHdmi"

    Image{
        id:image
        source:"qrc:/design/media/ikon-PC.svg"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        sourceSize.width: 400
        fillMode: Image.PreserveAspectFit
        antialiasing: true
        MouseArea{
            anchors.fill: parent
            onClicked: {
                       serial_mng.sendKey("media/hdmi")
            }
        }

    }
        Rectangle{
            anchors.top:image.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            id:bg
            width:120
            height:50
            radius: 10
            color:GSystem.leftTextMenuItemColor
            border.width: 4
            border.color: "white"
            Text{
                anchors.centerIn: parent
                text:qsTr("On/Off") + mytrans.emptyString
                color:"white"
                font.pixelSize: 22
                horizontalAlignment: Text.AlignHCenter
                font.family: GSystem.centurygothic.name
            }
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    bg.color=GSystem.leftTextMenuItemPressedColor;
                    serial_mng.sendKey("media/hdmi");
                }
                onReleased: {
                    bg.color=GSystem.leftTextMenuItemColor;

                }
            }
        }
}
