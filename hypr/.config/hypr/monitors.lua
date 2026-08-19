-- Monitor layout, resolution, scaling.
-- List outputs and supported modes:  hyprctl monitors all
-- Docs: https://wiki.hypr.land/Configuring/Basics/Monitors/

local omarchy_gdk_scale = 1.5
local omarchy_monitor_scale = "auto"

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = omarchy_monitor_scale })

-- Pin a specific monitor.
-- hl.monitor({ output = "DP-2", mode = "2560x1440@144", position = "0x0", scale = 1 })

-- Rotated secondary monitor (transform: 1 = 90°, 3 = 270°).
-- hl.monitor({ output = "DP-2", mode = "preferred", position = "auto", scale = 1, transform = 1 })

-- Turn the laptop panel off when the lid closes.
-- hl.monitor({ output = "eDP-1", disabled = true })
