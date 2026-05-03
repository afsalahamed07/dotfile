local function apply_hubbamax_highlights()
    local variable = { fg = "#bcbcbc" }

    vim.api.nvim_set_hl(0, "@variable", variable)
    vim.api.nvim_set_hl(0, "@variable.go", variable)
    vim.api.nvim_set_hl(0, "@punctuation.bracket.go", variable)
    vim.api.nvim_set_hl(0, "@lsp.type.variable", variable)
    vim.api.nvim_set_hl(0, "@lsp.type.variable.go", variable)
    vim.api.nvim_set_hl(0, "@lsp.type.punctuation.bracket.go", variable)

    vim.api.nvim_set_hl(0, "@punctuation.bracket.python", variable)
end

return {
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "hubbamax",
        },
    },
    {
        "alexpasmantier/hubbamax.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.api.nvim_create_autocmd("ColorScheme", {
                pattern = "hubbamax",
                callback = apply_hubbamax_highlights,
            })
        end,
    },
}
