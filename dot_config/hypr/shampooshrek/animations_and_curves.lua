local window_speed = 5

------------------------
---- DEFAULT CURVES ----
------------------------
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })

hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 238.1191, dampening = 24.21279333 })


-----------------
---- BORDERS ----
-----------------
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })


-----------------
---- WINDOWS ----
-----------------
hl.curve("winM", { type = "bezier", points = { { 0.35, 0.9 }, { 0.2, 1.1 } } })

hl.animation({ leaf = "windows", enabled = true, speed = window_speed, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = window_speed, bezier = "winM", style = "slide" })

hl.animation({ leaf = "windowsOut", enabled = true, speed = window_speed, bezier = "winM", style = "slide" })

hl.animation({ leaf = "windowsMove", enabled = true, speed = window_speed, bezier = "winM", style = "slide" })


---------------
---- FADES ----
---------------
hl.animation({ leaf = "fade", enabled = true, speed = window_speed, bezier = "default" })
-- hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
-- hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
-- hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
-- hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })

----------------
---- LAYERS ----
----------------
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })

--------------------
---- WORKSPACES ----
--------------------
hl.curve("wind", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "wind", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 5, bezier = "wind", style = "fade" })

----------------
---- OTHERS ----
----------------
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })
hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
