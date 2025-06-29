import QtQuick
import "root:/services"
import Quickshell
import QtQuick.Layouts

RowLayout {
    id: workspaceLayout

    anchors.verticalCenter: parent.verticalCenter
    spacing: 9

    property var workspaceClients: Hyprland.clients.filter(w => w.id > 0).sort((a, b) => a.id - b.id)
    Repeater {
      model: workspaceClients

        delegate: Workspace {
          label: `${modelData.id}`
        }
    }
}
