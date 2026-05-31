return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "f3fora/cmp-spell" },
        opts = function(_, opts)
            local cmp = require("cmp")

            opts.mapping["<CR>"] = cmp.mapping(function(fallback)
                fallback()
            end, { "i", "s" })

            opts.mapping["<S-CR>"] = cmp.mapping(function(fallback)
                fallback()
            end, { "i", "s" })

            opts.sources = cmp.config.sources(opts.sources, {
                { name = "spell" },
            })
        end,
    },
}
