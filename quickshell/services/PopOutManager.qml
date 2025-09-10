pragma Singleton
import QtQuick 2.15

QtObject {
    property var currentPopOut: null

    function show(popOutItem) {
        if (currentPopOut && currentPopOut !== popOutItem) {
            currentPopOut.visible = false
        }
        currentPopOut = popOutItem
        currentPopOut.visible = true
    }

    function hide(popOutItem) {
        if (currentPopOut === popOutItem) {
            currentPopOut.visible = false
            currentPopOut = null
        }
    }
}
