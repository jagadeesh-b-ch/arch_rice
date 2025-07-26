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

    width: workspaceComponent.implicitWidth
    height: workspaceComponent.implicitHeight

    Component {
        id: activeComponent
        HighlightedText {
            textValue: workspaceId
        }
    }

    Component {
        id: nonActiveComponent
        StyledText {
            textValue: workspaceId
            onClicked: Hyprland.dispatch(`workspace ${workspaceId}`)
        }
    }

    Loader {
        id: workspaceComponent
        sourceComponent: workspaceId == activeWorkspaceId ? activeComponent : nonActiveComponent
    }

}
