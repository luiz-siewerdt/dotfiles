local logo = [[
 ███████╗██╗  ██╗ █████╗ ███╗   ███╗██████╗  ██████╗  ██████╗
  ██╔════╝██║  ██║██╔══██╗████╗ ████║██╔══██╗██╔═══██╗██╔═══██╗
  ███████╗███████║███████║██╔████╔██║██████╔╝██║   ██║██║   ██║
  ╚════██║██╔══██║██╔══██║██║╚██╔╝██║██╔═══╝ ██║   ██║██║   ██║
  ███████║██║  ██║██║  ██║██║ ╚═╝ ██║██║     ╚██████╔╝╚██████╔╝
 ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝      ╚═════╝  ╚═════╝

  ███████╗██╗  ██╗██████╗ ███████╗██╗  ██╗  
 ██╔════╝██║  ██║██╔══██╗██╔════╝██║ ██╔╝ 
███████╗███████║██████╔╝█████╗  █████╔╝ 
╚════██║██╔══██║██╔══██╗██╔══╝  ██╔═██╗ 
  ███████║██║  ██║██║  ██║███████╗██║  ██╗ 
  ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ 
]]
logo = string.rep("\n", 8) .. logo .. "\n\n"

return {
  "nvimdev/dashboard-nvim",
  opts = {
    config = {
      header = vim.split(logo, "\n"),
      center = {
        {
          action = "lua LazyVim.pick()()",
          desc = " Find File",
          icon = " ",
          key = "f",
        },
        {
          action = 'lua LazyVim.pick("oldfiles")()',
          desc = " Recent Files",
          icon = " ",
          key = "r",
        },
        {
          action = 'lua LazyVim.pick("live_grep")()',
          desc = " Find Text",
          icon = " ",
          key = "g",
        },
        {
          action = "Telescope projects",
          desc = " Projects",
          icon = " ",
          key = "p",
        },
        {
          action = "lua LazyVim.pick.config_files()()",
          desc = " Config",
          icon = " ",
          key = "c",
        },
        {
          action = "LazyExtras",
          desc = " Lazy Extras",
          icon = " ",
          key = "x",
        },
        {
          action = function()
            vim.api.nvim_input("<cmd>qa<cr>")
          end,
          desc = " Quit",
          icon = " ",
          key = "q",
        },
      },
    },
  },
  config = function(_, opts)
    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = " %s"
    end

    require("dashboard").setup(opts)
  end,
}
