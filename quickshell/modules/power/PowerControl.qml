pragma ComponentBehavior: Bound

import QtQuick 2.15
import Quickshell
import "./../../config"
import "./../../widgets"
import "./../../services"

Item {
    id: root
    width: powerControl.width
    height: powerControl.height

    InteractiveView {
        id: powerControl
        popoutManagerExempt: true

        MaterialIconPadded {
            text: "\uE8AC"
        }

        onHover: isHovered => {
            if (isHovered) {
                PopOutManager.show(powerPopout);
            } else {
                powerPopout.restartAutoHide();
            }
        }
    }

    PopOutWindow {
        id: powerPopout
        anchor.item: root
        hostWidth: powerControl.width
        hostHeight: powerControl.height

        implicitWidth: contentItem.implicitWidth
        implicitHeight: contentItem.implicitHeight

        Item {
            id: contentItem
            implicitWidth: optionsColumn.implicitWidth + 2 * Appearance.defaults.hPadding
            implicitHeight: optionsColumn.implicitHeight + 2 * Appearance.defaults.vPadding

            property int _hoverCount: 0

            TextMetrics {
                id: entryMetrics
            }

            property real _maxEntryWidth: 0

            Component.onCompleted: {
                var entries = [
                    {
                        icon: "lock",
                        text: "Lock"
                    },
                    {
                        icon: "logout",
                        text: "Log off"
                    },
                    {
                        icon: "nightlight",
                        text: "Suspend"
                    },
                    {
                        icon: "bedtime",
                        text: "Hibernate"
                    },
                    {
                        icon: "restart_alt",
                        text: "Restart"
                    },
                    {
                        icon: "power_off",
                        text: "Shutdown"
                    }
                ];
                var maxW = 0;
                for (var i = 0; i < entries.length; i++) {
                    entryMetrics.font.family = Appearance.defaults.fontFamily;
                    entryMetrics.font.pointSize = Appearance.defaults.fontSize;
                    entryMetrics.text = entries[i].text;
                    var textW = entryMetrics.width;
                    entryMetrics.font.family = Appearance.fontFamily.material;
                    entryMetrics.text = entries[i].icon;
                    var iconW = entryMetrics.width;
                    maxW = Math.max(maxW, iconW + Appearance.spacing.small + textW);
                }
                _maxEntryWidth = maxW + 2 * Appearance.defaults.hPadding;
            }

            Column {
                id: optionsColumn
                anchors.centerIn: parent
                spacing: Appearance.padding.smallest

                Repeater {
                    id: entriesRepeater
                    model: [
                        {
                            icon: "lock",
                            text: "Lock",
                            cmd: ["loginctl", "lock-session"]
                        },
                        {
                            icon: "logout",
                            text: "Log off",
                            cmd: ["loginctl", "terminate-user", "$USER"]
                        },
                        {
                            icon: "nightlight",
                            text: "Suspend",
                            cmd: ["systemctl", "suspend"]
                        },
                        {
                            icon: "bedtime",
                            text: "Hibernate",
                            cmd: ["systemctl", "hibernate"]
                        },
                        {
                            icon: "restart_alt",
                            text: "Restart",
                            cmd: ["systemctl", "reboot"]
                        },
                        {
                            icon: "power_off",
                            text: "Shutdown",
                            cmd: ["systemctl", "poweroff"]
                        }
                    ]

                    delegate: Rectangle {
                        required property var modelData
                        property bool _hovered: false
                        width: contentItem._maxEntryWidth > 0 ? contentItem._maxEntryWidth : optionRow.implicitWidth + 2 * Appearance.defaults.hPadding
                        height: optionRow.implicitHeight + 2 * Appearance.defaults.vPadding
                        radius: Appearance.defaults.rounding
                        color: _hovered ? Appearance.defaults.color.primary : "transparent"

                        Row {
                            id: optionRow
                            anchors.left: parent.left
                            anchors.leftMargin: Appearance.defaults.hPadding
                            anchors.verticalCenter: parent.verticalCenter
                            spacing: Appearance.spacing.small
                            MaterialIcon {
                                text: modelData.icon
                            }
                            StyledText {
                                text: modelData.text
                            }
                        }

                        MouseArea {
                            id: optionMouse
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                            onEntered: {
                                parent._hovered = true;
                                contentItem._hoverCount++;
                                powerPopout._contentHovered = true;
                            }
                            onExited: {
                                parent._hovered = false;
                                contentItem._hoverCount--;
                                if (contentItem._hoverCount <= 0)
                                    powerPopout._contentHovered = false;
                            }
                            onClicked: {
                                Quickshell.execDetached(modelData.cmd);
                                PopOutManager.hide(powerPopout);
                            }
                        }
                    }
                }
            }
        }
    }
}
