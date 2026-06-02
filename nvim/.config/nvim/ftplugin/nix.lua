local opt = vim.opt_local

opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- -- Pressing <leader>b will evaluate the current Nix file
-- vim.keymap.set('n', '<leader>b', '<cmd>!nix-instantiate --eval %<CR>', {
--     buffer = true,
--     desc = "Evaluate current Nix file"
-- })
