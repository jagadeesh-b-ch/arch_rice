import QtQuick
import "./../config"

Rectangle {
    id: root
    property bool active: false
    property bool hovered: false
    signal clicked

    width: contentLoader.item ? contentLoader.item.implicitWidth : 0
    height: contentLoader.item ? contentLoader.item.implicitHeight : 0
    radius: Appearance.defaults.rounding
    color: (hovered || active) ? "#4CAF50" : Appearance.defaults.color.secondary

    default property alias content: contentLoader.sourceComponent

    Loader {
        id: contentLoader
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        preventStealing: true
        propagateComposedEvents: true
        onEntered: hovered = true
        onExited: hovered = false
        onClicked: root.clicked()
    }
}
