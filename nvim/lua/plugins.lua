return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    -- colorscheme
    use("tyrannicaltoucan/vim-deep-space")

    -- save as root
    use("lambdalisue/suda.vim")

    -- treesitter - syntax hl, ast manipulation {{{
    use({
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("config.treesitter").setup()
        end,
        run = ":TSUpdate",
    })
    -- }}}

    -- statusline & icons {{{
    use({
        "nvim-lualine/lualine.nvim",
        config = function()
            require("config.lualine").setup()
        end,
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })
    -- }}}

    -- mini.nvim -- multiple text manipulation plugins {{{
    use({
        "echasnovski/mini.nvim",
        branch = "stable",
        config = function()
            require("config.mini.pairs").setup()
            require("config.mini.comment").setup()
            -- I currently decided to use nvim-surround
            -- but maybe I'll switch to this in near future
            -- require("config.mini.surround").setup()
        end,
    })
    -- }}}

    -- surround operator {{{
    use({
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({})
        end,
    })
    -- }}}

    -- tpope git, better netrw, better substitution {{{
    use("tpope/vim-fugitive")
    use("tpope/vim-vinegar")
    use("tpope/vim-abolish")
    -- }}}
end)
