import QtQuick 2.15
import QtQuick.Layouts
import "./../../config"
import "./../../widgets"
import "./../../services"

InteractiveView {
    id: root

    property string cpu: `${Resources.cpuUsage}%`
    property string ram: `${Resources.usedRam.toFixed(
                             2)}/${Resources.totalRam.toFixed(2)} G`
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

            Item {
                width: cpuText.width + cpuIcon.width + 4
                height: Math.max(cpuText.height, cpuIcon.height)
                StyledText {
                    id: cpuText
                    text: `${root.cpu}`
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }

                MaterialIcon {
                    id: cpuIcon
                    text: "memory"
                    anchors.leftMargin: 1
                    anchors.rightMargin: 3
                    anchors.left: cpuText.right
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            Item {
                width: ramText.width + ramIcon.width + 2
                height: Math.max(ramText.height, ramIcon.height)
                StyledText {
                    id: ramText
                    text: `${root.ram}`
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }
                MaterialIcon {
                    id: ramIcon
                    text: "memory_alt"
                    anchors.leftMargin: 2
                    anchors.left: ramText.right
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            Item {
                width: tempText.width + tempIcon.width + 1
                height: Math.max(tempText.height, tempIcon.height)
                StyledText {
                    id: tempText
                    text: `${root.temp}`
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }
                MaterialIcon {
                    id: tempIcon
                    text: "device_thermostat"
                    anchors.leftMargin: 1
                    anchors.left: tempText.right
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
    }
}
