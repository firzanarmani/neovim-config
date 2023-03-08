local lsp_config = require('lspconfig')
local lsp_install = require('lspinstall')

local setup_maps, on_attach, make_config, lua_settings, setup_servers

--[[
    + ------------------------------ +
    |        Helper functions        |
    + ------------------------------ +
]]

-- Create a config that activates keymaps and enables snippet support
make_config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    return {
        -- enable snippet support
        capabilities = capabilities,
        -- map buffer local keybindings when the language server attaches
        on_attach = on_attach,
    }
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    set_bo({ omnifunc = 'v:lua.vim.lsp.omnifunc' }, bufnr)
    setup_maps(client, bufnr)
end

setup_servers = function()
    lsp_install.setup()
    local servers = lsp_install.installed_servers()

    -- For manually adding servers
    -- table.insert(servers, "clangd")

    for _, server in pairs(servers) do
        local config = make_config()
        if server == 'lua' then
            config.settings = lua_settings
        end

        lsp_config[server].setup(config)
    end
end


--[[
    + ------------------------------ +
    |           Mappings             |
    + ------------------------------ +
]]

setup_maps = function(client, bufnr)
    map_buf(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', false, true, true)
    map_buf(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', false, true, true)
    map_buf(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', false, true, true)
    map_buf(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', false, true, true)
    map_buf(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', false, true, true)
    map_buf(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', false, true, true)
    map_buf(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', false, true, true)
    map_buf(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', false, true, true)
    map_buf(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', false, true, true)
    map_buf(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', false, true, true)
    map_buf(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', false, true, true)
    map_buf(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', false, true, true)
    map_buf(bufnr, 'n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', false, true, true)
    map_buf(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', false, true, true)
    map_buf(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', false, true, true)
    map_buf(bufnr, 'n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', false, true, true)
    if client.resolved_capabilities.document_formatting then
        map_buf(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", false, true, true)
    elseif client.resolved_capabilities.document_range_formatting then
        map_buf(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", false, true, true)
    end
end


--[[
    + ------------------------------ +
    |           Settings             |
    + ------------------------------ +
]]

lua_settings = {
    Lua = {
        runtime = {
            -- LuaJIT in the case of Neovim
            version = 'LuaJIT',
            path = vim.split(package.path, ';'),
        },
        diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
        },
        workspace = {
            -- Make the server aware of Neovim runtime files
            library = {
                [fn.expand('$VIMRUNTIME/lua')] = true,
                [fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
            },
        },
    }
}


--[[
    + ------------------------------ +
    |         Load config            |
    + ------------------------------ +
]]

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
lsp_install.post_install_hook = function ()
    setup_servers() -- reload installed servers
    cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
