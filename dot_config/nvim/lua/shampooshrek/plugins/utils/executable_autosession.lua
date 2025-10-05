return {
  'rmagatti/auto-session',
  opts = {
    suppressed_dirs = { '~/', '~/Downloads', '/' },
    pre_restore_cmds = { "doautocmd BufReadPre" }
  }
}
