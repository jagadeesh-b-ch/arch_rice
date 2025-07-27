import QtQuick

Rectangle {
    id: background
    width: parent.width
    height: parent.height
    radius: Math.max(width, height)/2
    color: "transparent"
    opacity: 0
    anchors.centerIn: parent

    states: [
        State {
            name: "hovered"
            when: mouseArea.containsMouse
            PropertyChanges {
                target: background
                opacity: 1
                color: "#4CAF50"
            }
        }
    ]

    transitions: Transition {
        from: ""
        to: "hovered"
        reversible: true
        PropertyAnimation {
            properties: "opacity, color"
            duration: 150
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
    }

}
