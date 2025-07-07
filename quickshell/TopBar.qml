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
            implicitHeight: topBarContainer.height + Appearance.padding.small
            Item {
                id: topBarContainer
                height: Math.max(
                            workspaceWid.implicitHeight,
                            clockWid.implicitHeight)
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: Appearance.padding.small
                anchors.verticalCenter: parent.verticalCenter
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
}
