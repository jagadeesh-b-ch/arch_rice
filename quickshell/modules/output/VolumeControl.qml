import QtQuick 2.15
import QtQuick.Layouts
import Quickshell.Services.Pipewire
import "./../../widgets"
import "./../../utils"
import "./../../config"
import "./../../services"

InteractiveView {
    RowLayout {
        spacing: Appearance.padding.smallest
        StyledTextPadded {
            text: Audio.volume
            rightPadding: 0
        }

        MaterialIconPadded {
            text: Icons.getVolumeIcon(Audio.volume)
            leftPadding: 0
        }
    }
    onClicked: Hyprland.dispatch("exec [tag +bar_launch] pwvucontrol")
}
