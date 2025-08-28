import QtQuick 2.15
import QtQuick.Layouts
import "./../../widgets"
import "./../../config"

StyledView {
    RowLayout {
        spacing: 0
        PowerProfile {}
        BatteryControl {}
        PowerControl {}
    }
}
