pragma Singleton
import QtQuick 2.0
import "scripts/mainfuncs.js" as MainMdl
import "scripts/simplex-noise.js" as SimplexMdl
import "scripts/ether.js" as Ether
import QtWebSockets 1.0
import VRService 1.0
import QtQml 2.0
import closx.smanager 1.0
/* Global fonksiyonlar, değişkenler ve durumlar(states) bu sayfada bulunuyor. */


Item {
    id:root
    property string activePage: "Home"
    property string prevPage: "Not"
    property int bottomIconHight: 65 //eski deger: 85
    property int bottomIconWidth: 90 //eski deger: 110
    property string radioMode: "FM"
    property string prevRadioMode: "NONE"
    property int lang: SM.lang

    signal pageChange(string pageName)
    property Item currentPageItm
    property Item prevPageItm
    property Item logoItm
    property alias myriadpro :myriadpro
    property alias myriadproita :myriadpro
    property alias centurygothic :centurygothic
    property alias voice_service:voice_service
    property var phistory
    property int selectedSeat: -1
    property string selectedSeatText:""

    //Icon carousel menu
    property int leftMenuHeight: 480
    property int leftMenuWidth: 246
    property int leftMenuSpacing: 25
    property string leftMenuColor: "transparent"
    //End Icon Carousel Menu

    //text menu
    property int leftTextMenuHeight: 430
    property int leftTextMenuWidth: 246
    property int leftTextMenuSpacing: 20
    property string leftTextMenuColor: "transparent"
    property color leftTextMenuItemColor: Qt.rgba(0,0,0,0.1)
    property color leftTextMenuItemPressedColor: Qt.rgba(191/255, 63/255, 191/255,0.6)
    //end text menu

    property alias oneSeatModel: oneSeatModel
    property alias oneSeatRightModel: oneSeatRightModel
    property alias mediaModel: mediaModel
    property alias controlsModel: controlsModel
    property Item info;

    onLangChanged: function(){
        voice_service.setLang(root.lang);
    }

    function sendSeatCommand(key)
    {
                    switch(root.selectedSeat)
                    {
                    case 1:
                        serial_mng.sendKey("first_seat/"+key);
                        break;
                    case 2:
                        serial_mng.sendKey("second_seat/"+key);
                        break;
                    case 3:
                        serial_mng.sendKey("third_seat/"+key);
                        break;
                    case 4:
                        serial_mng.sendKey("fourth_seat/"+key);
                        break;
                    default:
                        return false;
                    }
                    return true;
    }

    function seatPagePass()
    {
                    switch(root.selectedSeat)
                    {
                    case 1:
                        serial_mng.sendKey("first_seat/pagepass")
                        break;
                    case 2:
                        serial_mng.sendKey("second_seat/pagepass")
                        break;
                    case 3:
                        serial_mng.sendKey("third_seat/pagepass")
                        break;
                    case 4:
                        serial_mng.sendKey("fourth_seat/pagepass")
                        break;
                    }

    }

    function setInfo(p_info)
    {
        info = p_info;
    }

    function selectedSeatToText()
    {
        switch(root.selectedSeat)
        {
        case 1:
            return qsTr("FIRST");
        case 2:
            return qsTr("SECOND");
        case 3:
            return qsTr("THIRD");
        case 4:
            return qsTr("FOURTH");
        case 5:
            return qsTr("Unknown");
        }
    }

    SettingsManager{
        id:smngr
    }


    function systemOnOff()
    {
        if(SM.demomode)
        {
        serial_mng.sendKey("main/setclock",false,root.delay,(Qt.formatDateTime(new Date(), "h")*1 + smngr.value("main/hourdiff")*1)+ ":" + (Qt.formatDateTime(new Date(), "m")*1 + smngr.value("main/mindiff")*1));
            switch(serial_mng.systemstate)
            {
                case -1:
                    serial_mng.systemstate = 1;
                break;
                case 0:
                    serial_mng.systemstate = 1;
                    break;
                case 1:
                    serial_mng.systemstate = 0;
                    break;
                default:
            }
            return;

        }else{
            serial_mng.sendKey("main/setclock",false,root.delay,(Qt.formatDateTime(new Date(), "h")*1 + smngr.value("main/hourdiff")*1)+ ":" + (Qt.formatDateTime(new Date(), "m")*1 + smngr.value("main/mindiff")*1));
                        serial_mng.sendKey("main/system_onoff");
                        serial_mng.sendKey("main/system_feedback");
        }


    }

    function systemFeedback()
    {
        if(SM.demomode)
        {
            switch(serial_mng.system_state)
            {
                case -1:
                    serial_mng.system_state = 1;
                break;
                case 0:
                    serial_mng.system_state = 1;
                    break;
                case 1:
                    serial_mng.system_state = 0;
                    break;
                default:
            }
            return;
        }

    }

    property bool aniInited : false;
   FontLoader {
        id: myriadpro
        source: "qrc:/design/fonts/myriad-pro/MYRIADPRO-REGULAR.OTF"
    }
   FontLoader {
        id: myriadproita
        source: "qrc:/design/fonts/myriad-pro/MYRIADPRO-CONDIT.OTF"
    }
   FontLoader {
        id: centurygothic
        source: "qrc:/design/fonts/century-gothic/CenturyGothic.ttf"
    }
    onSelectedSeatChanged: {
        oneSeatModel.clear();
        oneSeatRightModel.clear();
        oneSeatModel.append({name:qsTr("Head"),st:"SeatHead",isvis:true});
        oneSeatModel.append({name:qsTr("SeatBack"),st:"SeatBack",isvis:true});
        oneSeatModel.append({name:qsTr("Seat"),st:"SeatPart",isvis:true});
        if(SM.seatDrawer(selectedSeat) === true)
        {
            oneSeatModel.append({name:qsTr("Drawer"),st:"SeatDrawer",isvis:true});
        }
        if(SM.seatFootrest(selectedSeat) === true)
        {
            oneSeatModel.append({name:qsTr("Foot Rest"),st:"SeatFeet",isvis:true});
        }
        if(SM.seatThigh(selectedSeat) === true)
        {
            oneSeatModel.append({name:qsTr("Thigh"),st:"SeatThigh",isvis:true});
        }
        if( SM.seatHeating(selectedSeat) === true)
        {
            oneSeatRightModel.append({name:qsTr("Seat Heating"),st:"SeatHeating"});
        }
        if( SM.seatCooling(selectedSeat) === true)
        {
            oneSeatRightModel.append({name:qsTr("Seat Cooling"),st:"SeatCooling"});
        }
        if( SM.seatMassage(selectedSeat) === true)
        {
            oneSeatRightModel.append({name:qsTr("Seat Massage"),st:"SeatMassage"});
        }
    }
    function createMediaModel()
    {
        mediaModel.clear();
        if(SM.mediaplayertype === 1)
        {
        mediaModel.append(
                    {
            name: qsTr("Kodi Player"),
            st: "KodiMediaPlayer",
            bg: "qrc:/design/media/leftmenu/kodiplayer.png"
                    }
                    );
        }
        if(SM.mediaplayertype === 2)
        {
        mediaModel.append(
                    {
                    name: qsTr("Apple Tv"),
                    st: "AppleTv",
                    bg: "qrc:/design/media/leftmenu/appletv.png"
                    }
                    );
        }
        if(SM.playstation === true)
        {
        mediaModel.append(
                    {

                    name: qsTr("Playstation"),
                    st: "PlayStation",
                    bg: "qrc:/design/media/leftmenu/playstation.png"

                    }
                    );
        }
        if(SM.dockingstation === true)
        {
        mediaModel.append(
                   {
                    name: qsTr("Docking Stations"),
                    st: "DockingStation",
                    bg: "qrc:/design/media/leftmenu/dockingstation.png"
                    }
                    );
        }
        mediaModel.append(
                   {
                        name: qsTr("Screen Divider"),
                        st: "ScreenDivider",
                        bg: "qrc:/design/media/leftmenu/screendivider.png"
                    }
                    );
        mediaModel.append(
                   {
                    name: qsTr("Television"),
                    st: "Television",
                    bg: "qrc:/design/media/leftmenu/tv.png"
                    }
                    );
        if(SM.radio === true)
        {
        mediaModel.append(
                   {
                    name: qsTr("Radio"),
                    st: "Radio",
                    bg: "qrc:/design/media/leftmenu/radio.png"
                    }
                    );
        }
        mediaModel.append(
                   {
                    name: qsTr("Pc Hdmi"),
                    st: "PcHdmi",
                    bg: "qrc:/design/media/leftmenu/hdmipc.png"
                    }
                    );
        if(SM.ceilingscreen)
        {
            mediaModel.append(
                   {
                    name: qsTr("Ceiling Screen"),
                    st: "CeilingScreen",
                    bg: "qrc:/design/media/leftmenu/ceiling_screen.png"
                    }
                    );

        }
        if(SM.dvdplayer)
        {
            mediaModel.append(
                   {
                    name: qsTr("DVD Player"),
                    st: "DVDPlayer",
                    bg: "qrc:/design/media/leftmenu/dvdplayer.png"
                    }
                    );

        }
    }
    function createControlsModel()
    {
        controlsModel.clear();
        controlsModel.append(
                    {
                     name:qsTr("Tables"),
                     st:"Tables",
                     bg: "qrc:/design/controls/leftmenu/tables.png"
                    }
                 );
    if(SM.curtains)
    {
        controlsModel.append(
    {
        name: qsTr("Curtains"),
        st: "Curtains",
        bg: "qrc:/design/controls/leftmenu/curtains.png"
    }
                    );
    }
     if(SM.refrigerator)
     {
        controlsModel.append(
        {
        name: qsTr("Refrigerator"),
        st: "Refrigerator",
        bg: "qrc:/design/controls/leftmenu/refrigerator.png"
        }
                    );
     }
     if(SM.safebox)
     {
        controlsModel.append(
        {
        name: qsTr("Safe Box"),
        st: "SafeBox",
        bg: "qrc:/design/controls/leftmenu/safebox.png"
        }
                    );

     }

        controlsModel.append(
    {
        name: qsTr("Air Condition"),
        st: "AirConditioner",
        bg: "qrc:/design/controls/leftmenu/airconditioner.png"
    }
                    );
        controlsModel.append(
    {
        name: qsTr("Smoke Fan"),
        st: "SmokeFan",
        bg: "qrc:/design/controls/leftmenu/smokefan.png"
    }
                    );

        controlsModel.append(
    {
        name: qsTr("Windows"),
        st: "Windows",
        bg: "qrc:/design/controls/leftmenu/windows.png"
    }
    );
     if(SM.bar)
     {
        controlsModel.append(
                    {
        name: qsTr("Bar"),
        st: "Bar",
        bg: "qrc:/design/controls/leftmenu/bar.png"
                    }
                    );
     }
    if(SM.espresso)
    {
        controlsModel.append(
                    {
                    name: qsTr("Espresso"),
                    st: "Espresso",
                    bg: "qrc:/design/controls/leftmenu/espresso.png"
                    }
                    );
    }
     if(SM.smokefan)
        controlsModel.append(
                   {
        name: qsTr("Roof"),
        st: "Roof",
        bg: "qrc:/design/controls/leftmenu/roof.png"
                    }
                    );

    }
    function seat2com(seatno)
    {
        switch(seatno)
        {
            case 1:
            return 10;
            case 2:
            return 9;
            case 3:
            return 15;
            case 4:
            return 14;
        }
        return -1;
    }
    function com2seat(com)
    {
        switch(com)
        {
            case 10:
            return 1;
            case 9:
            return 2;
            case 15:
            return 3;
            case 14:
            return 4;
        }
        return -1;
    }

    function initAnim(a,b)
    {
        Ether.setup(a,b);
        aniInited = true;
    }
    function isContextReady(a,b)
    {
        var acon = a.getContext("2d");
        var bcon = b.getContext("2d");
        if(acon && bcon)
        {
            return true;
        }
        return false;
    }
    function drawAnim()
    {
        Ether.draw();
    }
    function randRect(item)
    {
            var ctx = item.getContext("2d");
            ctx.fillStyle = Qt.rgba(1, 0, 0, 1);
            ctx.clearRect(0,0,item.width,item.height);
            ctx.fillRect( (Math.random() * 1000) % item.width, (Math.random() * 1000) % item.height, 100, 100);
            item.requestAnimationFrame(item.requestPaint);
    }

    function changePage(pageName,saveHistory)
    {
        if(pageSwipe.running)
        {
            return;
        }
        if(typeof saveHistory === "undefined") saveHistory = true;
            console.log("SGlobal.changePage("+pageName+")");

        if(root.activePage !== pageName)
        {
            root.prevPage = root.activePage
            if(saveHistory)
            {
                phistory.push(root.prevPage);
                if(phistory.length > 10)
                {
                phistory.shift();
                }
            }
            root.activePage = pageName;
            root.currentPageItm = getPageItem(pageName);
            root.prevPageItm = getPageItem(root.prevPage);
            pageSwipe.start();
            if(root.currentPageItm.init)
            {
                root.currentPageItm.init();
            }
            if(root.prevPageItm.end)
            {
                root.prevPageItm.end();
            }
            //root.pageChange(pageName);
        }

    }

    function goBack()
    {
        if(phistory.length > 0)
        {
            var page = phistory.pop();
            changePage(page,false);
        }else{
           changePage("Home");
        }
    }

    function getPageItem(pageName)
    {
        var pageItem = MainMdl.getPage(pageName);
        if(typeof pageItem !== "undefined") return pageItem;
    }

    function addPageItem(pageName,item)
    {
        MainMdl.addPage(pageName,item);
    }
    property var pageAry

    state: "Home"

    states: [
                "Home"
            ,
                "Seats"
            ,
                "Controls"
            ,
                "Media"
            ,
                "Lights"
            ,
                "Radio"
            ,
                "RadioManual"
            ,
                "Tables"
            ,
                "RightTable"
            ,
                "LeftTable"
            ,
                "Refrigerator"
            ,
                "SafeBox"
            ,
                "AirConditioner"
            ,
                "SmokeFan"
            ,
                "Curtains"
            ,
                "LeftCurtain"
            ,
                "RightCurtain"
            ,
                "LeftCurtain2"
            ,
                "RightCurtain2"
            ,
                "LuggageCurtain"
            ,
                "OneSeat"
            ,
                "SeatHead"
            ,
                "SeatBack"
            ,
                "SeatPart"
            ,
                "SeatFeet"
            ,
                "SeatDrawer"
            ,
                "SeatThigh"
            ,
                "SeatCooling"
            ,
                "SeatHeating"
            ,
                "SeatMassage"
            ,
                "Espresso"
            ,
                "Bar"
            ,
                "Roof"
            ,
                "Cameras"
            ,
                "FrontCamera"
            ,
                "RearCamera"
            ,
                "DockingStation"
            ,
                "ScreenDivider"
            ,
                "KodiMediaPlayer"
            ,
                "PlayStation"
            ,
                "Television"
            ,
                "PcHdmi"
            ,
                "Windows"
            ,
                "LeftWindow"
            ,
                "RightWindow"
            ,
                "Settings"
            ,
                "GeneralSettings"
            ,
                "Calibration"
            ,
                "BarMotorCalibration"
            ,
                "DrawerMotor1"
            ,
                "DrawerMotor2"
            ,
                "EspressoMotor1"
            ,
                "EspressoMotor2"
            ,
                "FootrestMotor1"
            ,
                "FootrestMotor2"
            ,
                "TvMotorCalibration"
            ,
                "MediaSettings"
            ,
                "SerialSettings"
            ,
                "AppleTv"
            ,
                "CeilingScreen"
            ,
                "DVDPlayer"

            ]
    ListModel {
                id: oneSeatModel

                ListElement {
                   name: qsTr("Head")
                   st: "SeatHead"
                   isvis: true
                }
                ListElement {
                   name: qsTr("Back")
                   isvis: true
                   st: "SeatBack"
                }
                ListElement {
                   name: qsTr("Seat")
                   isvis: true
                   st: "SeatPart"
                }
                ListElement {
                   name: qsTr("Foot Rest")
                   isvis: false
                   st: "SeatFeet"
                }
                ListElement {
                   name: qsTr("Drawer")
                   isvis: false
                   st: "SeatDrawer"
                }
            }
    ListModel {
                id: oneSeatRightModel
            }

ListModel {
    id: controlsModel
    ListElement {
       name: QT_TR_NOOP("Tables")
       st: "Tables"
       bg: "qrc:/design/controls/leftmenu/tables.png"
    }
    ListElement {
        name: QT_TR_NOOP("Curtains")
        st: "Curtains"
        bg: "qrc:/design/controls/leftmenu/curtains.png"
    }
    ListElement {
        name: QT_TR_NOOP("Refrigerator")
        st: "Refrigerator"
        bg: "qrc:/design/controls/leftmenu/refrigerator.png"
    }
    ListElement {
        name: QT_TR_NOOP("Safe Box")
        st: "SafeBox"
        bg: "qrc:/design/controls/leftmenu/safebox.png"
    }
    ListElement {
        name: QT_TR_NOOP("Air Condition")
        st: "AirConditioner"
        bg: "qrc:/design/controls/leftmenu/airconditioner.png"
    }
    ListElement {
        name: QT_TR_NOOP("Smoke Fan")
        st: "SmokeFan"
        bg: "qrc:/design/controls/leftmenu/smokefan.png"
    }
    ListElement {
        name: QT_TR_NOOP("Windows")
        st: "Windows"
        bg: "qrc:/design/controls/leftmenu/windows.png"
    }
    ListElement {
        name: QT_TR_NOOP("Bar")
        st: "Bar"
        bg: "qrc:/design/controls/leftmenu/bar.png"
    }
    ListElement {
        name: QT_TR_NOOP("Espresso")
        st: "Espresso"
        bg: "qrc:/design/controls/leftmenu/espresso.png"
    }
    ListElement {
        name: QT_TR_NOOP("Roof")
        st: "Roof"
        bg: "qrc:/design/controls/leftmenu/roof.png"
    }
}
    ListView {
        model: controlsModel
        delegate: Text {
            text: qsTr(model.name) + mytrans.emptyString
        }
    }

ListModel {
    id: mediaModel
    ListElement {
       name: qsTr("Kodi Player")
        st: "KodiMediaPlayer"
       bg: "qrc:/design/media/leftmenu/kodiplayer.png"
    }
    ListElement {
        name: qsTr("Playstation")
        st: "PlayStation"
        bg: "qrc:/design/media/leftmenu/playstation.png"
    }
    ListElement {
        name: qsTr("Docking Stations")
        st: "DockingStation"
        bg: "qrc:/design/media/leftmenu/dockingstation.png"
    }
    ListElement {
        name: qsTr("Screen Divider")
        st: "ScreenDivider"
        bg: "qrc:/design/media/leftmenu/screendivider.png"
    }
    ListElement {
        name: qsTr("Television")
        st: "Television"
        bg: "qrc:/design/media/leftmenu/tv.png"
    }
    ListElement {
        name: qsTr("Radio")
        st: "Radio"
        bg: "qrc:/design/media/leftmenu/radio.png"
    }
    ListElement {
        name: qsTr("Pc Hdmi")
        st: "PcHdmi"
        bg: "qrc:/design/media/leftmenu/hdmipc.png"
    }
}
    SequentialAnimation{
        id:pageSwipe
        running: false
        NumberAnimation {
            target: logoItm
            property: "y"
            to:(typeof logoItm != "undefined" && logoItm)?(-logoItm.height):0
            duration: 200
            easing.type: Easing.InOutQuad
        }
        ParallelAnimation{
            NumberAnimation {
                target: currentPageItm
                property: "x"
                from:1024
                to:0
                duration: 200
                easing.type: Easing.InOutQuad
            }

            NumberAnimation {
                target: prevPageItm
                property: "x"
                from:0
                to:-1024
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }
        NumberAnimation {
            target: logoItm
            property: "y"
            from:(logoItm)?(-logoItm.height):0
            to:20
            duration: 200
            easing.type: Easing.InOutQuad
        }
    }
    VRService{
        id : voice_service
        onVoiceCode: function(code)
        {
            console.log("voice message :"+code);
            serial_mng.sendVoiceCommandById(code);
        }
        onNotdetected: function(message)
        {
            console.log("voice message :"+message);
        }
    }

    function white_lights()
    {
        var pageItem = MainMdl.getPage("Lights");
        pageItem.turn_on_lights_white();
    }
    function red_lights()
    {
        var pageItem = MainMdl.getPage("Lights");
        pageItem.turn_on_lights_red();
    }
    function green_lights()
    {
        var pageItem = MainMdl.getPage("Lights");
        pageItem.turn_on_lights_green();
    }
    function blue_lights()
    {
        var pageItem = MainMdl.getPage("Lights");
        pageItem.turn_on_lights_blue();
    }

    function turnoff_lights()
    {
        var pageItem = MainMdl.getPage("Lights");
        pageItem.turn_off_lights();
    }

    function cl_white_lights()
    {
        var pageItem = MainMdl.getPage("Lights");
        pageItem.cl_white_lights();
    }
    function cl_red_lights()
    {
        var pageItem = MainMdl.getPage("Lights");
        pageItem.cl_red_lights();
    }
    function cl_green_lights()
    {
        var pageItem = MainMdl.getPage("Lights");
        pageItem.cl_green_lights();
    }
    function cl_blue_lights()
    {
        var pageItem = MainMdl.getPage("Lights");
        pageItem.cl_blue_lights();
    }
    function cl_turnoff_lights()
    {
        var pageItem = MainMdl.getPage("Lights");
        pageItem.cl_turnoff_lights();
    }

    function il_white_lights()
    {
        var pageItem = MainMdl.getPage("Lights");
        pageItem.il_white_lights();
    }
    function il_red_lights()
    {
        var pageItem = MainMdl.getPage("Lights");
        pageItem.il_red_lights();
    }
    function il_green_lights()
    {
        var pageItem = MainMdl.getPage("Lights");
        pageItem.il_green_lights();
    }
    function il_blue_lights()
    {
        var pageItem = MainMdl.getPage("Lights");
        pageItem.il_blue_lights();
    }
    function il_turnoff_lights()
    {
        var pageItem = MainMdl.getPage("Lights");
        pageItem.il_turnoff_lights();
    }


    function side_white_lights()
    {
        var pageItem = MainMdl.getPage("Lights");
        pageItem.side_white_lights();
    }
    function side_red_lights()
    {
        var pageItem = MainMdl.getPage("Lights");
        pageItem.side_red_lights();
    }
    function side_green_lights()
    {
        var pageItem = MainMdl.getPage("Lights");
        pageItem.side_green_lights();
    }
    function side_blue_lights()
    {
        var pageItem = MainMdl.getPage("Lights");
        pageItem.side_blue_lights();
    }
    function side_turnoff_lights()
    {
        var pageItem = MainMdl.getPage("Lights");
        pageItem.side_turnoff_lights();
    }
    Timer {
        id:ccheck
        interval: 3000;
        running: true;
        repeat: true
        onTriggered: function(){
            if(serial_mng.systemstate != 1)
            {
                serial_mng.sendKey("main/system_request");
                serial_mng.sendKey("main/setclock",false,root.delay,(Qt.formatDateTime(new Date(), "h")*1 + smngr.value("main/hourdiff")*1)+ ":" + (Qt.formatDateTime(new Date(), "m")*1 + smngr.value("main/mindiff")*1));

            }

        }
    }
        Connections{
            target:serial_mng
            onRunFunction:function(fname){
                if(typeof root[fname] == "function")
                {
                    root[fname]();
                }
            }
            onConnectionChanged:function(st)
            {
            }
            onSystemstateChanged:function(st)
            {
                if(st!=1)
                {
                    ccheck.running=true;
                }else{
                    ccheck.running=false;
                }
            }

        }

}
