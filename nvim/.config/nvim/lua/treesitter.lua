-- Start Tree-sitter and its features whenever you open a file.
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('TreesitterSetup', { clear = true }),
  callback = function()
    -- pcall prevents errors if a parser is missing. 
    -- 'ok' will be true if vim.treesitter.start succeeds.
    local ok = pcall(vim.treesitter.start)

    if ok then
      -- Enable Treesitter-based folding
      -- vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      -- vim.wo[0][0].foldmethod = 'expr'

      -- Enable Treesitter-based indentation (experimental)
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
