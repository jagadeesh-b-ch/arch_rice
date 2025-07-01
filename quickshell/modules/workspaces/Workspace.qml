import QtQuick
import "root:/config"
import "root:/widgets"
import QtQuick.Layouts

Item {
    id: root

    property int myWidth: workSpaceRect.width

    property string label: ""
    property bool isActive

    Layout.preferredHeight: parent.height

    Rectangle {
        id: workSpaceRect
        width: textItem.implicitWidth + 12
        height: textItem.implicitHeight + 12
        color: "red"
        radius: height / 2
        StyledText {
            id: textItem
            anchors.centerIn: parent
            anchors.verticalCenter: parent.verticalCenter
            text: label
        }
    }
}
