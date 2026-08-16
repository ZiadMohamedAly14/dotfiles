# dotfiles

Config files for [Omarchy 4](https://omarchy.org), managed with GNU Stow.

Deployed by **[omarchy-supplement](https://github.com/ZiadMohamedAly14/omarchy-supplement)** —
this repo doesn't install itself.

## Layout

Each top-level directory is a Stow package whose interior mirrors `$HOME`:

```
bash/.bashrc                        → ~/.bashrc
hypr/.config/hypr/bindings.lua      → ~/.config/hypr/bindings.lua
```

## Packages

| Package | Contents |
|---|---|
| `bash` | `.bashrc` — Omarchy's bootstrap block plus personal aliases, exports, functions |
| `hypr` | The five Hyprland override files: `bindings` `monitors` `input` `looknfeel` `autostart` |

`~/.config/hypr/hyprland.lua` is deliberately **not** tracked — it's Omarchy's loader, and
pinning a stale copy would break future versions.

## Usage

Deploy is handled by `install-dotfiles.sh` in omarchy-supplement. Manually:

```bash
cd ~/dotfiles
stow bash hypr
```

Deployed paths are **symlinks into this repo**, so editing the live file edits the repo
file. There's no copy-back step — just commit from `~/dotfiles`.

## Adding a package

1. Create `<name>/` here with the full `$HOME`-relative path inside
2. Add `<name>` to the `PACKAGES` array in omarchy-supplement's `install-dotfiles.sh`

Both steps, or it never deploys.

## Hyprland

Config is **Lua** in Omarchy 4. These files load after Omarchy's defaults, so they win.

```lua
o.bind("SUPER + E", "Editor", { launch = "code" })
hl.unbind("SUPER + F")        -- always unbind before rebinding
```

Bindings **stack** rather than replace — rebinding a bound key gives you two actions on one
press. Check first with `omarchy menu keybindings --print`.

After any change: `hyprctl reload && hyprctl configerrors`.

## Other things worth capturing later

Not tracked yet, but all live in `~/.config` and are stow-able:

| Path | Controls |
|---|---|
| `~/.config/omarchy/shell.json` | Bar position, widgets, screensaver, idle timings |
| `~/.config/omarchy/extensions/omarchy-menu.jsonc` | Custom entries in the `SUPER+SPACE` menu |
| `~/.config/omarchy/hooks/<event>.d/` | Scripts on post-boot, post-update, theme-set, battery-low |
| `~/.config/alacritty/` `~/.config/foot/` | Terminal |
| `~/.XCompose` | Emoji and autocomplete shortcuts |

See `/usr/share/omarchy/manual/31-dotfiles.md`.
