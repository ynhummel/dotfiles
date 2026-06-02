local opt = vim.opt_local

opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true

-- comments in JSX/TSX use {/* */} syntax
opt.commentstring = "{/* %s */}"

-- Set up makeprg to run your build/test script?
opt.makeprg = "npm run build"
