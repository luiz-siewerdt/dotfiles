-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")

require("shampooshrek.monitors")
require("shampooshrek.keybinds")
require("shampooshrek.permissions")
require("shampooshrek.environment")
require("shampooshrek.layout")
require("shampooshrek.devices")
require("shampooshrek.startup_apps")
require("shampooshrek.animations_and_curves")
require("shampooshrek.settings")

require("shampooshrek.rules.window")
require("shampooshrek.rules.layers")
