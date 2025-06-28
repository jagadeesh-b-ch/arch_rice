import Quickshell
import QtQuick
import "widgets"

Scope {
    Variants {
        model: Quickshell.screens

        StyledWindow {
            property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }
            implicitHeight: 30
            ClockWidget {
                anchors.centerIn: parent
            }
            WorkspaceWidget {
              anchors.left: parent.left
              anchors.verticalCenter: parent.verticalCenter
            }
        }
    }
}

