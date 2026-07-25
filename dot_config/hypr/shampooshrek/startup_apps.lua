-------------------
---- AUTOSTART ----
-------------------

local home = os.getenv("HOME")
local scriptsDir = home .. "/.config/hypr/scripts"
local lock = scriptsDir .. "/LockScreen.sh"

hl.on("hyprland.start", function()
  -- Wallpaper
  hl.exec_cmd("swww-daemon --format xrgb")
  hl.exec_cmd("eww daemon")
  hl.exec_cmd("udiskie --tray")
  -- hl.exec_cmd(swwwRandom .. " " .. wallDir)

  -- Environment
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

  -- Startup terminal
  hl.exec_cmd("kitty --class music --title ncspot -e tmux new-session -A -s ncspot ncspot")

  -- Polkit
  hl.exec_cmd(lock) -- Troque por scriptsDir .. "/Polkit.sh" se necessário
  -- hl.exec_cmd(scriptsDir .. "/Polkit.sh")

  -- Applications
  hl.exec_cmd("waybar")
  hl.exec_cmd("nm-applet --indicator")
  hl.exec_cmd("swaync")
  hl.exec_cmd("ncspot")
  hl.exec_cmd("thunderbird")
  hl.exec_cmd(
    [[mpvpaper -o "loop no-audio vf=colorlevels=rimax=1:gimax=1:bimax=1:romax=0.85:gomax=0.85:bomax=0.85" '*' ~/Pictures/wallpapers/firewatch-rainy-day-moewalls-com.mp4]])
  hl.exec_cmd("openrgb --profile RED")

  -- Clipboard manager
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")

  -- Idle
  hl.exec_cmd("hypridle")

  -- Pyprland
  hl.exec_cmd("pypr")

  -- Cursor
  hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme BreezeX-RosePine-Linux")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size 28")
end)
