set_gvar({
    airline_powerline_fonts = 1
})

-- Initially thought this was a problem, but fixed with :PackerCompile
-- -- Remove the maxlinenr icon in airline since nerdfont's aren't compatible
-- -- At the moment, only the maxlinenr icon is messing up the status line
-- -- https://github.com/vim-airline/vim-airline/issues/1154
-- if not get_gvar('airline_symbols') then
--     set_gvar({
--         airline_symbols = {}
--     })
-- end

-- -- Workaround for updating keys in a variable's dictionary
-- local tmp = get_gvar('airline_symbols')
-- tmp.maxlinenr = ''

-- set_gvar({
--     airline_symbols = tmp
-- })