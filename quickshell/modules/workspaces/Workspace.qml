import QtQuick
import "./../../config"
import "./../../widgets"
import "./../../services"
import QtQuick.Layouts
import Quickshell.Io

Item {
    id: workspaceItem

    property int workspaceId
    property int activeWorkspaceId

    implicitWidth: workspaceComponent.width
    implicitHeight: workspaceComponent.height

    StyledView {
        id: workspaceComponent
        StyledTextPadded {
            text: workspaceId
        }
        active: workspaceId == activeWorkspaceId
        onClicked: Hyprland.dispatch(`workspace ${workspaceId}`)
    }
}
