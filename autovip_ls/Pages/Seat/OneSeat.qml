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
        GSystem.seatPagePass(); //feedback request
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




//    LeftTextMenu{
//            id:leftMenu
//            model: GSystem.oneSeatModel
//            onClicked: function(ind)
//            {
//                var item = leftMenu.model.get(ind);
//                GSystem.changePage(item.st);

//            }
//            /*
//            delegate: menuDelegate

//            Component {
//                id:menuDelegate
//                LeftTextButton{
//                   text: qsTr(name) + mytrans.emptyString
//                   visible: isvis
//                   area.onClicked: {
//                        GSystem.state = name;
//                        GSystem.changePage(st);
//                    }

//                }
//            }
//            */


//            Component.onCompleted: {
//            }

//        }



    Rectangle{
        width: 360
        height: 360
        color:"transparent"
        anchors.right: oneseat.left
        anchors.verticalCenter: parent.verticalCenter

        ColumnLayout{
            spacing: 20
            anchors.fill:parent

            Rectangle {
                id:headbt
                width:275
                height:75
                anchors.horizontalCenter: parent.horizontalCenter
                color:Qt.rgba(0, 0, 0,0.4)
                border.width: 1
                border.color:Qt.rgba(0/255, 108/255, 128/255,0.6)
                Text{
                    font.family: GSystem.myriadproita.name
                    font.italic: true
                    font.pixelSize: 24
                    text: qsTr("Head")
                    color: "white"
                    anchors.centerIn: parent
                }
                Rectangle{
                    id:headup
                    width: 75
                    height: 75
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left:parent.left
                    color: "transparent"
                    border.width: 1
                    border.color:Qt.rgba(0/255, 108/255, 128/255,0.6)
                    Text {
                        font.family: GSystem.myriadproita.name
                        font.pixelSize: 24
                        text: qsTr("↑")
                        color: "white"
                        anchors.centerIn: parent
                    }
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onPressed: function(){
                            GSystem.sendSeatCommand("head_up");
                            headup.color = Qt.rgba(0/255, 108/255, 128/255,0.6);
                        }
                        onReleased: function(){
                            GSystem.sendSeatCommand("head_stop");
                            headup.color = "transparent";
                        }
                    }
                }


                Rectangle{
                    id:headdown
                    width: 75
                    height: 75
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right:parent.right
                    color: "transparent"
                    border.width: 1
                    border.color:Qt.rgba(0/255, 108/255, 128/255,0.6)
                    Text {
                        font.family: GSystem.myriadproita.name
                        font.pixelSize: 24
                        text: qsTr("↓")
                        color: "white"
                        anchors.centerIn: parent
                    }
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onPressed: function(){
                            GSystem.sendSeatCommand("head_down");
                            headdown.color = Qt.rgba(0/255, 108/255, 128/255,0.6);
                        }
                        onReleased: function(){
                            GSystem.sendSeatCommand("head_stop");
                            headdown.color = "transparent";
                        }
                    }
                }

            }

            Rectangle {
                id:seatbackbt
                width:275
                height:75
                anchors.horizontalCenter: parent.horizontalCenter
                color:Qt.rgba(0, 0, 0,0.4)
                border.width: 1
                border.color:Qt.rgba(0/255, 108/255, 128/255,0.6)
                Text{
                    font.family: GSystem.myriadproita.name
                    font.italic: true
                    font.pixelSize: 24
                    text: qsTr("Seat Back")
                    color: "white"
                    anchors.centerIn: parent
                }
                Rectangle{
                    id:seatbackleft
                    width: 75
                    height: 75
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left:parent.left
                    color: "transparent"
                    border.width: 1
                    border.color:Qt.rgba(0/255, 108/255, 128/255,0.6)
                    Text {
                        font.family: GSystem.myriadproita.name
                        font.pixelSize: 24
                        text: qsTr("←")
                        color: "white"
                        anchors.centerIn: parent
                    }
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onPressed: function(){
                            GSystem.sendSeatCommand("back_forward");
                            seatbackleft.color = Qt.rgba(0/255, 108/255, 128/255,0.6);
                        }
                        onReleased: function(){
                            GSystem.sendSeatCommand("back_stop");
                            seatbackleft.color = "transparent";
                        }
                    }
                }


                Rectangle{
                    id:seatbackright
                    width: 75
                    height: 75
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right:parent.right
                    color: "transparent"
                    border.width: 1
                    border.color:Qt.rgba(0/255, 108/255, 128/255,0.6)
                    Text {
                        font.family: GSystem.myriadproita.name
                        font.pixelSize: 24
                        text: qsTr("→")
                        color: "white"
                        anchors.centerIn: parent
                    }
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onPressed: function(){
                            GSystem.sendSeatCommand("back_backward");
                            seatbackright.color = Qt.rgba(0/255, 108/255, 128/255,0.6);
                        }
                        onReleased: function(){
                            GSystem.sendSeatCommand("back_stop");
                            seatbackright.color = "transparent";
                        }
                    }
                }

            }

            Rectangle {
                id:seatbt
                width:275
                height:75
                anchors.horizontalCenter: parent.horizontalCenter
                color:Qt.rgba(0, 0, 0,0.4)
                border.width: 1
                border.color:Qt.rgba(0/255, 108/255, 128/255,0.6)
                Text{
                    font.family: GSystem.myriadproita.name
                    font.italic: true
                    font.pixelSize: 24
                    text: qsTr("Seat")
                    color: "white"
                    anchors.centerIn: parent
                }
                Rectangle{
                    id:seatleft
                    width: 75
                    height: 75
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left:parent.left
                    color: "transparent"
                    border.width: 1
                    border.color:Qt.rgba(0/255, 108/255, 128/255,0.6)
                    Text {
                        font.family: GSystem.myriadproita.name
                        font.pixelSize: 24
                        text: qsTr("←")
                        color: "white"
                        anchors.centerIn: parent
                    }
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onPressed: function(){
                            GSystem.sendSeatCommand("seat_forward");
                            seatleft.color = Qt.rgba(0/255, 108/255, 128/255,0.6);
                        }
                        onReleased: function(){
                            GSystem.sendSeatCommand("seat_stop");
                            seatleft.color = "transparent";
                        }
                    }
                }

                Rectangle{
                    id:seatright
                    width: 75
                    height: 75
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right:parent.right
                    color: "transparent"
                    border.width: 1
                    border.color:Qt.rgba(0/255, 108/255, 128/255,0.6)
                    Text {
                        font.family: GSystem.myriadproita.name
                        font.pixelSize: 24
                        text: qsTr("→")
                        color: "white"
                        anchors.centerIn: parent
                    }
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onPressed: function(){
                            GSystem.sendSeatCommand("seat_backward");
                            seatright.color = Qt.rgba(0/255, 108/255, 128/255,0.6);
                        }
                        onReleased: function(){
                            GSystem.sendSeatCommand("seat_stop");
                            seatright.color = "transparent";
                        }
                    }
                }

            }


                Rectangle {
                    id:drawerbt
                    width:275
                    height:75
                    anchors.horizontalCenter: parent.horizontalCenter
                    color:Qt.rgba(0, 0, 0,0.4)
                    border.width: 1
                    border.color:Qt.rgba(0/255, 108/255, 128/255,0.6)
                    Text{
                        font.family: GSystem.myriadproita.name
                        font.italic: true
                        font.pixelSize: 24
                        text: qsTr("Drawer")
                        color: "white"
                        anchors.centerIn: parent
                    }
                    Rectangle{
                        id:drawerleft
                        width: 75
                        height: 75
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left:parent.left
                        color: "transparent"
                        border.width: 1
                        border.color:Qt.rgba(0/255, 108/255, 128/255,0.6)
                        Text {
                            font.family: GSystem.myriadproita.name
                            font.pixelSize: 24
                            text: qsTr("←")
                            color: "white"
                            anchors.centerIn: parent
                        }
                        MouseArea{
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onPressed: function(){
                                GSystem.sendSeatCommand("drawer_open");
                                drawerleft.color = Qt.rgba(0/255, 108/255, 128/255,0.6);
                            }
                            onReleased: function(){
                                GSystem.sendSeatCommand("drawer_stop");
                                drawerleft.color = "transparent";
                            }
                        }
                    }


                    Rectangle{
                        id:drawerright
                        width: 75
                        height: 75
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right:parent.right
                        color: "transparent"
                        border.width: 1
                        border.color:Qt.rgba(0/255, 108/255, 128/255,0.6)
                        Text {
                            font.family: GSystem.myriadproita.name
                            font.pixelSize: 24
                            text: qsTr("→")
                            color: "white"
                            anchors.centerIn: parent
                        }
                        MouseArea{
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onPressed: function(){
                                GSystem.sendSeatCommand("drawer_open");
                                drawerright.color = Qt.rgba(0/255, 108/255, 128/255,0.6);
                            }
                            onReleased: function(){
                                GSystem.sendSeatCommand("drawer_stop");
                                drawerright.color = "transparent";
                            }
                        }
                    }

            }



        }
    }



