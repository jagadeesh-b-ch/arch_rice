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
    property bool hovered: false
    InteractiveView {
        id: volumeView
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
        onHover: isHovered => {
                     root.hovered = isHovered
                     if (root.hovered) {
                         hoverTimer.running = true
                     }
                 }
    }

    Timer {
        id: hoverTimer
        running: false
        interval: 3000
    }

    HorizontalSlider {
        id: volumeSlider
        visible: hovered || volumeSlider.sliderHover
                 || hoverTimer.running === true

        hostWidth: volumeView.width
        hostHeight: volumeView.height
    }
}
