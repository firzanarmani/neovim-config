local utils = require('utils')

-- Install packer.nvim if not currently installed
local install_path = utils.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if utils.fn.empty(utils.fn.glob(install_path)) > 0 then
    utils.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

utils.cmd('packadd packer.nvim')
utils.cmd('autocmd BufWritePost plugins.lua | PackerCompile')

-- Load plugins with packer.nvim
local packer = require('packer')
return packer.startup(function(use)

    -- Let packer.nvim handle itself
    use { 'wbthomason/packer.nvim' }

    -- Color scheme - Gruvbox
    use { 
        'gruvbox-community/gruvbox',
        config = function()
            require('config.colorscheme')
        end
    }

    -- Status line - Airline
    use { 
        'vim-airline/vim-airline',
        config = function()
            require('config.statusline')
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
            require('config.lsp')
        end
    }

    -- Autocompletion - Compe
    use { 
        'hrsh7th/nvim-compe',
        config = function()
            require('config.autocomplete')
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
