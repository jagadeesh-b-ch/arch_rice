import Quickshell
import QtQuick 2.15
import QtQuick.Layouts
import "./../../widgets"
import "./../../config"
import "./../../utils"
import "./../../services"

Item {
    id: root

    property ShellScreen currentScreen
    property Brightness.Monitor monitor: Brightness.getMonitorForScreen(currentScreen)
    property int readableBrightness: (monitor.brightness * 100)

    width: brightnessView.width
    height: brightnessView.height

    InteractiveView {
        id: brightnessView
        RowLayout {
            spacing: Appearance.padding.smallest
            StyledTextPadded {
                text: readableBrightness
                rightPadding: 0
            }
            MaterialIconPadded {
                text: Icons.getBrightnessIcon(readableBrightness)
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

        slideValue: monitor.brightness
        onSlide: newBrightness => {
                     monitor.setBrightness(newBrightness)
                 }

        hostWidth: brightnessView.width
        hostHeight: brightnessView.height
    }
}
