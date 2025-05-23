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

return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        keys = {
          {
            action = ":lua LazyVim.pick()()",
            desc = " Find File",
            icon = " ",
            key = "f",
          },
          {
            action = ':lua LazyVim.pick("oldfiles")()',
            desc = " Recent Files",
            icon = " ",
            key = "r",
          },
          {
            action = ':lua LazyVim.pick("live_grep")()',
            desc = " Find Text",
            icon = " ",
            key = "g",
          },
          {
            action = ":Telescope projects",
            desc = " Projects",
            icon = " ",
            key = "p",
          },
          {
            action = ":lua Shampoo.config_files()",
            desc = " Config",
            icon = " ",
            key = "c",
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
        header = logo,
      },
    },
  },
}
