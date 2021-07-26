map = function(mode, keymap, command, is_expr, is_silent, is_noremap)
    vim.api.nvim_set_keymap(mode, keymap, command, {
        expr = is_expr or false,
        silent = is_silent or false,
        noremap = is_noremap or false,
    })
end

map_buf = function(buffnr, mode, keymap, command, is_expr, is_silent, is_noremap)
    vim.api.nvim_buf_set_keymap(buffnr, mode, keymap, command, {
        expr = is_expr or false,
        silent = is_silent or false,
        noremap = is_noremap or false,
    })
end
