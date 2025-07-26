import QtQuick
import "./../../services"
import "./../../widgets"
import "./../../config"
import Quickshell
import QtQuick.Layouts

RowLayout {
    id: workspaceLayout
    spacing: Appearance.defaults.spacing

    property var workspaceClients: Hyprland.clients.filter(w => w.id > 0).sort(
                                       (a, b) => a.id - b.id)
    property int activeClientId: Hyprland.activeClient.id
    Repeater {
        model: workspaceClients

        delegate: Workspace {

            id: workspaceNumber
            workspaceId: modelData.id
            activeWorkspaceId: activeClientId
            z: 1 // Ensure text is above the background
            Layout.alignment: Qt.AlignVCenter
        }
    }
}
