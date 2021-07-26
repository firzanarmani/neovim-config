-- Set global-scoped options
set_go({
    --[[
        + ------------------------------ +
        |             Core               |
        + ------------------------------ +
    ]]

    -- Make a backup before overwriting the file
    backup = false,

    -- When opening another file, if the current buffer is unsaved, 
    -- this unsaved buffer is hidden, instead of (trying to) close it
    hidden = true,


    --[[
        + ------------------------------ +
        |             UI/UX              |
        + ------------------------------ +
    ]]

    -- Use block cursor instead of line cursor
    guicursor = '',

    -- Turn off bell sound during error
    errorbells = false,

    -- Hide the --INSERT-- and --VISUAL-- messages when switching into those modes
    showmode = false,


    --[[
        + ------------------------------ +
        |             Editor             |
        + ------------------------------ +
    ]]

    -- Keep search item highlighted on select
    hlsearch = false,

    -- Enable incremental search
    incsearch = true,

    -- Number of lines to keep above or below cursor before scrolling
    scrolloff = 8,

    -- Set number of whitespaces for each level of indentation
    -- Using '>>' and '<<' increases and decreases the line's level of indentation
    shiftwidth = 4,

    -- Insert mode options required for compe (autocompletion)
    completeopt = 'menuone,noinsert,noselect',

    -- Set directory for undo files
    undodir = std_path('config') .. '/undodir',

    -- Enable undo file
    undofile = true

})

-- Set window-scoped options
set_wo(0, {
    --[[
        + ------------------------------ +
        |             UI/UX              |
        + ------------------------------ +
    ]]

    -- Show line numbers
    number = true,

    -- Show line numbers relative to current line
    relativenumber = true,

    -- Show fixed column for error and warning signs
    signcolumn = 'yes',

    -- Show a colored line at specified position to indicate line limit at 80 chars
    colorcolumn = '80',


    --[[
        + ------------------------------ +
        |             Editor             |
        + ------------------------------ +
    ]]

    -- Wrap line
    wrap = false,
    
})

-- Set buffer-scoped options
set_bo(0, {
    --[[
        + ------------------------------ +
        |             Core               |
        + ------------------------------ +
    ]]

    -- Use swapfile for the current buffer
    swapfile = false,


    --[[
        + ------------------------------ +
        |      Editor (Indentation)      |
        + ------------------------------ +

        Example:
        - tabstop = 5
        - softtabstop = 3

        1. Hitting tab will give you 3 columns of whitespace.
        2. Hitting tab again will change your total to 6 columns of whitespace.
           - There are now enough columns of whitespace to fit a `\t` (equal to tabstop setting).

        If noexpandtab, as is default, then vim will fill up the 6 columns of whitespace with 1 \t character and 1 space.
        If expandtab is set, then vim will fill up the 6 columns of whitespace with 6 spaces.

        For better understanding (and more examples), read:
        https://arisweedler.medium.com/tab-settings-in-vim-1ea0863c5990
    ]]

    -- Expand a hard tab to spaces
    expandtab = true,

    -- Set number of whitespaces when pressing the 'tab' key
    tabstop = 2,

    -- Set number of whitespaces to add or remove when pressing 'tab' or 'backspace'
    -- When set, tabstop follows softtabstop on keypresses
    softtabstop = 2,

    -- Enable smart indenting when creating a new line
    smartindent = true,

})
