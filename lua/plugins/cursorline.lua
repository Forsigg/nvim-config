local cursor = require 'nvim-cursorline'

cursor.setup({
    cursorline = {
        enable = false,
        timeout = 1000,
        number = false,
    },
    cursorword = {
        enable = true,
        min_length = 3,
        hl = {underline = true},
    }
})
