hl.layer_rule({
  name = "linux-wallpaper-engine-layer",
  match = { namespace = "linux-wallpaperengine" },
  order = 1, -- push it further back
  blur = true
})
hl.layer_rule({
  name = "waybar-layer",
  match = { namespace = "[Ww]aybar" },
  order = 0, -- pull it further forward
  blur = true
})
