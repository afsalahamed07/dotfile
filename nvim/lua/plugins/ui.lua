return {
    {
        "akinsho/bufferline.nvim",
        enabled = false,
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            picker = {
                sources = {
                    explorer = {
                        layout = {
                            auto_hide = { "input" },
                        },
                    },
                },
            },
        },
    },

    {
        "nvim-lualine/lualine.nvim",
        opts = function(_, opts)
            opts.options = opts.options or {}
            opts.options.section_separators = { left = "", right = "" }
            opts.options.component_separators = { left = "", right = "" }
            opts.sections = opts.sections or {}
            opts.sections.lualine_a = vim.list_extend({ { "", padding = { left = 0, right = 0 } } }, opts.sections.lualine_a or {})
            opts.sections.lualine_z = vim.list_extend(opts.sections.lualine_z or {}, { { "", padding = { left = 0, right = 0 } } })
        end,
    },

    {
        "MeanderingProgrammer/render-markdown.nvim",
        enabled = true,
        opts = {
            code = {
                disable_background = true,
                highlight_border = false,
                highlight_inline = "Normal",
            },
            bullet = {
                right_pad = 1,
            },
        },
    },
}
