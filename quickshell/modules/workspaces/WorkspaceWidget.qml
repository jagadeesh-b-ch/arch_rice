import QtQuick
import "./../../services"
import Quickshell
import QtQuick.Layouts

RowLayout {
    id: workspaceLayout
    spacing: 8

    property var workspaceClients: Hyprland.clients.filter(w => w.id > 0).sort((a, b) => a.id - b.id)
    Repeater {
        model: workspaceClients

        delegate: Workspace {
            label: `${modelData.id}`
            Layout.alignment: Qt.AlignVCenter
        }
    }
}
