import QtQuick 2.15
import "./../config"
import "./resources"

Row {
    id: root
    spacing: Appearance.defaults.spacing

    ResourcesWidget {
        id: resourcesWidget
        anchors.verticalCenter: parent.verticalCenter
    }
}
