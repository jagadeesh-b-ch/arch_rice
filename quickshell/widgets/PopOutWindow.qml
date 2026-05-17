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
    property bool _contentHovered: false

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

        MouseArea {
            id: hoverTrack
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.NoButton
            onEntered: {
                popOutWindow.popoutHovered = true;
                hoverTimer.stop();
            }
            onExited: {
                popOutWindow.popoutHovered = false;
                hoverTimer.restart();
            }
        }

        Loader {
            id: contentLoader
        }
    }

    function show() {
        visible = true;
        popoutHovered = true;
        hoverTimer.stop();
    }

    function forceHide() {
        visible = false;
        hoverTimer.stop();
    }

    function restartAutoHide() {
        popoutHovered = false;
        hoverTimer.restart();
    }

    Timer {
        id: hoverTimer
        interval: 2000
        onTriggered: {
            if (!popOutWindow.popoutHovered && !popOutWindow._contentHovered) {
                popOutWindow.forceHide();
            }
        }
    }
}
