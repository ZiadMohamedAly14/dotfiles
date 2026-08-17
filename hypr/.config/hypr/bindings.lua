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

-- hl.unbind("SUPER + T")
hl.unbind("SUPER + F")
hl.unbind("SUPER + TAB")
hl.unbind("SUPER + SHIFT + TAB")
hl.unbind("SUPER + Right")
hl.unbind("SUPER + Left")
hl.unbind("SUPER + Up")
hl.unbind("SUPER + Down")
hl.unbind("ALT + TAB")
hl.unbind("SUPER + SHIFT + SPACE")

hl.unbind("ALT + SHIFT + TAB")
-- hl.unbind("SUPER + 1")
-- hl.unbind("SUPER + SHIFT + 1")

-- hl.bind("SUPER + 1", hl.dsp.window.move({ workspace = "1" }))

hl.bind("SUPER + RIGHT", hl.dsp.focus({ workspace = "+1" }), {description = "Next Workspace"})
hl.bind("SUPER + LEFT", hl.dsp.focus({ workspace = "-1" }), {description = "Previous Workspace"})

hl.bind("ALT + RIGHT", hl.dsp.focus({ direction = "r" }), {description = "Focus Right Window"})
hl.bind("ALT + LEFT", hl.dsp.focus({ direction = "l" }), {description = "Focus Left Window"})
hl.bind("ALT + UP", hl.dsp.focus({ direction = "u" }), {description = "Focus Up Window"})
hl.bind("ALT + DOWN", hl.dsp.focus({ direction = "d" }), {description = "Focus Down Window"})


for workspace = 1, 10 do
  local key = "code:" .. tostring(workspace + 9)

  -- Remove Omarchy's default: Super + number -> switch workspace
  hl.unbind("SUPER + " .. key)

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
