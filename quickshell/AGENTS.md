# Quickshell Config — Hyprland Top Bar

## Entry point
- `shell.qml` — root `Scope` that instantiates `TopBar`
- Quickshell auto-loads this config from `~/.config/quickshell/`
- Run: `quickshell` (or `quickshell --config <name>` for named configs)

## Directory layout
| Path | Purpose |
|---|---|
| `shell.qml` | Entry point |
| `modules/` | UI modules (`TopBar`, `LeftModules`, `RightModules`, sub-widgets) |
| `widgets/` | Reusable QML components (`InteractiveView`, `StyledText`, `StyledWindow`, `MaterialIcon`, etc.) |
| `services/` | `pragma Singleton` singletons for system data (Audio, Bluetooth, Brightness, Hyprland, Network, Resources, Time, Wallpapers, PopOutManager) |
| `config/` | `Appearance.qml` (global theme singleton), `StyledFontMetric.qml` |
| `utils/` | `Paths.qml`, `Icons.qml` |

## Key conventions
- **`InteractiveView`** is the primary clickable card wrapper. Children go into its `content` property.
- **`StyledWindow`** extends Quickshell's `PanelWindow` with WlrLayershell. Use for top-level shell surfaces.
- **`MaterialIcon`** extends `StyledText` with the Material Symbols font. Icon name = `text` property (e.g. `"memory"`).
- All services use `pragma Singleton`. Import them as `import "./../services"` and reference by filename (e.g. `Resources.cpuUsage`).

## Gotchas
- **`StyledFontMetric` is NOT a `pragma Singleton`** — you cannot call `widthForCharacters()` directly on it like a static method. Use a `Row` layout instead of fixed width calculations for text+icon pairs.
- No build/lint/test step — Quickshell interprets QML directly. Reload by restarting quickshell.
- `flake.nix` exists for optional home-manager integration but this setup runs without Nix.

## External dependencies
- **Hyprland** — required for `Hyprland.dispatch()`, workspaces, clients
- **Pipewire** — audio sink/source via `Quickshell.Services.Pipewire`
- **nmcli** — network scanning (polls every 3s)
- **btop** — launched on resource widget click
- **CPU temp** — `services/Resources.qml` uses a 5-level fallback chain: `thermal_zone*` (CPU/Package type) → any `thermal_zone` → `hwmon temp*_input` → any `hwmon` → `sensors -j` (lm-sensors)
