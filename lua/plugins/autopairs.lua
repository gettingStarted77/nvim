return {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = function()
        -- add pair <> in *.rs
        local npairs = require('nvim-autopairs')
        local Rule = require("nvim-autopairs.rule")
        npairs.setup {}
        npairs.remove_rule("<")
        npairs.add_rule(Rule("<", ">"))
    end,
}
