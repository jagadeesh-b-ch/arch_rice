import QtQuick
import "./../config"

Rectangle {
    id: root
    property bool active: false

    width: contentLoader.item ? contentLoader.item.implicitWidth : 0
    height: contentLoader.item ? contentLoader.item.implicitHeight : 0
    radius: Appearance.defaults.rounding
    z: -1
    color: (hovered || active) ? "#4CAF50" : Appearance.defaults.color.secondary

    property bool hovered: false

    signal clicked
    default property alias content: contentLoader.sourceComponent

    Loader {
        id: contentLoader
    }

}
