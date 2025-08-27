import QtQuick 2.15
import Quickshell.Services.UPower
import "./../../widgets"
import "./../../utils"
import "./../../config"

InteractiveView {
    spacing: Appearance.padding.smallest
    onClicked: {
        if (PowerProfiles.profile === PowerProfile.Balanced) {
            PowerProfiles.profile = PowerProfile.PowerSaver
        } else if (PowerProfiles.profile === PowerProfile.PowerSaver) {
            if (PowerProfiles.hasPerformanceProfile) {
                PowerProfiles.profile = PowerProfile.Performance
            } else {
                PowerProfiles.profile = PowerProfile.Balanced
            }
        } else if (PowerProfiles.profile === PowerProfile.Performance) {
            PowerProfiles.profile = PowerProfile.Balanced
        }
    }
    MaterialIconPadded {
        text: Icons.getPowerProfileIcon(PowerProfiles.profile)
    }
}
