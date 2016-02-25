import QtQuick 2.4
Item {
    id: hidden
    height: app.height
    width: app.width
    focus: false
    property int subframe: 0
    property int subframeCount: 1
    // TODO Append state to app.states onCompleted

    property alias xScale: anchorScale.xScale
    property alias yScale: anchorScale.yScale
    property alias zScale: anchorScale.zScale
    property alias angle: anchorRotation.angle
    property alias originX: anchorRotation.origin.x
    property alias originY: anchorRotation.origin.y
    // FIXME Animation on Entered
    //    transitions: Transition {
    //        SequentialAnimation {
    //            NumberAnimation {target: anchorScale; properties: "xScale,yScale,zScale"; easing.type: Easing.InOutQuad }
    //            PauseAnimation {
    //                duration: 200
    //            }
    //            NumberAnimation {target: anchorRotation; properties: "angle"; easing.type: Easing.InOutQuad }
    //        }
    //    }
    transform: [
        Rotation {
            id: anchorRotation
        },
        Scale {
            id: anchorScale
        }
    ]
    // For interactiion
    signal enter()
    signal exit()
    MouseArea {
        anchors.fill: parent
        propagateComposedEvents:  true
        onWheel:  {
            var zoomFactor = 1.465;
            if (wheel.angleDelta.y < 0) {
                zoomFactor = 1/1.465
                if (anchorScale.xScale <= 1E-4) {
                    console.log("too small")
                    return
                }
            }
//            var realX = wheel.x - parent.x
//            var realY = wheel.y - parent.y
//            parent.x += (1 - zoomFactor) * realX
//            parent.y += (1 - zoomFactor) * realY
            anchorScale.xScale *= zoomFactor
            anchorScale.yScale *= zoomFactor
        }
    }
}
