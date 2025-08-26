import QtQuick
import "./../config"

Rectangle {
    id: root
    property int spacing: Appearance.padding.smallest

    width: (contentLoader.item ? contentLoader.item.implicitWidth : 0) + (2 * spacing)
    height: (contentLoader.item ? contentLoader.item.implicitHeight : 0) + (2 * spacing)
    radius: Appearance.defaults.rounding
    color: Appearance.defaults.color.secondary

    default property alias content: contentLoader.sourceComponent

    Item {
        anchors.fill: parent
        anchors.margins: spacing
        Loader {
            id: contentLoader
        }
    }
}
