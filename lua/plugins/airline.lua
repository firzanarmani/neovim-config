set_gvar({
    airline_powerline_fonts = 1,

    ['airline#extensions#tabline#enabled'] = 1,
    ['airline#extensions#tabline#left_sep'] = ' ',
    ['airline#extensions#tabline#left_alt_sep'] = '|',
    ['airline#extensions#tabline#formatter'] = 'unique_tail_improved',

    ['airline#extensions#nvimlsp#enabled'] = 1,
    ['airline#extensions#nvimlsp#error_symbol'] = 'E:',
    ['airline#extensions#nvimlsp#warning_symbol'] = 'W:',
})

-- Remove the maxlinenr icon in airline since nerdfont's kinda weird?
-- At the moment, only the maxlinenr icon is messing up the status line
-- https://github.com/vim-airline/vim-airline/issues/1154
if not get_gvar('airline_symbols') then
    set_gvar({
        airline_symbols = {}
    })
end

-- Workaround for updating keys in a variable's dictionary
local tmp = get_gvar('airline_symbols')
tmp.maxlinenr = ''

set_gvar({
    airline_symbols = tmp
})

