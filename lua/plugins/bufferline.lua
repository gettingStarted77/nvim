return {
    "akinsho/bufferline.nvim",
    version = "v3.*",
    opts = {
        options = {
            mode = "buffers", -- set to "tabs" to only show tabpages instead
            separator_style = "slant",
            numbers = function(opts)
                return string.format('%s·%s', opts.id, opts.raise(opts.ordinal))
            end,
            hover = {
                enabled = true,
                delay = 200,
                reveal = { 'close' }
            },
            indicator = {
                icon = '▎', -- this should be omitted if indicator style is not 'icon'
                style = 'underline',
            },
            buffer_close_icon = '',
            modified_icon = '●',
            close_icon = '',
            left_trunc_marker = '',
            right_trunc_marker = '',
        },
    },
    dependencies = "nvim-tree/nvim-web-devicons",
}
