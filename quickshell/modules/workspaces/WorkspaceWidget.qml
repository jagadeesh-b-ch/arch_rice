import QtQuick
import "./../../services"
import "./../../widgets"
import "./../../config"
import Quickshell
import QtQuick.Layouts

RowLayout {
    id: workspaceLayout
    spacing: Appearance.defaults.spacing


    Repeater {
        model: Hyprland.finalWorkspaceIds

        delegate: Workspace {

            id: workspaceNumber
            workspaceId: modelData
            activeWorkspaceId: Hyprland.activeWsId
            z: 1 // Ensure text is above the background
            Layout.alignment: Qt.AlignVCenter
        }
    }
}
