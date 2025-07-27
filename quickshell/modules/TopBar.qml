import Quickshell
import QtQuick
import "./../widgets"
import "./workspaces"
import "./launcher"
import "./time"
import "./../config"
import QtQuick.Layouts

Scope {
    Variants {
        model: Quickshell.screens

        StyledWindow {
            property var modelData
            id: topBar
            name: "topBar"
            screen: modelData

            anchors.top: true
            anchors.left: true
            anchors.right: true

            property int margin: Appearance.defaults.hPadding
            implicitHeight: topBarContainer.implicitHeight
            Item {
                id: topBarContainer
                implicitHeight: Math.max(
                                    clockWid.implicitHeight,
                                    leftModules.implicitHeight) + (2 * margin)
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.margins: margin
                anchors.verticalCenter: parent.verticalCenter

                ClockWidget {
                    id: clockWid
                    anchors.centerIn: parent
                    anchors.verticalCenter: parent.verticalCenter
                }

                LeftModules {
                    id: leftModules
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
    }
}
