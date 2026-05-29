return {
    {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            local cmp = require("cmp")

            opts.mapping["<CR>"] = cmp.mapping(function(fallback)
                fallback()
            end, { "i", "s" })

            opts.mapping["<S-CR>"] = cmp.mapping(function(fallback)
                fallback()
            end, { "i", "s" })
        end,
    },
}
