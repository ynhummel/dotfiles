local keymap = vim.keymap.set

local MiniDiff = require('mini.diff')
local MiniPick = require('mini.pick')

require('mini.pairs').setup({})

require('mini.surround').setup({})

require('mini.completion').setup({})

require('mini.icons').setup({
  style = 'ascii'
})

----------
-- DIFF --
----------
MiniDiff.setup({})

keymap('n', '<leader>gt', function() MiniDiff.toggle_overlay() end, { desc = "Find files including hidden" })

----------
-- PICK --
----------
MiniPick.setup({})

MiniPick.registry.files_hidden = function()
  local command = { 'rg', '--files', '--hidden', '--glob', '!.git/', '--glob', '!node_modules/', '--no-follow',
    '--color=never' }

  local show_with_icons = function(buf_id, items, query)
    return MiniPick.default_show(buf_id, items, query, { show_icons = true })
  end

  return MiniPick.builtin.cli(
    { command = command },
    { source = { name = 'Files (With Hidden)', show = show_with_icons, preview = MiniPick.default_preview, } }
  )
end

keymap('n', '<leader>b', MiniPick.builtin.buffers, { desc = "Open buffers" })
keymap('n', '<leader>/', MiniPick.builtin.grep_live, { desc = "Live grep" })
keymap('n', '<leader>f', function() MiniPick.registry.files_hidden() end, { desc = "Find files including hidden" })
