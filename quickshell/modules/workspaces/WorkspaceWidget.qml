import QtQuick
import "root:/services"
import Quickshell
import QtQuick.Layouts

RowLayout {
    id: workspaceLayout
    height: parent.height

    property int maxWidth: 0

    anchors.verticalCenter: parent.verticalCenter
    spacing: 9

    property var workspaceClients: Hyprland.clients.filter(w => w.id > 0).sort((a, b) => a.id - b.id)
    Repeater {
        model: workspaceClients

        delegate: Workspace {
            Component.onCompleted: {
                if (myWidth > workspaceLayout.maxWidth) {
                    workspaceLayout.maxWidth = myWidth;
                }
            }
            width: workspaceLayout.maxWidth
            label: `${modelData.id}`
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}
