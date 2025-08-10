import QtQuick
import "./../config"

Text {
    id: styledText
    property alias text: styledText.text
    property alias leftPadding: styledText.leftPadding
    property alias rightPadding: styledText.rightPadding
    property alias topPadding: styledText.topPadding
    property alias bottomPadding: styledText.bottomPadding
    color: Appearance.defaults.color.text
    font.family: Appearance.defaults.fontFamily
    font.pointSize: Appearance.defaults.fontSize
}
