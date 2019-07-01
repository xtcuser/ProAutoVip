import QtQuick 2.0
        Item{
            id:root
            property real cscale: 0.4
            width : 512 * cscale
            height: 512 * cscale
            Image{
            anchors.centerIn: parent
            source:"qrc:/design/media/ani/circle.svg"
            smooth: true
            antialiasing: true
            sourceSize.width : 512.228 * root.cscale
            sourceSize.height : 512.228 * root.cscale
            width: sourceSize.width
            height: sourceSize.height
            Image{
                x:80.92 * root.cscale
                y:90.92 * root.cscale
                source:"qrc:/design/media/ani/shadow.svg"
                sourceSize.width : 429 * root.cscale
                sourceSize.height : 418 * root.cscale
            }
            Image{
                id:cw1
                y:90.92 * root.cscale
                x:82.132 * root.cscale
                sourceSize.width : 154 * root.cscale
                sourceSize.height : 154 * root.cscale
                source:"qrc:/design/media/ani/cogwhell.svg"
                smooth: true
            }
            Image{
                id:cw2
                x:251.15 * root.cscale
                y:90.92 * root.cscale
                sourceSize.width : 154 * root.cscale
                sourceSize.height : 154 * root.cscale
                smooth: true
                source:"qrc:/design/media/ani/cogwhell.svg"
            }
            Image{
                x:113.298 * root.cscale
                y:192.14 * root.cscale
                sourceSize.width : 295 * root.cscale
                sourceSize.height : 208 * root.cscale
                source:"qrc:/design/media/ani/camera.svg"
            }

            NumberAnimation {
                targets: [cw1,cw2]
                properties: "rotation"
                from:0
                to:360
                duration:5000
                running: true
                loops: Animation.Infinite
            }
            }
        }
