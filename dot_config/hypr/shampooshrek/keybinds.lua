---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "kitty"
local menu        = "rofi -show drun"
local window      = "rofi -show window"
local browser     = "firefox"
local yazi        = "yazi"
local pypr        = "pypr toggle"

local home        = os.getenv("HOME")

-----------------
---- SCRIPTS ----
-----------------
local scriptsDir  = home .. "/.config/hypr/scripts"
local UserScripts = home .. "/.config/hypr/UserScripts"

---------------------
---- KEYBINDINGS ----
---------------------
local mainMod     = "SUPER" -- Sets "Windows" key as main modifier

--#region APPLICATIONS

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())

hl.bind(mainMod .. " + E",
  hl.dsp.exec_cmd("foot -e " .. yazi))

hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))

hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(pypr .. " music"))

hl.bind(mainMod .. " + code:67", hl.dsp.exec_cmd(pypr .. " up-term"))
hl.bind(mainMod .. " + code:68", hl.dsp.exec_cmd(pypr .. " drop-term"))
hl.bind(mainMod .. " + code:69", hl.dsp.exec_cmd(pypr .. " whatsapp"))
hl.bind(mainMod .. " + code:70", hl.dsp.exec_cmd(pypr .. " discord"))
hl.bind(mainMod .. " + code:96", hl.dsp.exec_cmd(pypr .. " steam"))

hl.bind(mainMod .. " + N",
  hl.dsp.exec_cmd("swaync-client -t -sw"))

--#endregion

--#region LAYOUT
hl.bind(mainMod .. " + P",
  hl.dsp.window.pseudo())

hl.bind(mainMod .. " + S",
  hl.dsp.layout("togglesplit"))

hl.bind(mainMod .. " + F",
  hl.dsp.window.fullscreen())

hl.bind(mainMod .. " + SHIFT + F",
  hl.dsp.window.float({ action = "toggle" }))

hl.bind(mainMod .. " + ALT + F",
  hl.dsp.exec_cmd("hyprctl dispatch workspaceopt allfloat"))

--#endregion

--#region SCRIPTS

hl.bind(mainMod .. " + SHIFT + C",
  hl.dsp.exec_cmd(scriptsDir .. "/KillActiveProcess.sh"))

hl.bind(mainMod .. " + ALT + R",
  hl.dsp.exec_cmd(scriptsDir .. "/Refresh.sh"))

hl.bind(mainMod .. " + SHIFT + G",
  hl.dsp.exec_cmd(scriptsDir .. "/GameMode.sh"))

hl.bind(mainMod .. " + ALT + V",
  hl.dsp.exec_cmd(scriptsDir .. "/ClipManager.sh"))

hl.bind(mainMod .. " + SHIFT + N",
  hl.dsp.exec_cmd("swaync-client -t -sw"))

--#endregion

--#region WALLPAPERS

hl.bind(mainMod .. " + W",
  hl.dsp.exec_cmd(window))

hl.bind(mainMod .. " + SHIFT + W",
  hl.dsp.exec_cmd(UserScripts .. "/WallpaperSelect.sh"))

hl.bind(mainMod .. " + ALT + W",
  hl.dsp.exec_cmd(UserScripts .. "/WallpaperEffects.sh"))

hl.bind("CTRL + ALT + W",
  hl.dsp.exec_cmd(UserScripts .. "/WallpaperRandom.sh"))

--#endregion

--#region WAYBAR

hl.bind(mainMod .. " + CTRL + B",
  hl.dsp.exec_cmd(scriptsDir .. "/WaybarStyles.sh"))

hl.bind(mainMod .. " + ALT + B",
  hl.dsp.exec_cmd(scriptsDir .. "/WaybarLayout.sh"))

--#endregion

--#region MASTER LAYOUT

hl.bind(mainMod .. " + CTRL + D",
  hl.dsp.layout("removemaster"))

hl.bind(mainMod .. " + M",
  hl.dsp.exec_cmd("hyprctl dispatch splitratio 0.3"))

--#endregion

--#region FOCUS

hl.bind(mainMod .. " + L",
  hl.dsp.focus({ direction = "r" }))

hl.bind(mainMod .. " + H",
  hl.dsp.focus({ direction = "l" }))

