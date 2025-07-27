import QtQuick
import "./../../services"
import "./../../widgets"
import "./../../config"
import Quickshell
import QtQuick.Layouts

RowLayout {
    id: workspaceLayout
    spacing: Appearance.defaults.spacing

    property var baseWorkspaceIds: [1, 2, 3, 4, 5, 6]
    property int activeWsId: Hyprland.activeWorkspace.id
    property var createdWorkspaceIds: Hyprland.workspaces.values.map(w => w.id)
    property var finalWorkspaceIds: Array.from(
                                        new Set([...baseWorkspaceIds, activeWsId, ...createdWorkspaceIds])).filter(
                                        w => w > 0).sort((a, b) => a - b)

    Repeater {
        model: finalWorkspaceIds

        delegate: Workspace {

            id: workspaceNumber
            workspaceId: modelData
            activeWorkspaceId: activeWsId
            z: 1 // Ensure text is above the background
            Layout.alignment: Qt.AlignVCenter
        }
    }
}
