import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell.Services.Pipewire
import "./../../widgets"
import "./../../utils"
import "./../../config"
import "./../../services"

Item {
    id: root

    width: volumeView.width
    height: volumeView.height

    property int readableVolume: (Audio.volume * 100)

    InteractiveView {
        id: volumeView
        RowLayout {
            spacing: Appearance.padding.smallest
            StyledTextPadded {
                text: readableVolume
                rightPadding: 0
            }

            MaterialIconPadded {
                text: Icons.getVolumeIcon(readableVolume)
                leftPadding: 0
            }
        }
        onClicked: Hyprland.dispatch("exec [tag +bar_launch] pwvucontrol")
        onHover: isHovered => {
                     if (isHovered) {
                         PopOutManager.show(volumeSlider)
                     }
                 }
    }

    HorizontalSlider {
        id: volumeSlider

        slideValue: Audio.volume
        onSlide: newVolume => {
                     Audio.setVolume(newVolume)
                 }
        hostWidth: volumeView.width
        hostHeight: volumeView.height
    }
}
