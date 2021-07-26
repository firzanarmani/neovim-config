local compe = require('compe')

local setup_maps, settings, t, check_back_space

--[[
    + ------------------------------ +
    |        Helper functions        |
    + ------------------------------ +
]]

t = function(str)
    return replace_termcodes(str, true, true, true)
end

check_back_space = function()
    local col = fn.col('.') - 1
    if col == 0 or fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
    if fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return fn['compe#complete']()
    end
end

_G.s_tab_complete = function()
    if fn.pumvisible() == 1 then
        return t "<C-p>"
    else
        return t "<S-Tab>"
    end
end


--[[
    + ------------------------------ +
    |           Mappings             |
    + ------------------------------ +
]]

setup_maps = function()
    map("i", "<Tab>", "v:lua.tab_complete()", true, false, false)
    map("s", "<Tab>", "v:lua.tab_complete()", true, false, false)
    map("i", "<S-Tab>", "v:lua.s_tab_complete()", true, false, false)
    map("s", "<S-Tab>", "v:lua.s_tab_complete()", true, false, false)

    -- Will need to change if using autopairs
    map("i", "<C-Space>", "compe#complete()", true, true, true)
    map("i", "<CR>", "compe#confirm('<CR>')", true, true, true)
    map("i", "<C-e>", "compe#close('<C-e>')", true, true, true)
    map("i", "<C-f>", "compe#scroll({ 'delta': +4 })", true, true, true)
    map("i", "<C-d>", "compe#scroll({ 'delta': -4 })", true, true, true)
end


--[[
    + ------------------------------ +
    |           Settings             |
    + ------------------------------ +
]]

settings = {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = {
        border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
        winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
        max_width = 120,
        min_width = 60,
        max_height = math.floor(get_o('lines') * 0.3),
        min_height = 1,
    };

    source = {
        path = true;
        buffer = true;
        calc = true;
        nvim_lsp = true;
        nvim_lua = true;
        vsnip = false;
        ultisnips = false;
        luasnip = false;
    };
}


--[[
    + ------------------------------ +
    |          Load config           |
    + ------------------------------ +
]]

compe.setup(settings)
setup_maps()