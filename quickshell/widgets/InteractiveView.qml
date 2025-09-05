import QtQuick
import "./../config"

Rectangle {
    id: root

    property int spacing: 0
    property bool active: false
    property bool hovered: false
    signal clicked
    signal hover(bool hovered)
    default property alias content: contentLoader.sourceComponent

    width: interactiveView.width + (2 * spacing)
    height: interactiveView.height + (2 * spacing)

    radius: Appearance.defaults.rounding
    color: Appearance.defaults.color.secondary

    Rectangle {
        id: interactiveView

        anchors.centerIn: parent

        width: (contentLoader.item ? contentLoader.item.implicitWidth : 0)
        height: (contentLoader.item ? contentLoader.item.implicitHeight : 0)
        anchors.margins: Appearance.padding.smallest

        radius: Appearance.defaults.rounding
        color: (hovered
                || active) ? "#4CAF50" : Appearance.defaults.color.secondary

        Loader {
            id: contentLoader
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            preventStealing: true
            propagateComposedEvents: true
            onEntered: {
                hovered = true
                root.hover(true)
            }
            onExited: {
                hovered = false
                root.hover(false)
            }
            onClicked: root.clicked()
        }
    }
}
