import QtQuick 2.0

// SectionItem holds content for each section
Item {
    property int subframeIndex: 0
    x: parent.width / 12
    y: parent.height / 6
    width: parent.width * 5 / 6
    height: parent.height * 5 / 6
    visible: parent.subframe % parent.subframeCount == subframeIndex
}
