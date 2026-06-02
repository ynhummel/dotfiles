require('nvim-treesitter.config').setup {
  auto_install = false,
  ensure_installed = {},

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true,
  },
}
