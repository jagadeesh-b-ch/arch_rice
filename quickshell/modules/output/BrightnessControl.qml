import QtQuick 2.15
import QtQuick.Layouts
import "./../../widgets"
import "./../../config"
import "./../../utils"
import "./../../services"

Item {
    id: root

    width: brightnessView.width
    height: brightnessView.height

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
                     if (isHovered) {
                         PopOutManager.show(brightnessSlider)
                     }
                 }
    }

    HorizontalSlider {
        id: brightnessSlider

        hostWidth: brightnessView.width
        hostHeight: brightnessView.height
    }
}
