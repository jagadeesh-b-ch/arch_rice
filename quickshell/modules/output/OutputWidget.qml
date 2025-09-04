import QtQuick 2.15
import QtQuick.Layouts
import "./../../widgets"

StyledView {
    Item {
        implicitWidth: volumeControl.width + brightnessControl.width
        implicitHeight: Math.max(volumeControl.height, brightnessControl.height)
        VolumeControl {
            id: volumeControl
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
        }
        BrightnessControl {
            id: brightnessControl
            anchors.left: volumeControl.right
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}
