-- Mason UI settings
local mason_opts = {
    ui = {
        border = "rounded",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
}

-- Return a table of lsp plugins for lazy.nvim
-- Plugins setup order: 1.Mason;2.Mason-lspconfig;3.Sett up the plugins via lspconfig.
return {
    -- 1.Mason
    {
        "williamboman/mason.nvim",
        config = true,
        opts = mason_opts,
    },
    -- 2.Mason-lspconfig
    {
        "williamboman/mason-lspconfig.nvim",
        opts = { ensure_installed = { "lua_ls", "rust_analyzer" } },
        dependencies = "williamboman/mason.nvim",
    },
    -- 3.Lspconfig
    {
        "neovim/nvim-lspconfig",
        ft = { ".lua", ".rs" },
        event = "BufReadPre",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            -- Genernal setting
            require("plugins.lsp.setting")

            -- LSp config via nvimplspconfig
            local lspconfig = require('lspconfig')
            local lsp_defaults = lspconfig.util.default_config

            lsp_defaults.capabilities = vim.tbl_deep_extend(
                'force',
                lsp_defaults.capabilities,
                require('cmp_nvim_lsp').default_capabilities()
            )

            require("lspconfig").lua_ls.setup({
                settings = {
                    Lua = {
                        runtime = {
                            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = { 'vim' },
                        },
                        -- Do not send telemetry data containing a randomized but unique identifier
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })

            require("plugins.lsp.cmp")
        end,
    },
}
