import QtQuick 2.15
import QtQuick.Layouts
import Quickshell.Io
import "./../../config"
import "./../../utils"
import "./../../widgets"

Item {
    width: launcherView.width
    height: launcherView.height
    InteractiveView {
        id: launcherView
        onClicked: launcherProcess.running = true

        content: StyledTextPadded {
            text: Icons.osIcon
        }
    }

    Process {
        id: launcherProcess
        command: ["rofi", "-show", "drun"]
        running: false
    }
}
