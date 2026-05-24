local function apply_hubbamax_highlights()
    vim.api.nvim_set_hl(0, "Cursor", { fg = "#1c1c1c", bg = "#dadada" })
    vim.api.nvim_set_hl(0, "CursorNormal", { fg = "#1c1c1c", bg = "#dadada" })
    vim.api.nvim_set_hl(0, "CursorVisual", { fg = "#1c1c1c", bg = "#87afaf" })
    vim.api.nvim_set_hl(0, "CursorInsert", { fg = "#1c1c1c", bg = "#5fafd7" })
    vim.api.nvim_set_hl(0, "CursorReplace", { fg = "#1c1c1c", bg = "#d75f87" })

    local variable = { fg = "#bcbcbc" }

    vim.api.nvim_set_hl(0, "@variable", variable)
    vim.api.nvim_set_hl(0, "@variable.go", variable)
    vim.api.nvim_set_hl(0, "@punctuation.bracket.go", variable)
    vim.api.nvim_set_hl(0, "@lsp.type.variable", variable)
    vim.api.nvim_set_hl(0, "@lsp.type.variable.go", variable)
    vim.api.nvim_set_hl(0, "@lsp.type.punctuation.bracket.go", variable)

    vim.api.nvim_set_hl(0, "@punctuation.bracket.python", variable)
end

local function current_theme()
    local path = vim.fn.expand("~/.config/theme/current")
    local lines = vim.fn.filereadable(path) == 1 and vim.fn.readfile(path) or {}
    local theme = lines[1] or "rose-pine"

    if theme == "hubbamax" then
        return "hubbamax"
    end

    return "rose-pine"
end

return {
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = current_theme(),
        },
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,
        opts = {
            variant = "main",
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

            if vim.g.colors_name == "hubbamax" then
                apply_hubbamax_highlights()
            end
        end,
    },
}