//    RightTextMenu{
//            id:rightMenu
//            model: GSystem.oneSeatRightModel
//            onClicked: function(ind)
//            {
//                var item = rightMenu.model.get(ind);
//                GSystem.changePage(item.st);

//            }
//            //delegate: rmenuDelegate

//            /*
//            Component {
//                id:rmenuDelegate
//                LeftTextButton{
//                   text: qsTr(name) + mytrans.emptyString
//                   area.onClicked: {
//                        GSystem.state = name;
//                        GSystem.changePage(st);
//                    }

//                }
//            }
//            */


//            Component.onCompleted: {
//            }

//        }



    Rectangle{
        width: 360
        height: 360
        color:"transparent"
        anchors.left: oneseat.right
        anchors.verticalCenter: parent.verticalCenter

        ColumnLayout{
            spacing: 20
            anchors.fill:parent
            anchors.horizontalCenter: parent.horizontalCenter
            Rectangle{
                id:yesmassage
                visible: massagebt.color===Qt.rgba(0, 0, 0,0.4)?false:true
                width: 200
                height: 250
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top:parent.top
                color: "transparent"
                CSeatMassage{
                    anchors.fill: parent
                }
            }

            ColumnLayout {
                id: nomassage
                anchors.fill:parent
                visible: massagebt.color===Qt.rgba(0, 0, 0,0.4)?true:false
                spacing: 20
                Rectangle {
                    id:thighbt
                    width:275
                    height:75
                    anchors.horizontalCenter: parent.horizontalCenter
                    color:Qt.rgba(0, 0, 0,0.4)
                    border.width: 1
                    border.color:Qt.rgba(0/255, 108/255, 128/255,0.6)
                    Text{
                        font.family: GSystem.myriadproita.name
                        font.italic: true
                        font.pixelSize: 24
                        text: qsTr("Thigh")
                        color: "white"
                        anchors.centerIn: parent
                    }
                    Rectangle{
                        id:thighup
                        width: 75
                        height: 75
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left:parent.left
                        color: "transparent"
                        border.width: 1
                        border.color:Qt.rgba(0/255, 108/255, 128/255,0.6)
                        Text {
                            font.family: GSystem.myriadproita.name
                            font.pixelSize: 24
                            text: qsTr("↑")
                            color: "white"
                            anchors.centerIn: parent
                        }
                        MouseArea{
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onPressed: function(){
                                GSystem.sendSeatCommand("thigh_up");
                                thighup.color = Qt.rgba(0/255, 108/255, 128/255,0.6);
                            }
                            onReleased: function(){
                                GSystem.sendSeatCommand("thigh_stop");
                                thighup.color = "transparent";
                            }
                        }
                    }


                    Rectangle{
                        id:thighdown
                        width: 75
                        height: 75
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right:parent.right
                        color: "transparent"
                        border.width: 1
                        border.color:Qt.rgba(0/255, 108/255, 128/255,0.6)
                        Text {
                            font.family: GSystem.myriadproita.name
                            font.pixelSize: 24
                            text: qsTr("↓")
                            color: "white"
                            anchors.centerIn: parent
                        }
                        MouseArea{
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onPressed: function(){
                                GSystem.sendSeatCommand("thigh_down");
                                thighdown.color = Qt.rgba(0/255, 108/255, 128/255,0.6);
                            }
                            onReleased: function(){
                                GSystem.sendSeatCommand("thigh_stop");
                                thighdown.color = "transparent";
                            }
                        }
                    }

                }

                Rectangle {
                    id:coolinbt
                    width:275
                    height:75
                    anchors.horizontalCenter: parent.horizontalCenter
                    color:Qt.rgba(0, 0, 0,0.4)
                    border.width: 1
                    border.color:Qt.rgba(0/255, 108/255, 128/255,0.6)
                    RowLayout{
                        anchors.fill: parent
                        spacing: 0
                        Rectangle{
                            id:coolintext
                            width: 200
                            height: parent.height
                            border.width: 1
                            border.color:Qt.rgba(0/255, 108/255, 128/255,0.6)
                            color:"transparent"
                            Text{
                                font.family: GSystem.myriadproita.name
                                font.italic: true
                                font.pixelSize: 24
                                text: qsTr("Seat Cooling")
                                color: "white"
                                anchors.centerIn: parent
                            }
                            MouseArea{
                                anchors.fill: parent
                                onPressed: function(){
                                    coolintext.color = Qt.rgba(0/255, 108/255, 128/255,0.6);
                                }
                                onReleased: function(){
                                    coolintext.color = "transparent";
                                }
                            }
                        }
                        Rectangle{
                            id:coolinarea
                            width: 75
                            height: parent.height
                            border.width: 1
                            border.color:Qt.rgba(0/255, 108/255, 128/255,0.6)
                            color: "transparent"
                            Column
                            {
                                anchors.centerIn: parent
                                id:cooldegree
                                spacing: 5
                                        Rectangle{
                                        id:coollevel1
                                        radius: 5
                                        width:30
                                        height:5
                                        color:serial_mng.cool>2?"#4ab8f7":"white"
                                            MouseArea{
                                               anchors.fill: parent
                                               cursorShape: Qt.IBeamCursor;
                                            }
                                        }
                                        Rectangle{
                                        id:coollevel2
                                        radius: 5
                                        width:30
                                        height:5
                                        color:serial_mng.cool>1?"#4ab8f7":"white"
                                            MouseArea{
                                               anchors.fill: parent
                                               cursorShape: Qt.IBeamCursor;
                                            }
                                        }
                                        Rectangle{
                                        id:coollevel3
                                        radius: 5
                                        width:30
                                        height:5
                                        color:serial_mng.cool>0?"#4ab8f7":"white"
                                            MouseArea{
                                               anchors.fill: parent
                                               cursorShape: Qt.IBeamCursor;
                                            }
                                        }
                            }
                            MouseArea{
                                        anchors.fill: parent
                                        onPressed: {
                                            GSystem.sendSeatCommand("cooling");
    //                                        var plus =  GSystem.sendSeatCommand("cooling");
    //                                        if(plus)
    //                                        {
    //                                            //feedback'den geleceği için yorum satırı yapıldı
    //                                            //serial_mng.cool = (serial_mng.cool +1) % 4;
    //                                        }
                                        }
                                    }
                        }
                    }
                }

                Rectangle {
                    id:heatinbt
                    width:275
                    height:75
                    anchors.horizontalCenter: parent.horizontalCenter
                    color:Qt.rgba(0, 0, 0,0.4)
                    border.width: 1
                    border.color:Qt.rgba(0/255, 108/255, 128/255,0.6)
                    RowLayout{
                        anchors.fill: parent
                        spacing: 0
                        Rectangle{
                            id:heatintext
                            width: 200
                            height: parent.height
                            border.width: 1
                            border.color:Qt.rgba(0/255, 108/255, 128/255,0.6)
                            color:"transparent"
                            Text{
                                font.family: GSystem.myriadproita.name
                                font.italic: true
                                font.pixelSize: 24
                                text: qsTr("Seat Heating")
                                color: "white"
                                anchors.centerIn: parent
                            }
                            MouseArea{
                                anchors.fill: parent
                                onPressed: function(){
                                    heatintext.color = Qt.rgba(0/255, 108/255, 128/255,0.6);
                                }
                                onReleased: function(){
                                    heatintext.color = "transparent";
                                }
                            }
                        }
                        Rectangle{
                            id:heatinarea
                            width: 75
                            height: parent.height
                            border.width: 1
                            border.color:Qt.rgba(0/255, 108/255, 128/255,0.6)
                            color: "transparent"
                            Column
                            {
                                anchors.centerIn: parent
                                id:heatdegree
                                spacing: 5
                                        Rectangle{
                                        id:heatlevel1
                                        radius: 5
                                        width:30
                                        height:5
                                        color:serial_mng.cool>2?"#f92814":"white"
                                            MouseArea{
                                               anchors.fill: parent
                                               cursorShape: Qt.IBeamCursor;
                                            }
                                        }
                                        Rectangle{
                                        id:heatlevel2
                                        radius: 5
                                        width:30
                                        height:5
                                        color:serial_mng.cool>1?"#f92814":"white"
                                            MouseArea{
                                               anchors.fill: parent
                                               cursorShape: Qt.IBeamCursor;
                                            }
                                        }
                                        Rectangle{
                                        id:heatlevel3
                                        radius: 5
                                        width:30
                                        height:5
                                        color:serial_mng.cool>0?"#f92814":"white"
                                            MouseArea{
                                               anchors.fill: parent
                                               cursorShape: Qt.IBeamCursor;
                                            }
                                        }
                            }
                            MouseArea{
                                        anchors.fill: parent
                                        onPressed: {
                                            GSystem.sendSeatCommand("heating");
    //                                        var plus =  GSystem.sendSeatCommand("heating");
    //                                        if(plus)
    //                                        {
    //                                            //feedback'den geleceği için yorum satırı yapıldı
    //                                            //serial_mng.cool = (serial_mng.cool +1) % 4;
    //                                        }
                                        }
                                    }
                            }
                        }
                    }
                }
            Rectangle{
                id:massageroot
                width: 275
                height: 75
                anchors.horizontalCenter: parent.horizontalCenter
                color:"transparent"
                RowLayout{
                    anchors.fill:parent
                    spacing: 0
                    Rectangle {
                        id:massagebt
                        width:200
                        height:75
                        color:Qt.rgba(0, 0, 0,0.4)
                        border.width: 1
                        border.color:Qt.rgba(0/255, 108/255, 128/255,0.6)
                        Text{
                            font.family: GSystem.myriadproita.name
                            font.italic: true
                            font.pixelSize: 24
                            text: qsTr("Seat Massage")
                            color: "white"
                            anchors.centerIn: parent
                        }
                        MouseArea{
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: nomassage.visible === true?massagebt.color=Qt.rgba(0/255, 108/255, 128/255,0.6):massagebt.color=Qt.rgba(0, 0, 0,0.4)
                        }

                    }


                    Rectangle{
                        height:75
                        width: 75
                        border.color: Qt.rgba(0/255, 108/255, 128/255,0.6)
                        border.width: 1
                        color:serial_mng.massageon===0?Qt.rgba(0/255, 255/255, 0/255,0.6):Qt.rgba(255/255, 0/255, 0/255,0.6)
                        Text{
                            anchors.centerIn: parent
                            text: (serial_mng.massageon===0?qsTr("ON"):qsTr("OFF"))  + mytrans.emptyString
                            font.family: GSystem.myriadproita.name
                            font.italic: true
                            font.pixelSize: 24
                            color: "white"
                        }
                        MouseArea{
                            anchors.fill: parent
                            onPressed: {
                                    GSystem.sendSeatCommand("massage_onoff");
                                /*Feedbackden geleceği için yoruma alındı
                                    if(serial_mng.massageon === 0)
                                    {
                                        serial_mng.massageon = 1;
                                        serial_mng.massagemod = 1;
                                    }else{
                                        serial_mng.massageon = 0;
                                        serial_mng.massagemod = 0;
                                    }
                                    */
                            }
                            onReleased: {   }
                        }
                    }

                }
            }

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
                to:root.cheight - 5
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
