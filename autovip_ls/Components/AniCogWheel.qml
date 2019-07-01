import QtQuick 2.0

Item {
    id:root
    property real cscale:1
    width: 200 * cscale
    height: 200 * cscale
    Image{
        source:"qrc:/design/controls/ani/circle.svg"
        sourceSize.width: 200 * root.cscale
        sourceSize.height: 200 * root.cscale
        Image{
            source:"qrc:/design/controls/ani/shadow.svg"
            sourceSize.width: 200 * root.cscale
            sourceSize.height: 200 * root.cscale
        }
        Image{
            id:cw1
            x:75 * root.cscale
            y: 32 * root.cscale
            sourceSize.width: 71 * root.cscale
            sourceSize.height: 71 * root.cscale
            source:"qrc:/design/controls/ani/cogwheelbig.svg"
        }

        Image{
            id:cw2
            x:37 * root.cscale
            y: 87 * root.cscale
            sourceSize.width:  57 * root.cscale
            sourceSize.height: 57 * root.cscale
            source:"qrc:/design/controls/ani/cogwheelmid.svg"
        }
        Image{
            id:cw3
            x: 98 * root.cscale
            y: 113 * root.cscale
            sourceSize.width:  46*root.cscale
            sourceSize.height: 46*root.cscale
            source:"qrc:/design/controls/ani/cogwheelsmall.svg"
        }
    }

            NumberAnimation {
                targets: [cw1,cw2,cw3]
                properties: "rotation"
                from:0
                to:360
                duration:5000
                running: true
                loops: Animation.Infinite
            }
}
