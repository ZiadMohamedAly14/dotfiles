# dotfiles

GNU Stow packages for **Omarchy 4**. The declarative half of a pair with
**[omarchy-supplement](https://github.com/ZiadMohamedAly14/omarchy-supplement)**, which
installs things and deploys this repo.

Rule: **a file that lives in `$HOME` → here. Anything that changes system state →
omarchy-supplement.** No install scripts in this repo.

## Stow mechanics

Each top-level directory is a package; its interior mirrors `$HOME`:

```
~/dotfiles/hypr/.config/hypr/bindings.lua
          └──┘ └─────────────────────────┘
        package    path relative to $HOME

stow hypr  →  ~/.config/hypr/bindings.lua → ~/dotfiles/hypr/.config/hypr/bindings.lua
```

Two consequences:

- **The clone must be at `~/dotfiles`** — Stow resolves targets relative to the package's
  parent directory.
- **Stow will not overwrite a regular file.** `install-dotfiles.sh` moves conflicts to
  `~/.dotfiles-backup-<timestamp>/` first.

Deployed paths are symlinks into this repo, so editing the live file edits the repo file.
No sync step; commit from `~/dotfiles`.

## Packages

| Package | Deploys | Notes |
|---|---|---|
| `bash` | `~/.bashrc` | Omarchy's bootstrap block **must stay first and unmodified** |
| `hypr` | `~/.config/hypr/*.lua` | Five override files only — not the loader |

**A package deploys only if its name is in the `PACKAGES` array in omarchy-supplement's
`install-dotfiles.sh`.** Creating a directory here does nothing on its own.

## Omarchy 4 specifics

### Hyprland is Lua

Omarchy ships five user-owned override files in `~/.config/hypr/`, `require`d *after* its
own defaults. That is the whole override mechanism — no config patching, no source lines.

```
hyprland.lua     loader, Omarchy's       ← NOT tracked here, deliberately
bindings.lua     monitors.lua
input.lua        looknfeel.lua           ← all tracked
autostart.lua
```

`hyprland.lua` stays untracked so Omarchy can change the loader between versions. If a
future version adds a new override file, add it here and it will just work.

API — `o.*` are Omarchy helpers, `hl.*` is Hyprland:

```lua
o.bind("SUPER + E", "Editor", { launch = "code" })   -- { launch = } wraps with uwsm-app
hl.unbind("SUPER + F")
hl.config({ input = { kb_options = "ctrl:nocaps" } })
hl.monitor({ output = "DP-2", mode = "2560x1440@144", position = "0x0", scale = 1 })
o.window("qemu", { workspace = "5" })
o.launch_on_start("my-service")
```

**Rules:**

- **Always `hl.unbind()` before rebinding.** Hyprland *stacks* bindings — rebinding a bound
  key leaves two actions on one press. Check with `omarchy menu keybindings --print`, and
  tell the user what the key was previously bound to.
- **Validate every change:** `hyprctl reload && hyprctl configerrors`. Repeat until clean.
- **Never trust remembered window-rule syntax** — it changes between Hyprland versions.
  Fetch https://wiki.hypr.land/Configuring/Basics/Window-Rules/ first, and prefer
  `o.window()`. Examples in `/usr/share/omarchy/default/hypr/windows.lua`.
- Hyphenated Hyprland keys need bracket syntax in Lua: `["tap-to-click"] = false`, since
  bare `tap-to-click` parses as subtraction.

Authoritative reference ships with the system:
`/usr/share/omarchy/default/agents/skills/omarchy/hyprland.md`. Read it before Hyprland
work.

### `.bashrc`

The first three blocks are Omarchy's bootstrap — `env-bootstrap` (sets `OMARCHY_PATH`), the
non-interactive guard, and `source "$OMARCHY_PATH/default/bash/rc"`. **Do not reorder,
edit, or remove them.** Personal config goes below.

Check what Omarchy already defines before adding an alias:
`ls /usr/share/omarchy/default/bash/`

### Careful: `omarchy refresh` writes through symlinks

`omarchy refresh hyprland` and `omarchy reinstall configs` do `cp -f` onto
`~/.config/hypr/*.lua`. If the path is a Stow symlink, the copy writes **through** it into
this repo, replacing your file with Omarchy's default.

Only explicit commands trigger it, never a plain `omarchy update`, and `git diff` shows
exactly what changed — but if a config suddenly reverts, this is why. Recover with
`git checkout`.

## Development happens on Windows

Repo lives at `D:\Repos\my-omarchy-setup\dotfiles`; everything targets Arch. Nothing here
is testable locally — no `hyprctl`, no `stow`. Read and reason instead of running.
