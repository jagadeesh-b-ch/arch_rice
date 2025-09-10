import QtQuick
import QtQuick.Controls
import "./../config"

PopOutWindow {
    id: sliderPopout
    anchor.item: root

    property int horizontalScale: 3
    property int verticalScale: 1

    implicitHeight: hostHeight + (2 * vPadding)
    implicitWidth: (horizontalScale * hostWidth) + (2 * hPadding)

    Slider {
        id: slider
        anchors.centerIn: parent
        anchors.margins: Appearance.padding.normal
        anchors.fill: parent
        from: 0.0
        to: 1.0
        value: 0.5

        handle: Rectangle {
            color: Appearance.defaults.color.primary
            width: 16
            height: 16
            radius: 16 / 2
            y: (parent.height - height) / 2
            x: slider.visualPosition * (slider.width - width)
        }

        background: Item {
            anchors.fill: parent

            Rectangle {
                id: filledGroove
                height: 4
                radius: 2
                color: Appearance.defaults.color.primary
                anchors.verticalCenter: parent.verticalCenter
                width: slider.visualPosition * slider.width
            }
            Rectangle {
                id: unfilledGroove
                height: 4
                radius: 2
                color: Appearance.defaults.color.text
                anchors.verticalCenter: parent.verticalCenter
                x: filledGroove.width
                width: slider.width - filledGroove.width
            }
        }

        onMoved: {
            console.log("Slider value: ", value)
        }
    }
}
