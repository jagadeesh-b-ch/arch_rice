import Quickshell
import QtQuick
import "widgets"
import "./modules/workspaces"
import "./config"
import QtQuick.Layouts

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
            height: workspaceWid.implicitHeight
            ClockWidget {
                id: clockWid
                anchors.centerIn: parent
                anchors.verticalCenter: parent.verticalCenter
            }
            WorkspaceWidget {
                id: workspaceWid
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }
}
