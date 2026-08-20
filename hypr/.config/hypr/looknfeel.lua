-- Change the default Omarchy look'n'feel.

-- https://wiki.hypr.land/Configuring/Basics/Variables/#general
    hl.config({
        general = {
            -- No gaps between windows or borders.
            gaps_in = 0,
            gaps_out = 2,
            border_size = 1,
            ['col.active_border'] = 0xffe2e2e3,
            -- Change to niri-like side-scrolling layout.
            -- layout = "scrolling",
        },
    })

-- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
    hl.config({
        decoration = {
            -- Use round window corners.
            rounding = 10,

            active_opacity = 5,
            inactive_opacity = 1,
            fullscreen_opacity = 1,

            -- Dim unfocused windows (0.0 = no dim, 1.0 = fully dimmed).
            -- dim_inactive = true,
            -- dim_strength = 0.15,
            blur = {
                enabled = false,
            }
        },
    })

-- https://wiki.hypr.land/Configuring/Basics/Variables/#animations
-- hl.config({
--   animations = {
--     -- Disable all animations.
--     enabled = false,
--   },
-- })

-- https://wiki.hypr.land/Configuring/Basics/Variables/#layout
-- hl.config({
--   layout = {
--     -- Avoid overly wide single-window layouts on wide screens.
--     single_window_aspect_ratio = { 1, 1 },
--   },
-- })

-- https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/
-- hl.config({
--   scrolling = {
--     -- See only one column per screen instead of two.
--     column_width = 0.97,
--   },
-- })

hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("HYPRCURSOR_SIZE", "24")
