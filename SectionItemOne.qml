import QtQuick 2.0

// SectionItemOne shows a subhead and an image
SectionItem {
    property alias subhead: text.text
    property alias gallery: image.source
    Text {
        id: text
        width: parent.width
        font.pointSize: 48 * app.fontScale
        wrapMode: Text.Wrap
        style: Text.Raised
        styleColor: "white"
    }
    Image {
        id: image
        anchors.top: text.bottom
        width: parent.width
        height: 0.9 * parent.height
        fillMode: Image.PreserveAspectFit
    }
}
