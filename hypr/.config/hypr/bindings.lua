-- Personal keybindings. Loaded after Omarchy's defaults, so these win.
--
-- List what's already bound:  omarchy menu keybindings --print
--
-- RULE: if a key is already bound by Omarchy, you MUST hl.unbind() it first.
-- Hyprland stacks bindings rather than replacing them, so binding an already
-- bound key leaves you with two actions firing on one press.

-- Add a new binding (key, description, command).
-- The description is what shows up in the keybindings menu.
-- o.bind("SUPER + SHIFT + R", "SSH home server", "alacritty -e ssh myserver")

-- Wrap GUI apps with { launch = ... } so they start under uwsm-app.
-- o.bind("SUPER + E", "Editor", { launch = "code" })

-- Replace an existing binding — unbind first.
-- hl.unbind("SUPER + F")                      -- was: fullscreen
-- o.bind("SUPER + F", "File manager", { launch = "nautilus" })

-- Remove a default without replacing it.
-- hl.unbind("SUPER + SHIFT + B")
