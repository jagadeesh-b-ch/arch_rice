import QtQuick 2.15
import "./../../config"
import "./../../widgets"
import "./../../services"

Row {
    id: root
    spacing: Appearance.defaults.spacing

    StyledText {
        textValue: `${Resources.cpuUsage}%`
    }

    StyledText {
        textValue: `${Resources.usedRam}G/${Resources.totalRam}G`
    }

    StyledText {
        textValue: `${Resources.cpuTemp}\u00B0C`
    }
}
