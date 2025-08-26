import QtQuick 2.15
import "./../../config"
import "./../../widgets"
import "./../../utils"
import "./../../services"

InteractiveView {
	onClicked: Hyprland.dispatch("exec [tag +bar_launch] alacritty -e nmtui")
	MaterialIconPadded {
		text: Network.active ? Icons.getNetworkIcon(Network.active.strength
													?? 0) : "wifi_off"
		anchors.verticalCenter: parent.verticalCenter
	}
	z: 10
}
