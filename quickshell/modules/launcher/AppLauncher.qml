import QtQuick 2.15
import QtQuick.Layouts
import Quickshell.Io
import "./../../config"
import "./../../utils"
import "./../../widgets"

StyledText {
    textValue: Icons.osIcon
    onClicked: launcherProcess.running = true

    Process {
        id: launcherProcess
        command: ["rofi", "-show", "drun"]
        running: false
    }
}
