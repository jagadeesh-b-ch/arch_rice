import Quickshell
import Quickshell.Wayland
import QtQuick
import "./../config"

PanelWindow {
    id: stylePanel
    required property string name
    property string bgColor: Appearance.defaults.color.primary
    color: "transparent"
    WlrLayershell.namespace: `archie-${name}`
    Rectangle {
        anchors.fill: parent
        color: stylePanel.bgColor
        opacity: 0.8
    }
}