hl.bind(mainMod .. " + K",
  hl.dsp.focus({ direction = "up" }))

hl.bind(mainMod .. " + J",
  hl.dsp.focus({ direction = "down" }))


hl.bind(mainMod .. " + SHIFT + L",
  hl.dsp.window.move({ direction = "r" }))

hl.bind(mainMod .. " + SHIFT + H",
  hl.dsp.window.move({ direction = "l" }))

hl.bind(mainMod .. " + SHIFT + K",
  hl.dsp.window.move({ direction = "u" }))

hl.bind(mainMod .. " + SHIFT + J",
  hl.dsp.window.move({ direction = "d" }))

--#endregion

--#region WORKSPACES

---------------------
---- WORKSPACES -----
---------------------

-- Switch workspaces with mainMod + [0-9]
-- Move active window with mainMod + SHIFT + [0-9]

for i = 1, 10 do
  local key = i % 10 -- workspace 10 uses key 0

  hl.bind(
    mainMod .. " + " .. key,
    hl.dsp.focus({ workspace = i })
  )

  hl.bind(
    mainMod .. " + SHIFT + " .. key,
    hl.dsp.window.move({ workspace = i })
  )
end


-- Move active window relative workspaces

hl.bind(
  mainMod .. " + SHIFT + bracketleft",
  hl.dsp.window.move({ workspace = -1 })
)

hl.bind(
  mainMod .. " + SHIFT + bracketright",
  hl.dsp.window.move({ workspace = 1 })
)


-- Special workspace dropdown

hl.bind(
  mainMod .. " + backslash",
  hl.dsp.workspace.toggle_special({ workspace = "dropdwon" })
)

-------------------------------
-- SILENT MOVE WORKSPACES --
-------------------------------

for i = 1, 10 do
  local key = i % 10

  hl.bind(
    mainMod .. " + CTRL + " .. key,
    hl.dsp.window.move({
      workspace = i,
      silent = true
    })
  )
end


hl.bind(
  mainMod .. " + CTRL + bracketleft",
  hl.dsp.window.move({
    workspace = -1,
    silent = true
  })
)

hl.bind(
  mainMod .. " + CTRL + bracketright",
  hl.dsp.window.move({
    workspace = 1,
    silent = true
  })
)

--#endregion

-- Example special workspace (scratchpad)
-- hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
-- hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
-- hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
-- hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
-- hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
-- hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
-- hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
--   { locked = true, repeating = true })
-- hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
--   { locked = true, repeating = true })
-- hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
--   { locked = true, repeating = true })
-- hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
--   { locked = true, repeating = true })
-- hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
-- hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })
--
-- Requires playerctl
-- hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
-- hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
-- hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
-- hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

---------------------
---- MOUSE BINDS ----
---------------------
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })


-------------------------
---- SPECIAL KEYS -------
-------------------------

-- Volume up
hl.bind(
  "XF86AudioRaiseVolume",
  hl.dsp.exec_cmd(
    scriptsDir .. "/Volume.sh --inc"
  ),
  {
    locked = true,
    repeating = true
  }
)

-- Volume down
hl.bind(
  "XF86AudioLowerVolume",
  hl.dsp.exec_cmd(
    scriptsDir .. "/Volume.sh --dec"
  ),
  {
    locked = true,
    repeating = true
  }
)

-- Toggle microphone mute
hl.bind(
  "XF86AudioMicMute",
  hl.dsp.exec_cmd(
    scriptsDir .. "/Volume.sh --toggle-mic"
  ),
  {
    locked = true
  }
)

-- Toggle audio mute
hl.bind(
  "XF86AudioMute",
  hl.dsp.exec_cmd(
    scriptsDir .. "/Volume.sh --toggle"
  ),
  {
    locked = true
  }
)

-- Sleep button
hl.bind(
  "XF86Sleep",
  hl.dsp.exec_cmd(
    "systemctl suspend"
  ),
  {
    locked = true
  }
)

-- Airplane mode / RFKill
hl.bind(
  "XF86RFKill",
  hl.dsp.exec_cmd(
    scriptsDir .. "/AirplaneMode.sh"
  ),
  {
    locked = true
  }
)
