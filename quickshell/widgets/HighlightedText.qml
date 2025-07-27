import QtQuick
import "./../config"

Rectangle {
    id: root
    required property string textValue
    width: highlightedText.implicitWidth
    height: highlightedText.implicitHeight
    radius: Appearance.defaults.rounding
    color: "#4CAF50"

    signal clicked()

    Text {
        id: highlightedText
        text: textValue
        leftPadding: Appearance.defaults.hPadding
        rightPadding: Appearance.defaults.hPadding
        topPadding: Appearance.defaults.vPadding
        bottomPadding: Appearance.defaults.vPadding
        color: Appearance.defaults.color.text
        font.family: Appearance.defaults.fontFamily
        font.pointSize: Appearance.defaults.fontSize
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: root.clicked()
    }
}
