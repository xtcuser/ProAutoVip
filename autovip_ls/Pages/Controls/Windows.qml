import QtQuick 2.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import ck.gmachine 1.0
import "../../Components"

BasePage {
    id:root
    caption: qsTr("WINDOWS") + mytrans.emptyString
    pageName: "Windows"
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
                name: qsTr("Left Window")
                st:"LeftWindow"

            }
            ListElement{
                name: qsTr("Right Window")
                st:"RightWindow"
            }
        }

//        Repeater {
//            model:tmodel
//            Text {
//                text: name
//            }
//        }


        Rectangle{
            width: 700
            height: 500
            x:180
            y:150
            color: "transparent"
            RowLayout{
                spacing:60
                width:parent.width
                anchors.verticalCenter: parent.verticalCenter
                Rectangle{
                    Layout.preferredWidth: 300
                    Layout.preferredHeight: 500
                    color: "transparent"
                    Image{
                        scale:0.7
                        anchors.verticalCenter: parent.verticalCenter
                        source:"qrc:/design/controls/left-window.png"
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                GSystem.state = "LeftWindow";
                                GSystem.changePage("LeftWindow");
                            }
                        }
                    }
                }

                Rectangle{
                    Layout.preferredWidth: 300
                    Layout.preferredHeight: 500
                    color: "transparent"
                    Image{
                        scale:0.7
                        anchors.verticalCenter: parent.verticalCenter
                        source:"qrc:/design/controls/right-window.png"
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                GSystem.state = "RightWindow";
                                GSystem.changePage("RightWindow");
                            }
                        }
                    }
                }
            }
        }

    }
}
