local lspconfig = require('lspconfig')

local keymap = vim.keymap.set

-- Diagnostics
keymap('n', '[d', vim.diagnostic.goto_prev)
keymap('n', ']d', vim.diagnostic.goto_next)
keymap('n', '<leader>d', vim.diagnostic.setloclist)

-- This function runs when an LSP connects to a specific buffer
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
  keymap('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, opts)
end

-- Define the servers you have installed via your global Home Manager LSP module
local servers = { 'lua_ls' }

-- Activate them sequentially
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
  }
end
