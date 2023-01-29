local lualine_options = {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = {},
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { { 'mode', separator = { left = '' }, right_padding = 0, left_padding = 0 } },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
            {
                -- Lsp server name .
                function()
                    local msg = 'No Active Lsp'
                    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                    local clients = vim.lsp.get_active_clients()
                    if next(clients) == nil then
                        return msg
                    end
                    for _, client in ipairs(clients) do
                        local filetypes = client.config.filetypes
                        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                            return client.name
                        end
                    end
                    return msg
                end,
                color = { fg = '#98be65', gui = 'bold' },
            },
        },
        lualine_x = { { 'filetype', icon_only = true }, 'encoding' },
        lualine_y = { 'progress' },
        lualine_z = { { 'location', separator = { right = '' }, right_padding = 0, left_padding = 0 }, }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = { 'encoding' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
}

return {
    "nvim-lualine/lualine.nvim",
    opts = lualine_options,
    dependencies = "nvim-tree/nvim-web-devicons",
}
