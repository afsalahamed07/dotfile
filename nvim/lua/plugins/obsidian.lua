return {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- use latest release, remove to use latest commit
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
        legacy_commands = false, -- this will be removed in 4.0.0
        workspaces = {
            {
                name = "personal",
                path = "~/Documents/Obsidian",
            },
        },
        -- Disable obsidian's built-in UI; render-markdown.nvim handles rendering.
        -- Avoids double-rendering and stops frontmatter `- ` lines being drawn as bullets.
        ui = { enable = false },
    },
}
