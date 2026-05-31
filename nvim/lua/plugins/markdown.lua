return {
    {
        "mfussenegger/nvim-lint",
        opts = {
            linters = {
                ["markdownlint-cli2"] = {
                    args = { "--config", vim.fn.expand("~/.markdownlint.json"), "-" },
                },
            },
        },
    },
    {
        "stevearc/conform.nvim",
        optional = true,
        opts = {
            formatters = {
                ["markdownlint-cli2"] = {
                    args = { "--config", vim.fn.expand("~/.markdownlint.json"), "--fix", "$FILENAME" },
                },
            },
        },
    },
}
