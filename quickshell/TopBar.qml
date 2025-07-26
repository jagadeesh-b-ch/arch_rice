import Quickshell
import QtQuick
import "widgets"
import "./modules/workspaces"
import "./modules/launcher"
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
            implicitHeight: topBarContainer.height + Appearance.defaults.hPadding
            Item {
                id: topBarContainer
                height: Math.max(topLeftComponents.height,
                                 clockWid.implicitHeight)
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: Appearance.defaults.hPadding
                anchors.verticalCenter: parent.verticalCenter
                ClockWidget {
                    id: clockWid
                    anchors.centerIn: parent
                    anchors.verticalCenter: parent.verticalCenter
                }

                Row {
                    id: topLeftComponents
                    height: Math.max(appLauncher.implicitHeight, workspaceWid.implicitHeight)
                    spacing: Appearance.defaults.spacing

                    AppLauncher {
                        id: appLauncher
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    WorkspaceWidget {
                        id: workspaceWid
                        anchors.left: appLauncher.right
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }
        }
    }
}
