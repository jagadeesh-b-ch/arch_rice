import QtQuick 2.15
import QtQuick.Layouts
import "./../../config"
import "./../../widgets"

StyledView {
    RowLayout {

        id: connectivity
        spacing: 0
        WifiControl {}
        BluetoothControl {}
    }
}
