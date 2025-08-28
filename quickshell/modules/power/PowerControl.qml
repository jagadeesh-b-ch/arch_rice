import QtQuick 2.15
import Quickshell.Io
import "./../../widgets"

Item {
    width: powerControl.width
    height: powerControl.height
    InteractiveView {
        id: powerControl
        MaterialIconPadded {
            text: "\uE8AC"
        }
        onClicked: logoutProcess.running = true
    }
    Process {
        id: logoutProcess
        command: ["wlogout"]
        running: false
    }
}
