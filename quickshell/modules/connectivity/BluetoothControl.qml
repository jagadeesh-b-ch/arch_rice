import QtQuick 2.15
import "./../../config"
import "./../../widgets"
import "./../../services"

StyledView {
    z: 10
    onClicked: Hyprland.dispatch("exec [tag +bar_launch] alacritty -e bluetui")
    MaterialIconPadded {
        text: Bluetooth.powered ? "bluetooth" : "bluetooth_disabled"
    }
}
