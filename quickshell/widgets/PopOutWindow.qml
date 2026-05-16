import QtQuick
import QtQuick.Window
import Quickshell
import "./../config"

PopupWindow {
    id: popOutWindow

    property Item anchorTarget: parent
    property int hostWidth: 10
    property int hostHeight: 3
    property int hPadding: Appearance.defaults.hPadding
    property int vPadding: Appearance.defaults.vPadding
    property bool popoutHovered: false

    color: "transparent"

    anchor.item: anchorTarget
    anchor.rect.x: -((implicitWidth - hostWidth) / 2 + hPadding)
    anchor.rect.y: hostHeight + (2 * vPadding)

    Rectangle {
        id: popOutView
        anchors.fill: parent
        radius: Appearance.defaults.rounding
        color: Appearance.defaults.color.secondary

        default property alias content: contentLoader.sourceComponent

        Loader {
            id: contentLoader
        }

        MouseArea {
            anchors.fill: parent
            z: 100
            hoverEnabled: true
            acceptedButtons: Qt.NoButton
            onEntered: popOutWindow.popoutHovered = true
            onExited: {
                popOutWindow.popoutHovered = false;
                hoverTimer.restart();
            }
        }
    }

    function show() {
        visible = true;
        hoverTimer.restart();
    }

    function forceHide() {
        visible = false;
        hoverTimer.stop();
    }

    function restartAutoHide() {
        hoverTimer.restart();
    }

    Timer {
        id: hoverTimer
        running: false
        repeat: false
        interval: 2000
        onTriggered: {
            if (!popOutWindow.popoutHovered) {
                popOutWindow.forceHide();
            }
        }
    }
}
