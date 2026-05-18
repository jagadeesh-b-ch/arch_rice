pragma Singleton
pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Io
import QtQuick
import "./../utils"

Singleton {
    id: root

    readonly property Rounding rounding: Rounding {}
    readonly property Spacing spacing: Spacing {}
    readonly property Padding padding: Padding {}
    readonly property Anim anim: Anim {}
    readonly property FontFamily fontFamily: FontFamily {}
    readonly property FontSize fontSize: FontSize {}
    readonly property Defaults defaults: Defaults {}

    readonly property string colorsJsonPath: `${Paths.state}/wallpaper/colors.json`.slice(7)

    function loadColors(text) {
        try {
            var data = JSON.parse(text)
            if (!data || !data.colors) return
            root.defaults.color.apply(data.colors)
            updateHyprctlBorders(data.colors)
        } catch (e) {
            // JSON parse failed, will retry
        }
    }

    function updateHyprctlBorders(colors) {
        var active = colors.primary ? "rgba(" + colors.primary.replace("#", "") + "ee)" : ""
        var inactive = colors.surface_variant
            ? "rgba(" + colors.surface_variant.replace("#", "") + "aa)"
            : ""
        if (active)
            Quickshell.execDetached(["hyprctl", "keyword", "general:col.active_border", active])
        if (inactive)
            Quickshell.execDetached(["hyprctl", "keyword", "general:col.inactive_border", inactive])
    }

    FileView {
        id: colorsFile
        path: root.colorsJsonPath
        onLoaded: {
            var t = text().trim()
            if (t) root.loadColors(t)
        }
    }

    Timer {
        interval: 3000
        running: true
        repeat: true
        onTriggered: colorsFile.reload()
    }

    component Rounding: QtObject {
        readonly property int small: 12
        readonly property int normal: 17
        readonly property int large: 25
        readonly property int full: 1000
    }

    component Spacing: QtObject {
        readonly property int smallest: 4
        readonly property int small: 7
        readonly property int smaller: 10
        readonly property int normal: 12
        readonly property int larger: 15
        readonly property int large: 20
    }

    component Padding: QtObject {
        readonly property int smallest: 2
        readonly property int small: 4
        readonly property int smaller: 6
        readonly property int normal: 10
        readonly property int larger: 12
        readonly property int large: 15
    }

    component FontFamily: QtObject {
        readonly property string sans: "IBM Plex Sans"
        readonly property string mono: "JetBrains Mono NF"
        readonly property string material: "Material Symbols Rounded"
        readonly property string nerd: "Symbols Nerd Font Mono"
    }

    component FontSize: QtObject {
        readonly property int smallest: 8
        readonly property int small: 10
        readonly property int smaller: 12
        readonly property int normal: 13
        readonly property int larger: 15
        readonly property int large: 18
        readonly property int extraLarge: 28
    }

    component AnimCurves: QtObject {
        readonly property list<real> emphasized: [0.05, 0, 2 / 15, 0.06, 1 / 6, 0.4, 5 / 24, 0.82, 0.25, 1, 1, 1]
        readonly property list<real> emphasizedAccel: [0.3, 0, 0.8, 0.15, 1, 1]
        readonly property list<real> emphasizedDecel: [0.05, 0.7, 0.1, 1, 1, 1]
        readonly property list<real> standard: [0.2, 0, 0, 1, 1, 1]
        readonly property list<real> standardAccel: [0.3, 0, 1, 1, 1, 1]
        readonly property list<real> standardDecel: [0, 0, 0, 1, 1, 1]
        readonly property list<real> expressiveFastSpatial: [0.42, 1.67, 0.21, 0.9, 1, 1]
        readonly property list<real> expressiveDefaultSpatial: [0.38, 1.21, 0.22, 1, 1, 1]
        readonly property list<real> expressiveEffects: [0.34, 0.8, 0.34, 1, 1, 1]
    }

    component AnimDurations: QtObject {
        readonly property int small: 200
        readonly property int normal: 400
        readonly property int large: 600
        readonly property int extraLarge: 1000
        readonly property int expressiveFastSpatial: 350
        readonly property int expressiveDefaultSpatial: 500
        readonly property int expressiveEffects: 200
    }

    component Anim: QtObject {
        readonly property AnimCurves curves: AnimCurves {}
        readonly property AnimDurations durations: AnimDurations {}
    }

    component Defaults: QtObject {
        readonly property int hPadding: root.padding.normal
        readonly property int vPadding: root.padding.small
        readonly property Color color: Color {}
        readonly property int rounding: root.rounding.normal
        readonly property int spacing: root.spacing.small
        readonly property string fontFamily: root.fontFamily.mono
        readonly property int fontSize: root.fontSize.small
    }

    component Color: QtObject {
        property string primary: "#4CAF50"
        property string secondary: "#9DC183"
        property string text: "#2E2E2E"
        property string background: "#14140c"

        function apply(scheme) {
            if (scheme.primary)
                primary = scheme.primary;
            if (scheme.surface_container_highest)
                secondary = scheme.surface_container_highest;
            if (scheme.on_surface)
                text = scheme.on_surface;
            if (scheme.background)
                background = scheme.background;
        }
    }
}
