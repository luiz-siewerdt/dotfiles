return {
  'rmagatti/auto-session',
  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { '~/', '~/Downloads', '/' },
    pre_restore_cmds = { "doautocmd BufReadPre" }
    -- log_level = 'debug',
  }
}
