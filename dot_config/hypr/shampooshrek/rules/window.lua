--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.window_rule({
  name = "thunar-dialogs-center",
  match = {
    class = "^[Tt]hunar$",
    title = "^(File Operation Progress|Confirm to replace files)$",
  },
  center = true,
})


-------------------------
---- WORKSPACES RULES ---
-------------------------

hl.window_rule({
  name = "browser-workspace",
  match = {
    class = "^([Bb]rave-browser|[Ff]irefox)$",
  },
  workspace = "1 silent",
})

hl.window_rule({
  name = "insomnia-workspace",
  match = {
    title = "^[Ii]nsomnia$",
  },
  workspace = "3 silent",
})

hl.window_rule({
  name = "godot-workspace",
  match = {
    class = "^[Gg]odot$",
  },
  workspace = "3 silent",
  opacity = "1 1",
})

hl.window_rule({
  name = "thunderbird-workspace",
  match = {
    class = "^org.mozilla.Thunderbird$",
  },
  workspace = "7 silent",
})

hl.window_rule({
  name = "vesktop-workspace",
  match = {
    class = "^[Vv]esktop$",
  },
  workspace = "8 silent",
  no_blur = true,
  opacity = "1 1",
})

hl.window_rule({
  name = "music-workspace",
  match = {
    class = "^[Kk]itty$",
    title = "^(music|ncspot)$",
  },
  workspace = "9 silent",
})

hl.window_rule({
  name = "spotify-workspace",
  match = {
    class = "^[Ss]potify$",
  },
  workspace = "9 silent",
  opacity = "0.85 0.85",
})

hl.window_rule({
  name = "steam-workspace",
  match = {
    class = "^steam$",
  },
  workspace = "4 silent",
})

hl.window_rule({
  name = "ferdium",
  match = {
    class = "^[Ff]erdium$",
  },
  workspace = "10 silent",
  center = true,
  float = true,
  size = "60% 70%",
})


hl.window_rule({
  name = "dropterm-scratch",
  match = {
    class = "^(dropterm-top|dropterm|vesktop|com.rtosta.zapzap|steam|music)$",
  },
  float = true,
  pin = true,
  workspace = "special:scratch_term silent",
})

-----------------
---- FLOATING ---
-----------------
hl.window_rule({
  name = "calculator-floating",
  match = {
    class = "org.gnome.Calculator",
    title = "Calculator",
  },
  float = true,
})

hl.window_rule({
  name = "rofi-floating",
  match = {
    class = "^[Rr]ofi$",
  },
  float = true,
  opacity = "0.9 0.6",
})

hl.window_rule({
  name = "alacritty-floating",
  match = {
    class = "^[Aa]lacritty$",
  },
  float = true,
})

hl.window_rule({
  name = "eog-floating",
  match = {
    class = "^[Ee]og$",
  },
  float = true,
})

hl.window_rule({
  name = "audio-tools-floating",
  match = {
    class = "^(pavucontrol|org.pulseaudio.pavucontrol)$",
  },
  float = true,
  size = { "(monitor_w*0.3)", "(monitor_h*0.5)" }
})

hl.window_rule({
  name = "qt-tools-floating",
  match = {
    class = "^(nwg-look|qt5ct|qt6ct|mpv)$",
  },
  float = true,
})

hl.window_rule({
  name = "network-tools-floating",
  match = {
    class = "^(nm-applet|nm-connection-editor|blueman-manager)$",
  },
  float = true,
})

--------------------------------
------ OPACITY RULES -----------
--------------------------------

hl.window_rule({
  name = "browser-opacity",
  match = {
    class = "^([Bb]rave|[Ff]irefox)$",
  },
  opacity = "0.9 0.7",
})

hl.window_rule({
  name = "brave-full-opacity",
  match = {
    class = "^Brave-browser(-beta|-dev)?$",
  },
  opacity = "1 1",
})

hl.window_rule({
  name = "firefox-opacity",
  match = {
    class = "^([Ff]irefox|org.mozilla.firefox|[Ff]irefox-esr)$",
  },
  opacity = "0.9 0.7",
})

hl.window_rule({
  name = "guitarix",
  match = {
    class = "^[Gg]uitarix$",
  },
  opacity = "0.85 0.85",
  size = "58% 65%",
})

hl.window_rule({
  name = "qt-tools-opacity",
  match = {
    class = "^(nwg-look|qt5ct|qt6ct|yad)$",
  },
  opacity = "0.9 0.8",
})

hl.window_rule({
  name = "obs-opacity",
  match = {
    class = "^com.obsproject.Studio$",
  },
  opacity = "0.9 0.7",
})

-- hl.window_rule({
--   name = "discord-vesktop-opacity",
--   match = {
--     class = "^([Dd]iscord|[Vv]esktop)$",
--   },
--   opacity = "1 1",
-- })

--------------------------------
--------- NO BLUR --------------
--------------------------------

hl.window_rule({
  name = "firefox-no-blur",
  match = {
    class = "^[Ff]irefox$",
  },
  no_blur = true,
  opacity = "1 1",
})

hl.window_rule({
  name = "kitty-no-blur",
  match = {
    class = "^[Kk]itty$",
  },
  no_blur = true,
  opacity = "1 1",
})

--------------------------------
--------- SIZE RULES -----------
--------------------------------

hl.window_rule({
  name = "godot-tile",
  match = {
    class = "^[Gg]odot$",
    title = "^[Gg]odot$",
  },
  tile = true,
})

hl.window_rule({
  name = "godot-scene-size",
  match = {
    title = "^Open Scene$",
  },
  size = "3% 6%",
})

hl.window_rule({
  name = "system-monitor-size",
  match = {
    class = "^(gnome-system-monitor|org.gnome.SystemMonitor)$",
  },
  size = "70% 70%",
})

hl.window_rule({
  name = "portal-size",
  match = {
    class = "^xdg-desktop-portal-gtk$",
  },
  size = "70% 70%",
})

hl.window_rule({
  name = "kvantum-size",
  match = {
    title = "^Kvantum Manager$",
  },
  size = "60% 70%",
})

hl.window_rule({
  name = "qt6ct-size",
  match = {
    class = "^qt6ct$",
  },
  size = "60% 70%",
})

--------------------------------
-------- FULLSCREEN ------------
--------------------------------
hl.window_rule({
  name = "whatsdesk-fullscreen",
  match = {
    class = "^[Ww]hatsdesk$",
  },
  fullscreen = true,
})

--------------------------------
--------- PICTURE IN PICTURE ---
--------------------------------

-- Mesclado: pip-opacity + pip-pin + pip-floating + pip-size + pip-position (mesmo title)
hl.window_rule({
  name = "picture-in-picture",
  match = {
    title = "^Picture-in-Picture$",
  },
  opacity = "0.95 0.75",
  pin = true,
  float = true,
  size = "25% 25%",
  move = "72% 7%",
})

--------------------------------
------- KITTY DROPDOWN ---------
--------------------------------

-- Mesclado: kitty-dropdown-size + position + pin + workspace (mesmo class + title)
hl.window_rule({
  name = "kitty-dropdown",
  match = {
    class = "^kitty$",
    title = "^dropdown$",
  },
  size = "10% 10%",
  move = "0 0",
  pin = false,
  workspace = "special:dropdown",
})

hl.window_rule({
  match = { title = "^[Oo]verwatch$" },
  immediate = true,
})
