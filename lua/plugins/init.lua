-- Install packer.nvim if not currently installed
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

cmd('packadd packer.nvim')
cmd('autocmd BufWritePost plugins/init.lua | PackerCompile')

-- Load plugins with packer.nvim
local packer = require('packer')

return packer.startup(function(use)

    -- Let packer.nvim handle itself
    use { 'wbthomason/packer.nvim' }

    -- Status line - Airline
    use {
        'vim-airline/vim-airline',
        config = function()
            require('plugins.airline')
        end
    }

    -- Color scheme - Gruvbox
    use {
        'gruvbox-community/gruvbox',
        config = function()
            require('plugins.gruvbox')
        end
    }

    -- Syntax highlighting - Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Fuzzy finder - Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/popup.nvim' },
            { 'nvim-lua/plenary.nvim' }
        }
    }

    -- Neovim language server client configuration - LSPConfig
    -- Automatically install language servers - LSPInstall
    use {
        'neovim/nvim-lspconfig',
        'kabouzeid/nvim-lspinstall',
        config = function()
            require('plugins.lsp')
        end
    }

    -- Autocompletion - Compe
    use {
        'hrsh7th/nvim-compe',
        config = function()
            require('plugins.compe')
        end
    }

    -- Git - Fugitive
    use { 'tpope/vim-fugitive' }

    -- Undo tree - UndoTree
    use { 'mbbill/undotree' }

    -- Markdown preview - Markdown-Preview
    use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install'
    }

end)
