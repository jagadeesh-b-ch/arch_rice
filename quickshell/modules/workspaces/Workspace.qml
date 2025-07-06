import QtQuick
import "./../../config"
import "./../../widgets"
import QtQuick.Layouts

Item {
    property string label
    id: workspaceItem
    // Calculate width and height based on the text size plus padding
    // This ensures the circular background scales with the text
    property real padding: 12 // Padding around the text
    width: Math.max(workspaceNumber.implicitWidth + padding * 2,
                    workspaceNumber.implicitHeight + padding * 2)
    height: width // Keep it square for a perfect circle

    // Background circle for hover effect
    Rectangle {
        id: hoverBackground
        width: parent.width // Match parent item's width
        height: parent.height // Match parent item's height
        radius: width / 2 // Make it a perfect circle
        color: "lightgray" // Default color (transparent when not hovered)
        opacity: 0 // Initially invisible
        anchors.centerIn: parent // Center within the workspace item

        // States for hover effect
        states: [
            State {
                name: "hovered"
                when: mouseArea.containsMouse // When mouse is over the area
                PropertyChanges {
                    target: hoverBackground
                    opacity: 1 // Make visible
                    color: "#4CAF50" // Green highlight color (adjust as desired)
                }
            }
        ]

        // Transitions for smooth animation
        transitions: Transition {
            from: ""
            to: "hovered"
            reversible: true // Allows smooth transition both ways
            PropertyAnimation {
                properties: "opacity, color"
                duration: 150 // Animation duration in milliseconds
            }
        }
    }

    // Text for the workspace number
    StyledText {
        id: workspaceNumber
        text: workspaceItem.label // Display 1-based index (1 to 6)
        anchors.centerIn: parent // Center text within the workspace item
        z: 1 // Ensure text is above the background
    }

    // MouseArea to detect hover events
    MouseArea {
        id: mouseArea
        anchors.fill: parent // Fill the entire workspace item
        hoverEnabled: true // Enable hover events

        // You can add onClicked or other mouse events here if needed
        onClicked: {
            console.log("Clicked Workspace:", workspaceNumber.text)
            // Add logic for switching workspaces here
        }
    }
}
