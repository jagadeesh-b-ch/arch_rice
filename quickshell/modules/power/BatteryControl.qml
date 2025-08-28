import QtQuick 2.15
import QtQuick.Layouts
import Quickshell.Io
import Quickshell.Services.UPower
import "./../../widgets"
import "./../../config"
import "./../../utils"

InteractiveView {
    id: root
    property int batteryPercentage: UPower.displayDevice.percentage * 100
    RowLayout {
        spacing: Appearance.padding.smallest
        StyledTextPadded {
            rightPadding: 0
            Layout.alignment: Qt.AlignVCenter
            text: root.batteryPercentage + "%"
        }
        MaterialIconPadded {
            leftPadding: 0
            Layout.alignment: Qt.AlignVCenter
            text: Icons.getBatteryIcon(batteryPercentage, UPower.displayDevice.state === UPowerDeviceState.Charging)
        }
    }
}

