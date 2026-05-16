pragma Singleton
import QtQuick 2.15
import "./../widgets"

QtObject {
    property PopOutWindow currentPopOut: null

    function show(popOutItem) {
        if (currentPopOut && currentPopOut !== popOutItem) {
            currentPopOut.forceHide();
        }
        currentPopOut = popOutItem;
        currentPopOut.show();
    }

    function hide(popOutItem) {
        if (currentPopOut === popOutItem) {
            currentPopOut.forceHide();
            currentPopOut = null;
        }
    }

    function hideCurrent() {
        if (currentPopOut) {
            currentPopOut.forceHide();
            currentPopOut = null;
        }
    }
}
