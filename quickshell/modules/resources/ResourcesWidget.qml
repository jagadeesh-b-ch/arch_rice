import QtQuick 2.15
import "./../../config"
import "./../../widgets"
import "./../../services"

Item {
    id: root
    property string cpu: `${Resources.cpuUsage}%`
    property string ram: `${Resources.usedRam.toFixed(
                             2)}/${Resources.totalRam.toFixed(2)} G`
    property string temp: `${Resources.cpuTemp}\u00B0C`

    implicitHeight: resources.height
    implicitWidth: resources.width

    StyledText {
        id: resources
        textValue: `${root.cpu}    ${root.ram}    ${root.temp}`
        onClicked: Hyprland.dispatch("exec [tag +bar_launch] alacritty -e btop")
    }

}
