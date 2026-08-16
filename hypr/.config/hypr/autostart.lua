-- Processes to start with the session. Started under uwsm, so they're cleaned
-- up properly on logout.

-- o.launch_on_start("nextcloud --background")
-- o.launch_on_start("syncthing serve --no-browser")

-- For things that should run on system events rather than session start
-- (post-boot, post-update, theme-set, battery-low), use an Omarchy hook
-- instead:  ~/.config/omarchy/hooks/<event>.d/
