import QtQuick 2.0

Item {
    id:root
    property real cscale:1
    width: 300 * cscale
    height: 300 * cscale
//    Image{
//        source:"qrc:/design/controls/ani/circle.svg"
//        sourceSize.width: 200 * root.cscale
//        sourceSize.height: 200 * root.cscale
//        Image{
//            source:"qrc:/design/controls/ani/shadow.svg"
//            sourceSize.width: 200 * root.cscale
//            sourceSize.height: 200 * root.cscale
//        }
        Image{
            id:cw1
            x:100 * root.cscale
            y: 10 * root.cscale
            sourceSize.width: 140 * root.cscale
            sourceSize.height: 140 * root.cscale
            source:"qrc:/design/controls/ani/buyuk.png"
        }

        Image{
            id:cw2
            x:20 * root.cscale
            y: 100 * root.cscale
            sourceSize.width:  100 * root.cscale
            sourceSize.height: 100 * root.cscale
            source:"qrc:/design/controls/ani/orta.png"
        }
        Image{
            id:cw3
            x: 98 * root.cscale
            y: 140 * root.cscale
            sourceSize.width:  100*root.cscale
            sourceSize.height: 100*root.cscale
            source:"qrc:/design/controls/ani/kucuk.png"
        }
//    }

            NumberAnimation {
                targets: [cw1,cw2,cw3]
                properties: "rotation"
                from:0
                to:360
                duration:5000
                running: true
                loops: Animation.Infinite
            }

//    AnimatedImage{
//        source: "qrc:/design/controls/ani/gears.gif"
//        width: 400 * root.cscale
//        height: 400 * root.cscale
//        anchors.centerIn: parent
//        cache: false
//    }
}
