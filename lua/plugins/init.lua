-- Install packer.nvim if not currently installed
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

cmd('packadd packer.nvim')
cmd('autocmd BufWritePost **/plugins/*.lua source <afile> | PackerCompile')

-- Load plugins with packer.nvim
local packer = require('packer')

packer.startup(function(use)

        -- Let packer.nvim handle itself
        use { 'wbthomason/packer.nvim' }

        -- Status line - Airline
        use {
                'vim-airline/vim-airline',
                config = function()
                        require('plugins.airline')
                end
        }

        --        -- Status line - Lualine
        --        use {
        --                'hoob3rt/lualine.nvim',
        --                requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        --                config = function ()
        --                        require('plugins.lualine')
        --                end
        --        }
        --
        --        -- Color scheme - Tokyonight
        --        use {
        --                'folke/tokyonight.nvim',
        --                after = 'lualine.nvim',
        --                config = function()
        --                      require('plugins.tokyonight')
        --                end
        --        }

        -- Color scheme - Gruvbox
        use {
                'gruvbox-community/gruvbox',
                after = 'vim-airline',
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
        -- * Load config for both after installing both
        use { 'neovim/nvim-lspconfig' }

        use {
                'kabouzeid/nvim-lspinstall',
                config = function()
                        require('plugins.lsp')
                end
        }

        -- UI for LSP - LSPSaga
        use {
                'glepnir/lspsaga.nvim',
                config = function ()
                        require('plugins.lspsaga')
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
        use {
                'mbbill/undotree',
                config = function()
                        require('plugins.undotree')
                end
        }

        -- Markdown preview - Markdown-Preview
        use {
                'iamcco/markdown-preview.nvim',
                run = 'cd app && yarn install',
                opt = true
        }

        -- List keybindings - Vim-Which-Key
        use {
                'folke/which-key.nvim',
                config = function()
                        require('plugins.which-key')
                end
        }

        -- Scratch buffer - Scratch
        use {
                'mtth/scratch.vim',
                config = function()
                        require('plugins.scratch')
                end
        }

end)

