import QtQuick 2.15
import "./../config"
import "./launcher"
import "./workspaces"

Row {
    id: root
    spacing: Appearance.defaults.spacing

    AppLauncher {
        id: appLauncher
        anchors.verticalCenter: parent.verticalCenter
    }

    WorkspaceWidget {
        id: workspaceWidget
        anchors.verticalCenter: parent.verticalCenter
    }
}
