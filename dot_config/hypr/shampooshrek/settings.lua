-----------------
---- DWINDLE ----
-----------------
hl.config({
  dwindle = {
    force_split = 2,
    split_width_multiplier = 2
  }
})

-----------------
---- GENERAL ----
-----------------
hl.config({
  general = {
    gaps_in          = 5,
    gaps_out         = 10,

    border_size      = 2,

    col              = {
      active_border   = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
      inactive_border = "rgba(595959aa)",
    },

    -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
    resize_on_border = true,

    -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
    allow_tearing    = true,

    layout           = "dwindle",
  },

})


------------------------------------
---- DECORATOINS AND ANIMATIONS ----
------------------------------------
hl.config({
  decoration = {
    rounding           = 10,

    fullscreen_opacity = 1,

    dim_inactive       = true,
    dim_strength       = 0.1,
    dim_special        = 0.8,

    -- Change transparency of focused and unfocused windows
    active_opacity     = 1.0,
    inactive_opacity   = 1.0,

    shadow             = {
      enabled      = true,
      range        = 4,
      render_power = 3,
      color        = 0xee1a1a1a,
    },

    blur               = {
      size = 6,
      passes = 2,
      ignore_opacity = true,
      new_optimizations = true,
      special = true,
    },
  },

  animations = {
    enabled = true,

  },
})


----------------
----  MISC  ----
----------------
hl.config({
  misc = {
    enable_swallow          = true,
    swallow_regex           = "^kitty",
    force_default_wallpaper = -1,   -- Set to 0 or 1 to disable the anime mascot wallpapers
    disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
    font_family             = "Liberation Sans",
    vrr                     = 2,    --only in full screen
  },
})


---------------
---- INPUT ----
---------------
hl.config({
  input = {
    kb_layout                   = "us",
    kb_variant                  = "altgr-intl",
    kb_model                    = "",
    kb_options                  = "",
    kb_rules                    = "",
    repeat_rate                 = 80,
    repeat_delay                = 300,
    numlock_by_default          = true,
    left_handed                 = false,
    float_switch_override_focus = false,
    sensitivity                 = -0.6,
    follow_mouse                = 1,

    touchpad                    = {
      natural_scroll = false,
      disable_while_typing = true,
      clickfinger_behavior = false,
      middle_button_emulation = true,
      tap_to_click = true,
      drag_lock = false,
    },
  },
})


---------------
---- BINDS ----
---------------
hl.config({
  binds = {
    workspace_back_and_forth = true,
    hide_special_on_workspace_change = true,
    movefocus_cycles_fullscreen = true,
  }
})


----------------
---- CURSOR ----
----------------
hl.config({
  cursor = {
    hide_on_key_press = true
  }
})

----------------
---- RENDER ----
----------------
hl.config({
  render = {
    direct_scanout = 1
  }
})
