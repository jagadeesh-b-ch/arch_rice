import Quickshell
import Quickshell.Wayland
import QtQuick

PanelWindow {
    required property string name

    WlrLayershell.namespace: `caelestia-${name}`
    color: "transparent"
    Rectangle {
      anchors.fill: parent
      opacity: 0
    }
}
