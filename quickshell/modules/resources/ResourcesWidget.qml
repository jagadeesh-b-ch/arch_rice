import QtQuick
import QtQuick.Layouts
import "./../../config"
import "./../../widgets"
import "./../../services"

InteractiveView {
    id: root

    property string cpu: `${Resources.cpuUsage}%`
    property string ram: `${Resources.usedRam.toFixed(2)}/${Resources.totalRam.toFixed(2)} G`
    property string temp: `${Resources.cpuTemp}\u00B0C`

    spacing: Appearance.padding.smallest

    onClicked: Hyprland.dispatch("exec [tag +bar_launch] alacritty -e btop")

    content: Item {
        implicitWidth: resources.implicitWidth + (2 * Appearance.defaults.hPadding)
        implicitHeight: resources.implicitHeight + (2 * Appearance.defaults.vPadding)
        RowLayout {
            id: resources
            spacing: Appearance.defaults.spacing
            anchors.centerIn: parent

            Row {
                spacing: 1
                StyledText {
                    id: cpuText
                    text: `${root.cpu}`
                }
                MaterialIcon {
                    id: cpuIcon
                    text: "memory"
                }
            }

            Row {
                spacing: 1
                StyledText {
                    id: ramText
                    text: `${root.ram}`
                }
                MaterialIcon {
                    id: ramIcon
                    text: "memory_alt"
                }
            }

            Row {
                spacing: 1
                StyledText {
                    id: tempText
                    text: `${root.temp}`
                }
                MaterialIcon {
                    id: tempIcon
                    text: "device_thermostat"
                }
            }
        }
    }
}
