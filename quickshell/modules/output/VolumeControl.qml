pragma ComponentBehavior: Bound

import Quickshell
import QtQuick 2.15
import QtQuick.Layouts
import "./../../widgets"
import "./../../utils"
import "./../../config"
import "./../../services"

Item {
    id: root

    width: volumeView.width
    height: volumeView.height

    property int readableVolume: (Audio.volume * 100)

    FontMetrics {
        id: metrics
        font: Qt.font({
            "family": Appearance.defaults.fontFamily,
            "pixelSize": Appearance.defaults.fontSize
        })
    }

    InteractiveView {
        id: volumeView
        RowLayout {
            spacing: Appearance.padding.smallest
            StyledTextPadded {
                text: root.readableVolume
                rightPadding: 0
            }

            MaterialIconPadded {
                text: Icons.getVolumeIcon(root.readableVolume)
                leftPadding: 0
            }
        }
        onClicked: Hyprland.dispatch(`hl.dsp.exec_cmd("${DefaultApps.audio}", { tag = "bar_launch" })`)
        onHover: isHovered => {
            if (isHovered) {
                PopOutManager.show(volumeSlider);
            }
        }
    }

    HorizontalSlider {
        id: volumeSlider
        anchor.item: root
        slideValue: Audio.volume
        onSlide: newVolume => {
            Audio.setVolume(newVolume);
        }
        hostWidth: volumeView.width
        hostHeight: volumeView.height
    }
}
