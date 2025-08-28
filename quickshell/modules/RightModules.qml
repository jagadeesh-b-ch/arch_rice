import QtQuick 2.15
import "./../config"
import "./resources"
import "./connectivity"
import "./power"

Row {
    id: root
    spacing: Appearance.defaults.spacing

    ConnectivityWidget {
        id: connectivityWidget
        anchors.verticalCenter: parent.verticalCenter
    }

    ResourcesWidget {
        id: resourcesWidget
        anchors.verticalCenter: parent.verticalCenter
    }

    PowerWidget {
        anchors.verticalCenter: parent.verticalCenter
    }
}
