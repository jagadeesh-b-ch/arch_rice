import Quickshell
import "modules/background"
import "widgets"

Scope {
  TopBar {
    id: topbar
  }
  StyledWindow {
    id: sample
    anchors.top: true
    anchors.bottom: true
    anchors.left: true
    anchors.right: true

    StyledText {
        id: sampleText

        anchors.centerIn: parent

        horizontalAlignment: Text.AlignHCenter
        text: "•••"
        color: Colours.palette.m3primary
        font.pointSize: Appearance.font.size.extraLarge * 0.9
    }
  }
}

