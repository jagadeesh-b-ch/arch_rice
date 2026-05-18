pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Wayland
import "./../services"
import "./../widgets"
import "./../config"

PanelWindow {
  id: root

  color: "transparent"
  visible: false

  anchors.top: true
  anchors.bottom: true
  anchors.left: true
  anchors.right: true

  WlrLayershell.layer: WlrLayer.Overlay
  WlrLayershell.namespace: "archie-wallpaperPicker"
  WlrLayershell.exclusionMode: ExclusionMode.Ignore

  property int currentIndex: 0
  readonly property int count: carouselRepeater.count

  Rectangle {
    anchors.fill: parent
    color: "#60000000"

    MouseArea {
      anchors.fill: parent
      acceptedButtons: Qt.LeftButton
      onClicked: root.close()
    }
  }

  Item {
    id: carouselBox
    anchors.centerIn: parent
    width: carouselRow.width
    height: carouselRow.height
    z: 1

    Row {
      id: carouselRow
      spacing: 10

      Repeater {
        id: carouselRepeater
        model: Wallpapers.list

        delegate: Item {
          required property var modelData
          required property int index

          readonly property int dist: Math.abs(index - root.currentIndex)

          implicitWidth: dist === 0 ? 280
            : dist === 1 ? 190
            : 130
          implicitHeight: dist === 0 ? 180
            : dist === 1 ? 130
            : 90

          Rectangle {
            anchors.fill: parent
            radius: 12
            color: "#222222"
            border.width: dist === 0 ? 3 : 1
            border.color: dist === 0 ? "#4CAF50" : "#555555"
            clip: true

            Image {
              anchors.fill: parent
              anchors.margins: 2
              source: "file://" + modelData.path
              asynchronous: true
              sourceSize.width: 280
              sourceSize.height: 180
              fillMode: Image.PreserveAspectCrop
            }
          }

          Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 6
            text: modelData.name
            color: "#ffffff"
            font.pixelSize: 11
            style: Text.Outline
            styleColor: "#cc000000"
            visible: dist <= 1
          }

          MouseArea {
            anchors.fill: parent
            onClicked: {
              root.currentIndex = index
              root.setAndClose()
            }
          }

          Behavior on implicitWidth {
            NumberAnimation { duration: 200; easing.type: Easing.OutCubic }
          }
          Behavior on implicitHeight {
            NumberAnimation { duration: 200; easing.type: Easing.OutCubic }
          }
        }
      }
    }
  }

  Item {
    anchors.fill: parent
    focus: true
    Keys.onLeftPressed: {
      if (root.currentIndex > 0) root.currentIndex--
    }
    Keys.onRightPressed: {
      if (root.currentIndex < root.count - 1) root.currentIndex++
    }
    Keys.onReturnPressed: root.setAndClose()
    Keys.onEnterPressed: root.setAndClose()
    Keys.onEscapePressed: root.close()
  }

  function showPicker(screen) {
    var s = screen || (Quickshell.screens.length > 0 ? Quickshell.screens[0] : null)
    if (s) {
      root.screen = s
    }
    currentIndex = Math.max(0, Math.min(currentIndex, count - 1))
    visible = true
    requestActivate()
  }

  function setAndClose() {
    var list = Wallpapers.list
    if (count > 0 && currentIndex >= 0 && currentIndex < list.length) {
      Wallpapers.setWallpaper(list[currentIndex].path)
    }
    close()
  }

  function close() {
    visible = false
  }
}
