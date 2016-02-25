import QtQuick 2.4

Item {
    width: app.width
    height: app.height
    focus: true
    property var theFrame: null
    property bool toChange: false
    property int indexOfFrame: 0
    // TODO propagate keys to children
    Keys.onEscapePressed: {
        toChange = false
        // indexOfFrame = 0
        state = "One"
    }
    Keys.onRightPressed: {
        toChange = false
        if (app.allFrameObjects.length == 0) {
            return
        }
        indexOfFrame ++
        indexOfFrame %= app.allFrameObjects.length
        if (theFrame) {
            theFrame.focus = false;
        }
        theFrame = app.allFrameObjects[indexOfFrame]
        if (theFrame) {
            toChange = true
        } else {
            state = "One"
        }
    }
    Keys.onLeftPressed: {
        toChange = false
        if (allFrameObjects.length == 0)
            return
        if (theFrame) theFrame.focus = false;
        indexOfFrame--
        indexOfFrame += app.allFrameObjects.length
        indexOfFrame %= app.allFrameObjects.length
        theFrame = app.allFrameObjects[indexOfFrame]
        if (theFrame) {
            toChange = true
        }
    }
    Keys.onDownPressed: {
        toChange = false
        if(theFrame) {
            theFrame.subframe++
        }
    }
    Keys.onUpPressed: {
        toChange = false
        if(theFrame) {
            theFrame.subframe--
        }
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            var obj = root.childAt(mouseX, mouseY);
            if(obj) {
                var index = app.allFrameObjects.indexOf(obj)
                if (index != -1) {
                    //  console.log(mouseX, mouseY, obj, index)
                    theFrame = obj
                    // indexOfFrame = index
                    toChange = true
                }
            }
        }
    }
    states: [
        State {
            name: "One"
            PropertyChanges {
                restoreEntryValues: false
                target: rootTranslate
                x: 0
                y: 0
            }
            PropertyChanges {
                explicit: true
                restoreEntryValues: false
                target: rootRotation
                angle: 0
                origin.x: theFrame ? theFrame.x : 0
                origin.y: theFrame ? theFrame.y : 0
            }
            PropertyChanges {
                restoreEntryValues: false
                target: rootScale
                xScale: 1
                yScale: 1
                zScale: 1
            }
            onCompleted: {
                focus = true // Retain focus
            }
        },
        State {
            name: "Z"
            when: toChange
            PropertyChanges {
                explicit: true
                restoreEntryValues: false
                target: rootRotation
                angle: - theFrame.angle
                origin.x: theFrame.x
                origin.y: theFrame.y
            }
            PropertyChanges {
                explicit: true
                restoreEntryValues: false
                target: rootScale
                xScale: 1 / theFrame.xScale
                yScale: 1 / theFrame.yScale
                zScale: 1 / theFrame.zScale
            }
            PropertyChanges {
                explicit: true
                restoreEntryValues: false
                target: rootTranslate
                x: -theFrame.x
                y: -theFrame.y
            }
            onCompleted: {
                toChange = false
                state = ""
                theFrame.focus = true
            }
        }
    ]
    transitions: Transition {
        SequentialAnimation {
            NumberAnimation {
                target: rootScale
                properties: "xScale,yScale,zScale"
                easing.type: Easing.InOutExpo
                duration: 350
            }
            //            PauseAnimation {
            //                duration: 100
            //            }
            NumberAnimation {
                target: rootRotation
                properties: "angle"
                easing.type: Easing.InOutExpo
                duration: 300
            }
            //            PauseAnimation {
            //                duration: 100
            //            }
            NumberAnimation {
                target: rootTranslate
                properties: "x,y"
                easing.type: Easing.InOutExpo
                duration: 350
            }
        }
    }
    transform: [
        Rotation {
            id: rootRotation
        },
        Translate {
            id: rootTranslate
        },
        Scale {
            id: rootScale
        }
    ]
    Image {
//        x: app.width * 0.25
//        y: app.height * 0.25
        width: app.width
        height: app.height
        source: "1920x1200.jpg"
//        source:"world_map_circles.jpg"
        //fillMode: Image.PreserveAspectCrop
        //layer.enabled: true
        //mipmap: true
    }
}
