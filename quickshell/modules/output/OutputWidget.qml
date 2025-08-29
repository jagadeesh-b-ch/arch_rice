import QtQuick 2.15
import QtQuick.Layouts
import "./../../widgets"

StyledView {
    RowLayout {
        spacing: 0
        VolumeControl {}
        BrightnessControl {}
    }
}
