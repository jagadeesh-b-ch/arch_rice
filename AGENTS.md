# Dotfiles Config (Git repo at `~/.config`)

Git-tracked: `alacritty`, `ghostty`, `hypr`, `nvim`, `quickshell`, `rofi`, `theme`, `wal`, `waybar`, `wlogout`.

**Git tracking**: `.gitignore` uses `/*` (deny-all) + per-dir `!dir/ !dir/**` allowlist. New config dirs must be added to `.gitignore` to be tracked. No CI, no pre-commit, no build.

## Active vs legacy
- **Active**: `quickshell/` (top bar), `hypr/` (WM), `nvim/` (editor)
- **Legacy**: `waybar/` — `exec-once waybar` is absent from both `hyprland.lua` and `hyprland.conf`. Edit `quickshell/` instead.

## Hyprland
Hyprland prefers `.lua` when both exist. For keybind changes, edit `hyprland.lua`; update `hyprland.conf` only if deploying to machines without Lua support.

## Multi-machine
`arch_rice/` exists on disk but is **git-ignored** (not in the allowlist). It holds per-machine overrides. No root edits sync there.

## Theme pipeline
`wal` → `~/.cache/wal/color*.rasi` → `theme/wal-theme.css` (imported by waybar, wlogout) and `rofi/` (imports `../../.cache/wal/color4.rasi` directly). Quickshell has its own `Appearance.qml` singleton.

## Key commands (no build — all interpreted)
| Command | Role |
|---|---|
| `quickshell` | Top bar (restart process to reload) |
| `Hyprland` | WM (auto-loads config) |
| `nvim` | LazyVim editor |
| `rofi -show drun` | App launcher |
| `wlogout` | Power/logout menu |

## Neovim (LazyVim)
- Custom plugins: `nvim/lua/plugins/*.lua` (code-companion, copilot, kiddos-gemini, lsp, snacks)
- AI API key: `pass show ai/opencode`
- LSP: `lsp.lua` adds `qmlls` (`/lib/qt6/bin/qmlls`) + hyprland stubs (`hl` global) for `lua_ls`
- Formatter: stylua, config in `nvim/stylua.toml`

## External deps
ghostty, networkmanager, bluez, pavucontrol, brightnessctl, power-profiles-daemon, ddcutil, hyprland, quickshell, qmlls, yazi, btop. Fonts: 0xProto Nerd, Material Symbols Variable.

## Quickshell detail
See `quickshell/AGENTS.md`.
