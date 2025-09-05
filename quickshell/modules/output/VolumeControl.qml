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
        onHover: (isHovered) => { root.hovered = isHovered }
    }

    PopOutWindow {
        anchor.item: root
        anchor.rect.x: -50
        anchor.rect.y: volumeView.height
        anchor.margins.top: 2 * Appearance.defaults.vPadding
        visible: hovered
        Slider {
            id: slider
            anchors.fill: parent
            anchors.margins: 8
            from: 0.0
            to: 1.0
            value: 0.5
            onMoved: {
                console.log("Slider value: ", value)
            }
        }
    }

}
