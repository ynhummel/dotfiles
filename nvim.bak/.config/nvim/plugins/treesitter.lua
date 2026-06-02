vim.pack.add({ 
    {
        src = 'https://github.com/nvim-treesitter/nvim-treesitter',
        version = '4916d6592ede8c07973490d9322f187e07dfefac',
    },
})

-- Hook to package update, if treesiter is updated trigger TSUpdate
vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(event)
        local spec = event.data.spec or {}
        if spec.url:find('nvim-treesitter') then
            vim.cmd('TSUpdate')
        end
    end,
}) 
