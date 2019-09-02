import QtQuick 2.0
import ck.gmachine 1.0
Item{
    id:root
    width:200
    height:200
    anchors.centerIn: parent
    function init()
    {
        GSystem.seatPagePass(); //feedback request
    }
    Rectangle{
        width:275
        height: 265
        anchors.centerIn: parent
        color:Qt.rgba(0, 0, 0,0.4)
        border.width: 1
        border.color:Qt.rgba(0/255, 108/255, 128/255,0.6)
        Image {
            anchors.centerIn: parent
            source:"qrc:/design/seats/massage.png"
            width: 150
            height: 150
        }
        Item{
        id:no
        anchors.fill: parent
        visible:serial_mng.massagemod === 0
        Text{
            text: qsTr("MASSAGE OFF")  + mytrans.emptyString
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 7
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: GSystem.centurygothic.name
            font.pixelSize:  14
            color: "red"
        }
        }
        Item{
        id:shoulderthigh
        anchors.fill: parent
        visible:serial_mng.massagemod === 1
        Image{
            x:193
            y:92
            source:"qrc:/design/seats/pointer.png"
            width:32
            fillMode: Image.PreserveAspectFit
        }
        Image{
            x:119
            y:154
            source:"qrc:/design/seats/pointer.png"
            width:32
            fillMode: Image.PreserveAspectFit
        }
        Text{
            text: qsTr("SHOULDER AND THIGH")  + mytrans.emptyString
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 7
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: GSystem.centurygothic.name
            font.pixelSize:  14
            color: "white"
        }
        }
        Item{
        id:waistthigh
        anchors.fill: parent
        visible:serial_mng.massagemod === 2
        Image{
            x:121
            y:152
            source:"qrc:/design/seats/pointer.png"
            width:32
            fillMode: Image.PreserveAspectFit
        }

        Image{
            x:162
            y:137
            source:"qrc:/design/seats/pointer.png"
            width:32
            fillMode: Image.PreserveAspectFit
        }
        Text{
            text: qsTr("WAIST ANT THIGH")  + mytrans.emptyString
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 7
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: GSystem.centurygothic.name
            font.pixelSize:  14
            color: "white"
        }
        }
        Item{
        id:shoulderwaist
        anchors.fill: parent
        visible:serial_mng.massagemod === 3
        Image{
            x:199
            y:91
            source:"qrc:/design/seats/pointer.png"
            width:32
            fillMode: Image.PreserveAspectFit
        }
        Image{
            x:161
            y:131
            source:"qrc:/design/seats/pointer.png"
            width:32
            fillMode: Image.PreserveAspectFit
        }
        Text{
            text: qsTr("SHOULDER AND WAIST")  + mytrans.emptyString
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 7
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: GSystem.centurygothic.name
            font.pixelSize:  14
            color: "white"
        }
        }
        Item{
        id:pulse
        anchors.fill: parent
        visible:serial_mng.massagemod === 4
        Image{
            x:114
            y:131
            source:"qrc:/design/seats/pointer.png"
            width:32
            fillMode: Image.PreserveAspectFit
        }

        Text{
            text: qsTr("PULSE")  + mytrans.emptyString
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 7
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: GSystem.centurygothic.name
            font.pixelSize:  14
            color: "white"
        }
        }
        Item{
        id:smooth
        anchors.fill: parent
        visible:serial_mng.massagemod === 5

        Image{
            x:68
            y:178
            source:"qrc:/design/seats/pointer.png"
            width:32
            fillMode: Image.PreserveAspectFit
        }
        Image{
            x:129
            y:147
            source:"qrc:/design/seats/pointer.png"
            width:32
            fillMode: Image.PreserveAspectFit
        }

        Image{
            x:185
            y:105
            source:"qrc:/design/seats/pointer.png"
            width:32
            fillMode: Image.PreserveAspectFit
        }
        Image{
            x:206
            y:71
            rotation: -50
            source:"qrc:/design/seats/pointer.png"
            width:32
            fillMode: Image.PreserveAspectFit
        }
        Text{
            text: qsTr("SMOOTH")  + mytrans.emptyString
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 7
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: GSystem.centurygothic.name
            font.pixelSize:  21
            color: "white"
        }
        }
        Item{
        id:shoulder
        anchors.fill: parent
        visible:serial_mng.massagemod === 6
        Image{
            x:200
            y:96
            source:"qrc:/design/seats/pointer.png"
            width:32
            fillMode: Image.PreserveAspectFit
        }

        Text{
            text: qsTr("SHOULDER")  + mytrans.emptyString
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 7
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize:  14
            font.family: GSystem.centurygothic.name
            color: "white"
        }
        }
        Item{
        id:thigh
        anchors.fill: parent
        visible:serial_mng.massagemod === 7
        Image{
            x:138
            y:154
            source:"qrc:/design/seats/pointer.png"
            width:32
            fillMode: Image.PreserveAspectFit
        }
        Text{
            text: qsTr("THIGH")  + mytrans.emptyString
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 7
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: GSystem.centurygothic.name
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize:  14
            color: "white"
        }
        }
        Item{
        id:relax
        anchors.fill: parent
        visible:serial_mng.massagemod === 8
        Text{
            text: qsTr("RELAX")  + mytrans.emptyString
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 7
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: GSystem.centurygothic.name
            font.pixelSize:  14
            color: "white"
        }
        }

        MouseArea{
        anchors.fill: parent
        onPressed:{
                    var plus = true;
                    plus = GSystem.sendSeatCommand("massage_mode");
//                    if(plus)
//                    {
//                        serial_mng.massagemod = (serial_mng.massagemod + 1) % 9;
//                        if(serial_mng.massagemod === 0)
//                        {
//                            serial_mng.massageon = 0;
//                        }else{
//                            serial_mng.massageon = 1;
//                        }
//                    }
        }
        onReleased: { }
        }

    }
}

