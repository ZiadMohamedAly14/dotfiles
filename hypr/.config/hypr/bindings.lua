-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

-- default unbindings
hl.unbind("SUPER + F")
hl.unbind("SUPER + TAB")
hl.unbind("SUPER + SHIFT + TAB")
hl.unbind("SUPER + RIGHT")
hl.unbind("SUPER + LEFT")
hl.unbind("SUPER + UP")
hl.unbind("SUPER + DOWN")
hl.unbind("ALT + TAB")
hl.unbind("SUPER + SHIFT + SPACE")
hl.unbind("ALT + SHIFT + TAB")
hl.unbind("SUPER + S")
hl.unbind("PRINT")
hl.unbind("SUPER + CTRL + L")
hl.unbind("SUPER + CTRL + LEFT")  -- was: move grouped window focus left
hl.unbind("SUPER + CTRL + RIGHT") -- was: move grouped window focus right
hl.unbind("SUPER + SHIFT + T")    -- freeing it for the todoist plugin below
hl.unbind("SUPER + P")            -- freeing it for the prayer-times plugin below
-- hl.unbind("SUPER + ALT + MINUS")
-- hl.unbind("SUPER + CTRL + MINUS")
-- hl.unbind("SUPER + MINUS")
-- hl.unbind("SUPER + SHIFT + ALT + EQUAL")
-- hl.unbind("SUPER + SHIFT + CTRL + EQUAL")
-- hl.unbind("SUPER + SHIFT + EQUAL")


--Personal bindings
o.bind("SUPER + S", "Screenshot", "omarchy-capture-screenshot")
o.bind("SUPER + SHIFT + L", "Lock Screen", "omarchy-system-lock")

-- Plugins, installed by omarchy-supplement's install-plugins.sh.
--
-- VERIFY BOTH COMMANDS. Omarchy shell plugins are toggled by id, following the
-- pattern in the emoji example above:
--   omarchy-shell shell toggle omarchy.emojis
-- Third-party plugins register their own ids, which I have not confirmed — the
-- two below are the expected shape, not verified strings. Find the real ones:
--   omarchy plugin list
--   ls ~/.local/share/omarchy/plugins/ ~/.config/omarchy/plugins/ 2>/dev/null
o.bind("SUPER + SHIFT + T", "Todoist", "omarchy-shell shell toggle omarchy.todoist")
o.bind("SUPER + P", "Prayer times", "omarchy-shell shell toggle omarchy.quattro-prayer-times")

--Window resizing
hl.bind("SUPER + CTRL + LEFT",  hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { repeating = true, description = "Resize window left" })
hl.bind("SUPER + CTRL + RIGHT", hl.dsp.window.resize({ x = 30, y = 0, relative = true }),  { repeating = true, description = "Resize window right" })
hl.bind("SUPER + CTRL + UP",    hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true, description = "Resize window up" })
hl.bind("SUPER + CTRL + DOWN",  hl.dsp.window.resize({ x = 0, y = 30, relative = true }),  { repeating = true, description = "Resize window down" })
--Workspace movement
hl.bind("SUPER + RIGHT", hl.dsp.focus({ workspace = "+1" }), {description = "Next Workspace"})
hl.bind("SUPER + LEFT", hl.dsp.focus({ workspace = "-1" }), {description = "Previous Workspace"})

--Window focus
hl.bind("ALT + RIGHT", hl.dsp.focus({ direction = "r" }), {description = "Focus Right Window"})
hl.bind("ALT + LEFT", hl.dsp.focus({ direction = "l" }), {description = "Focus Left Window"})
hl.bind("ALT + UP", hl.dsp.focus({ direction = "u" }), {description = "Focus Up Window"})
hl.bind("ALT + DOWN", hl.dsp.focus({ direction = "d" }), {description = "Focus Down Window"})

--Window movement
for workspace = 1, 10 do
  local key = "code:" .. tostring(workspace + 9)

  -- Remove Omarchy's default: Super + number -> switch workspace
  hl.unbind("SUPER + " .. key)
  hl.unbind("SUPER + SHIFT + " .. key)

  -- Replace it with: Super + number -> move window
  o.bind(
    "SUPER + " .. key,
    "Move window to workspace " .. workspace,
    hl.dsp.window.move({
      workspace = tostring(workspace),
      follow = true
    })
  )
end
