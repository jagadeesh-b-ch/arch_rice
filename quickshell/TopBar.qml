import Quickshell
import QtQuick
import "widgets"
import "root:/modules/workspaces"

Scope {
    Variants {
        model: Quickshell.screens

        StyledWindow {
            property var modelData
            name: "topBar"
            screen: modelData

            anchors.top: true
            anchors.left: true
            anchors.right: true
            implicitHeight: 30
            ClockWidget {
                anchors.centerIn: parent
                anchors.verticalCenter: parent.verticalCenter
            }
            WorkspaceWidget {
              anchors.left: parent.left
              anchors.verticalCenter: parent.verticalCenter
            }
        }
    }
}

