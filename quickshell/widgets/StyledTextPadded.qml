import QtQuick
import "./../config"

StyledText {
    id: styledTextPadded
    property alias text: styledTextPadded.text
    leftPadding: Appearance.defaults.hPadding
    rightPadding: Appearance.defaults.hPadding
    topPadding: Appearance.defaults.vPadding
    bottomPadding: Appearance.defaults.vPadding
    color: Appearance.defaults.color.text
    font.family: Appearance.defaults.fontFamily
    font.pointSize: Appearance.defaults.fontSize
}
