local keymap = vim.keymap.set

-- Diagnostics
keymap('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end)
keymap('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end)
keymap('n', '<leader>d', vim.diagnostic.setloclist)
keymap('n', '<leader>D', vim.diagnostic.setqflist)

-- To run when an LSP connects to a specific buffer
local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr }

  -- Keymaps for LSP actions
  keymap('n', 'K', vim.lsp.buf.hover, opts)
  keymap('n', 'gD', vim.lsp.buf.declaration, opts)
  keymap('n', 'gd', vim.lsp.buf.definition, opts)
  keymap('n', 'gi', vim.lsp.buf.implementation, opts)
  keymap('n', 'gr', vim.lsp.buf.references, opts)
  keymap('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  keymap('n', '<leader>rn', vim.lsp.buf.rename, opts)
  keymap('n', '<leader>ca', vim.lsp.buf.code_action, opts)

  -- Format File (FF)
  vim.api.nvim_buf_create_user_command(bufnr, 'FF', function()
    vim.lsp.buf.format { async = true }
  end, { desc = 'Format current buffer with LSP' })
end

vim.lsp.config('*', {
  on_attach = on_attach
})

-- Define the servers you have installed via your global Home Manager LSP module
local servers = { 'lua_ls', 'gopls', 'yamlls' }

-- Activate them sequentially
for _, lsp in ipairs(servers) do
  vim.lsp.enable(lsp)
end
