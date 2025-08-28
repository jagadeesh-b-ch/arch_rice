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

            implicitHeight: topBarContainer.implicitHeight
            Item {
                id: topBarContainer
                implicitHeight: Math.max(clockWid.implicitHeight,
                                         leftModules.implicitHeight,
                                         rightModules.implicitHeight)
                                + (2 * Appearance.defaults.vPadding)
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.leftMargin: Appearance.defaults.hPadding
                anchors.rightMargin: Appearance.defaults.hPadding
                anchors.topMargin: Appearance.defaults.vPadding
                anchors.bottomMargin: Appearance.defaults.vPadding
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

                RightModules {
                    id: rightModules
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
    }
}
