import QtQuick 2.0
import QtQuick.Layouts 1.3
import "../../Components"
import ColorComponents 1.0
import QtGraphicalEffects 1.0
import ck.gmachine 1.0

BasePage {
    id: root
    caption:qsTr("Lights") + mytrans.emptyString
    property color previousColor: "transparent"
    property color ceilColor: serial_mng.ceilingcolor
    property color sideColor: serial_mng.sidecolor
    property color inSideColor: serial_mng.insidecolor
    property ColorComponents targetColorItem: ceilColorComponent
    property int delay: -1
    property int selected: -1
    Connections{
        target:serial_mng
        onCeilingcolorChanged:function(val)
        {
            root.ceilColor = val;
        }
        onSidecolorChanged:function(val)
        {
            root.sideColor = val;
        }
        onInsidecolorChanged:function(val)
        {
            root.inSideColor = val;
        }
    }
    function init()
    {
        serial_mng.sendKey("lights/ceiling_request",true,delay);
        serial_mng.sendKey("lights/inside_request",true,delay);
        serial_mng.sendKey("lights/side_request");
    }
    function closeAll()
    {
        /*
                serial_mng.sendKey("lights/ceiling_red",false,root.delay,"0");
                serial_mng.sendKey("lights/ceiling_green",false,root.delay,"0");
                serial_mng.sendKey("lights/ceiling_blue",false,root.delay,"0");
                */

                //serial_mng.ceilingcolor = "#000000";
                //ceilColorComponent.color = "#000000";
                ceilColorComponent.red = 0;
                ceilColorComponent.green = 0;
                ceilColorComponent.blue = 0;
        /*
                serial_mng.sendKey("lights/side_red",false,root.delay,"0");
                serial_mng.sendKey("lights/side_green",false,root.delay,"0");
                serial_mng.sendKey("lights/side_blue",false,root.delay,"0");
                */

                //serial_mng.sidecolor = "#000000";
                sideColorComponent.color = "#000000";

        /*
                serial_mng.sendKey("lights/inside_red",false,root.delay,"0");
                serial_mng.sendKey("lights/inside_green",false,root.delay,"0");
                serial_mng.sendKey("lights/inside_blue",false,root.delay,"0");
                */
                insideColorComponent.color = "#000000";
                //serial_mng.insidecolor = "#000000";
    }
    function turn_off_lights()
    {
        root.closeAll();
    }
    function turn_on_lights_white()
    {
                sideColorComponent.color = "#FFFFFF";
                insideColorComponent.color = "#FFFFFF";
                ceilColorComponent.color = "#FFFFFF";

    }
    function turn_on_lights_red()
    {
                sideColorComponent.color = "#FF0000";
                insideColorComponent.color = "#FF0000";
                ceilColorComponent.color = "#FF0000";

    }
    function turn_on_lights_green()
    {
                sideColorComponent.color = "#00FF00";
                insideColorComponent.color = "#00FF00";
                ceilColorComponent.color = "#00FF00";

    }
    function turn_on_lights_blue()
    {
                sideColorComponent.color = "#0000FF";
                insideColorComponent.color = "#0000FF";
                ceilColorComponent.color = "#0000FF";

    }

    function cl_white_lights()
    {
        ceilColorComponent.color = "#FFFFFF";
    }

    function cl_red_lights()
    {
        ceilColorComponent.color = "#FF0000";
    }

    function cl_green_lights()
    {
        ceilColorComponent.color = "#00FF00";
    }

    function cl_blue_lights()
    {
        ceilColorComponent.color = "#0000FF";
    }

    function cl_turnoff_lights()
    {
        ceilColorComponent.color = "#000000";
    }

    function il_white_lights()
    {
        insideColorComponent.color = "#FFFFFF";
    }

    function il_red_lights()
    {
        insideColorComponent.color = "#FF0000";
    }

    function il_green_lights()
    {
        insideColorComponent.color = "#00FF00";
    }

    function il_blue_lights()
    {
        insideColorComponent.color = "#0000FF";
    }

    function il_turnoff_lights()
    {
        insideColorComponent.color = "#000000";
    }


    function side_white_lights()
    {
        sideColorComponent.color = "#FFFFFF";
    }

    function side_red_lights()
    {
        sideColorComponent.color = "#FF0000";
    }

    function side_green_lights()
    {
        sideColorComponent.color = "#00FF00";
    }

    function side_blue_lights()
    {
        sideColorComponent.color = "#0000FF";
    }

    function side_turnoff_lights()
    {
        sideColorComponent.color = "#000000";
    }


    function showInfo()
    {
            GSystem.info.src = "qrc:/design/general/saved.svg"
            GSystem.info.message = "";
            GSystem.info.start();
    }
    function hexToRgb(hex) {
            var shorthandRegex = /^#?([a-f\d])([a-f\d])([a-f\d])$/i;
            hex = "" + hex;
            hex = hex.replace(shorthandRegex, function(m, r, g, b) {
            return r + r + g + g + b + b;
            });

            var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
            return result ? {
            r: parseInt(result[1], 16),
            g: parseInt(result[2], 16),
            b: parseInt(result[3], 16)
            } : null;
    }
    function sendCeilColor(p_color)
    {
        console.log("inside color changed : "+p_color);
        var parts = root.hexToRgb(p_color);
        serial_mng.sendKey("lights/ceiling_red",false,root.delay,parts.r);
        serial_mng.sendKey("lights/ceiling_green",false,root.delay,parts.g);
        serial_mng.sendKey("lights/ceiling_blue",false,root.delay,parts.b);
    }
    function sendSideColor(p_color)
    {
        console.log("inside color changed : "+p_color);
        var parts = root.hexToRgb(p_color);
        serial_mng.sendKey("lights/side_red",false,root.delay,parts.r);
        serial_mng.sendKey("lights/side_green",false,root.delay,parts.g);
        serial_mng.sendKey("lights/side_blue",false,root.delay,parts.b);
    }
    function sendInsideColor(p_color)
    {
        console.log("inside color changed : "+p_color);
        var parts = root.hexToRgb(p_color);
        serial_mng.sendKey("lights/inside_red",false,root.delay,parts.r);
        serial_mng.sendKey("lights/inside_green",false,root.delay,parts.g);
        serial_mng.sendKey("lights/inside_blue",false,root.delay,parts.b);
    }
    onCeilColorChanged: function(){
    }
    onSideColorChanged: function(){
    }
    onInSideColorChanged: function(){
    }
    function changeTarget(id)
    {
                       switch(id)
                       {
                       case 1:
                            root.targetColorItem = ceilColorComponent;
                           break;
                       case 2:
                            root.targetColorItem = sideColorComponent
                           break;
                       case 3:
                            root.targetColorItem = insideColorComponent
                           break;
                       }
                var msg = {'ind': id-1, 'model': leftMenu.model};
                worker.sendMessage(msg);
    }

        LeftTextMenu{
            id:leftMenu
            model:lightsModel
            //delegate: menuDelegate
            selection: true
            onClicked: function(ind)
            {
                changeTarget(ind+1);
            }
            WorkerScript {
            id: worker
            source: "qrc:/scripts/modelworker.js"
            }
            ListModel{
                id: lightsModel
                ListElement{
                    name:QT_TR_NOOP("Ceiling Light")
                    target:1
                    selected:false
                }
                ListElement{
                    name:QT_TR_NOOP("Side Light")
                    target:2
                    selected:false
                }
                ListElement{
                    name:QT_TR_NOOP("Inside Light")
                    target:3
                    selected:false
                }
            }
//            Repeater {
//                            model:lightsModel
//                            Text {
//                                text: name
//                            }
//                        }


        }
    Rectangle{
        x:0
        y:0
        color: "transparent"
        width: parent.width
        height: parent.height



    ColorComponents {
        id: ceilColorComponent
        saturation: 1.0
        value: 1.0
        color:"white"
        onColorChanged: {
                  var color = ceilColorComponent.toRGBString();
                  root.sendCeilColor(color);
                  if(!Qt.colorEqual(color,serial_mng.ceilingcolor))
                    {
                        serial_mng.ceilingcolor = color;
                    }
        }
    }


    ColorComponents {
        id: sideColorComponent
        saturation: 1.0
        value: 1.0
        color:"white"
        onColorChanged: {
                  var color = sideColorComponent.toRGBString();
                  root.sendSideColor(color);
                  if(!Qt.colorEqual(color,serial_mng.sidecolor))
                    {
                            serial_mng.sidecolor = color;
                    }
        }
    }

    ColorComponents {
        id:insideColorComponent
        saturation: 1.0
        value: 1.0
        color:"white"
        onColorChanged: {
                  var color = insideColorComponent.toRGBString();
                  root.sendInsideColor(color)
                  if(!Qt.colorEqual(color,serial_mng.insidecolor))
                    {
                            serial_mng.insidecolor = color;
                    }
        }
    }


    ColorSlider{
        id: hSlider
        x:274
        y:273
        height:265
        width:60
        color:"black"
        value: 1.0 - targetColorItem.hue
        gradient: Gradient {
            GradientStop { position: 0/6; color: "red" }
            GradientStop { position: 1/6; color: "magenta" }
            GradientStop { position: 2/6; color: "blue" }
            GradientStop { position: 3/6; color: "cyan" }
            GradientStop { position: 4/6; color: "lime" }
            GradientStop { position: 5/6; color: "yellow" }
            GradientStop { position: 6/6; color: "red" }
        }

        onMouseYChanged: { targetColorItem.hue = Math.max(0.0, Math.min(1.0 - mouseY / height, 1.0)); targetColorItem.value = 1; }
    }
    Item{
        id:cmodel
        x:366
        y:263
        width:620
        height:293
        clip: true
        Rectangle{
            id:ceil
            x:2.5
            y:30
            width:parent.width - 5
            height:parent.height - 60
            color: ceilColor
            antialiasing: true

        }
        Image{
            anchors.fill: parent
            source:"qrc:/design/lights/icon-tavan.png"
            antialiasing: true
        }

        Rectangle{
            id:lb
            x:123
            y:197
            width:40
            height:10
            rotation: 36
            color:inSideColor
            antialiasing: true
            }
        Rectangle{
            id:rb
            x:454
            y:197
            width:40
            height:10
            rotation: -36
            color:inSideColor
            antialiasing: true
            }
        Rectangle{
            id:lf
            x:-9
            y:100
            width:50
            height:16
            rotation: 36
            color:inSideColor
            antialiasing: true
            }
        Rectangle{
            id:rf
            x:580
            y:97
            width:50
            height:16
            rotation: -36
            color:inSideColor
            antialiasing: true
            }
         Rectangle{
             id:c1
             x:161
             y:271
             width:10
             height:10
             radius: width/2
             color:sideColor
            antialiasing: true
         }
         Rectangle{
             id:c2
             x:448
             y:271
             width:10
             height:10
             radius: width/2
             color:sideColor
            antialiasing: true
         }
         Glow{
             source:c1
             anchors.fill: c1
             color:sideColor
             radius: 5
         }
         Glow{
             source:c2
             anchors.fill: c2
             color:sideColor
             radius: 5
         }
        }
    }

    ColorSlider{
        id: sSlider
        x:284
        y:hSlider.y + hSlider.height + 10
        height:30
        width:cmodel.width + hSlider.width + 18
        color:"black"
        orientation: Qt.Horizontal
        value: 1.0 - targetColorItem.saturation
        gradient: Gradient {
                GradientStop { position: 0.0; color: Qt.hsla(targetColorItem.hue, 1.0, 0.5, 1.0) }
                GradientStop { position: 1.0; color: "white"}
        }

        onMouseXChanged: targetColorItem.saturation = Math.max(0.0, Math.min(1.0 - mouseX / width, 1.0));
    }
    RowLayout{
       spacing: 10
       anchors.top:sSlider.bottom
       x:284
       LightButton{
           Layout.preferredHeight: 30
           Layout.preferredWidth: 150
           text:qsTr("Close All") + mytrans.emptyString
           onClicked: {
               root.closeAll();
           }
       }
       LightButton{
           Layout.preferredHeight: 30
           Layout.preferredWidth: 150
           text:qsTr("Memory 1") + mytrans.emptyString
           onClicked: {
               var ceilColor = SM.getLightMemory(1,1);
               var sideColor = SM.getLightMemory(1,2);
               var inSideColor = SM.getLightMemory(1,3);
               if(!Qt.colorEqual(root.ceilColor,ceilColor)) { root.ceilColor = ceilColor; }else{ sendCeilColor(ceilColor);}
               if(!Qt.colorEqual(root.inSideColor,inSideColor)) {root.inSideColor = inSideColor;}else{sendInsideColor(inSideColor);}
               if(!Qt.colorEqual(root.sideColor,sideColor)){ root.sideColor = sideColor;}else{ sendSideColor(sideColor);}
           }
           onHolded: {
               SM.saveLightMemory(1,1,root.ceilColor);
               SM.saveLightMemory(1,2,root.sideColor);
               SM.saveLightMemory(1,3,root.inSideColor);
               root.showInfo();
           }
       }
       LightButton{
           Layout.preferredHeight: 30
           Layout.preferredWidth: 150
           text:qsTr("Memory 2") + mytrans.emptyString
           onClicked: {
               var ceilColor = SM.getLightMemory(2,1);
               var sideColor = SM.getLightMemory(2,2);
               var inSideColor = SM.getLightMemory(2,3);
               if(!Qt.colorEqual(root.ceilColor,ceilColor)) { root.ceilColor = ceilColor; }else{ sendCeilColor(ceilColor);}
               if(!Qt.colorEqual(root.inSideColor,inSideColor)) {root.inSideColor = inSideColor;}else{sendInsideColor(inSideColor);}
               if(!Qt.colorEqual(root.sideColor,sideColor)){ root.sideColor = sideColor;}else{ sendSideColor(sideColor);}
           }
           onHolded: {
               SM.saveLightMemory(2,1,root.ceilColor);
               SM.saveLightMemory(2,2,root.sideColor);
               SM.saveLightMemory(2,3,root.inSideColor);
               root.showInfo();
           }
       }
       LightButton{
           Layout.preferredHeight: 30
           Layout.preferredWidth: 150
           text:qsTr("Memory 3") + mytrans.emptyString
           onClicked: {
                var ceilColor = SM.getLightMemory(3,1);
                var sideColor = SM.getLightMemory(3,2);
                var inSideColor = SM.getLightMemory(3,3);
               if(!Qt.colorEqual(root.ceilColor,ceilColor)) { root.ceilColor = ceilColor; }else{ sendCeilColor(ceilColor);}
               if(!Qt.colorEqual(root.inSideColor,inSideColor)) {root.inSideColor = inSideColor;}else{sendInsideColor(inSideColor);}
               if(!Qt.colorEqual(root.sideColor,sideColor)){ root.sideColor = sideColor;}else{ sendSideColor(sideColor);}
           }
           onHolded: {
               SM.saveLightMemory(3,1,root.ceilColor);
               SM.saveLightMemory(3,2,root.sideColor);
               SM.saveLightMemory(3,3,root.inSideColor);
               root.showInfo();
           }
       }

    }
    Component.onCompleted: {
        root.delay = serial_mng.getLightsDelay();
        changeTarget(1);
    }
}
