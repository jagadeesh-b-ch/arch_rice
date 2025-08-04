import QtQuick 2.15
import "./../../widgets"
import "./../../utils"

StyledText {
	textValue: Network.active ? Icons.getNetworkIcon(Network.active.strength ?? 0) : "wifi_off"
}
