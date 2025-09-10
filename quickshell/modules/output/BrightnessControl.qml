import QtQuick 2.15
import QtQuick.Layouts
import "./../../widgets"
import "./../../config"
import "./../../utils"

Item {
    id: root

    width: brightnessView.width
    height: brightnessView.height

    property bool hovered: false

    InteractiveView {
        id: brightnessView
        RowLayout {
            spacing: Appearance.padding.smallest
            StyledTextPadded {
                text: "50%"
                rightPadding: 0
            }
            MaterialIconPadded {
                text: Icons.getBrightnessIcon(50)
                leftPadding: 0
            }
        }
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
        id: brightnessSlider
        visible: hovered || brightnessSlider.sliderHover || hoverTimer.running === true

        hostWidth: brightnessView.width
        hostHeight: brightnessView.height
    }
}
