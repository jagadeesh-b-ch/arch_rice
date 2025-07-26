import QtQuick
import "./../config"

Rectangle {
    id: root
    property string textValue
    width: styledText.implicitWidth
    height: styledText.implicitHeight
    radius: Appearance.defaults.rounding
    color: hovered ? "#4CAF50" : "transparent"

    property bool hovered: false

    signal clicked()

    Text {
        id: styledText
        text: textValue
        leftPadding: Appearance.defaults.hPadding
        rightPadding: Appearance.defaults.hPadding
        topPadding: Appearance.defaults.vPadding
        bottomPadding: Appearance.defaults.vPadding
        color: Appearance.color.text
        font.family: Appearance.defaults.fontFamily
        font.pointSize: Appearance.defaults.fontSize
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onEntered: hovered = true
        onExited: hovered = false
        onClicked: root.clicked()
    }
}
