import QtQuick
import "./../config"
import "./../services"

Rectangle {
    id: root

    property int spacing: 0
    property bool active: false
    property bool hovered: false
    property bool popoutManagerExempt: false
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

        width: contentLoader.implicitWidth
        height: contentLoader.implicitHeight
        anchors.margins: Appearance.padding.smallest

        radius: Appearance.defaults.rounding
        color: (root.hovered || root.active) ? Appearance.defaults.color.primary : Appearance.defaults.color.secondary

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
                root.hovered = true;
                if (!root.popoutManagerExempt) {
                    PopOutManager.hideCurrent();
                }
                root.hover(true);
            }
            onExited: {
                root.hovered = false;
                root.hover(false);
            }
            onClicked: root.clicked()
        }
    }
}
