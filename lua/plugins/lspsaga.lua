local saga = require('lspsaga')
saga.init_lsp_saga()

-- Async LSP finder
map('n', 'gh', ':Lspsaga lsp_finder<CR>', false, true, true)

-- Code action
map('n', '<leader>ca', ':Lspsaga code_action<CR>', false, true, true)
map('v', '<leader>ca', ':Lspsaga range_code_action', false, true, true)

-- Hover documentation
map('n', 'K', ':Lspsaga hover_doc<CR>', false, true, true)

-- LSPSaga window scroll (hover docs, signature help)
map('n', '<C-f>', '<cmd>lua require"lspsaga.action".smart_scroll_with_saga(1)<CR>', false, true, true)
map('n', '<C-b>', '<cmd>lua require"lspsaga.action".smart_scroll_with_saga(-1)<CR>', false, true, true)

-- SignatureHelp
map('n', 'gs', ':Lspsaga signature_help<CR>', false, true, true)

-- Rename
map('n', 'gr', ':Lspsaga rename<CR>', false, true, true)

-- Preview definition
map('n', 'gd', ':Lspsaga preview_definition<CR>', false, true, true)

-- Show diagnostic
map('n', '<leader>cd', '<cmd>lua require"lspsaga.diagnostic".show_line_diagnostics()<CR>', false, true, true)

-- Show diagnostic only if cursor is over the area
map('n', '<leader>cc', '<cmd>lua require"lspsaga.diagnostic".show_cursor_diagnostics()<CR>', false, true, true)

-- Jump diagnostic
map('n', '[e', '<cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_prev()<CR>', false, true, true)
map('n', ']e', '<cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_next()<CR>', false, true, true)

-- Float terminal
map('n', '<A-d>', '<cmd>lua require"lspsaga.floaterm".open_floating_terminal()<CR>', false, true, true)
map('t', '<A-d>', '<C-\\><C-n>lua require"lspsaga.floaterm".open_floating_terminal()<CR>', false, true, true)

