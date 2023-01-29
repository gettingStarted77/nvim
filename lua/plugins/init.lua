return {
    ---------- UI ----------
    -- Colorschemes
    -- the colorscheme should be available when starting Neovim
    {
        "folke/tokyonight.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight-moon]])
        end,
    },
    -- Cmp plugins
    {
        "hrsh7th/nvim-cmp",
        ft = { ".lua", ".rust" },
        lazy = true,
        config = true,
        dependencies = {
            -- Sources
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lua",
            -- Source but snippet Engine
            "L3MON4D3/LuaSnip",
        }
    },

    {
        "L3MON4D3/LuaSnip",
        event = "VeryLazy",
        dependencies = "rafamadriz/friendly-snippets", -- Snippets for LuaSnip
    },
    ---------- RUST ----------
    {
        "simrat39/rust-tools.nvim",
        ft = "rust",
        opts = {
            server = {
                on_attach = function(_, bufnr)
                    -- Hover actions
                    vim.keymap.set("n", "<C-space>", require("rust-tools").hover_actions.hover_actions,
                        { buffer = bufnr })
                    -- Code action groups
                    vim.keymap.set("n", "<Leader>a", require("rust-tools").code_action_group.code_action_group,
                        { buffer = bufnr })
                end,
            },
        },
        dependencies = "neovim/nvim-lspconfig",
    },

    {
        "rcarriga/nvim-dap-ui",
        dependencies = "mfussenegger/nvim-dap"
    },
}
