import QtQuick 2.15
import QtQuick.Layouts
import "./../../widgets"
import "./../../config"
import "./../../utils"

InteractiveView {
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
}
