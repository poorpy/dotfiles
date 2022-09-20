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

    -- LSP {{{
    use({
        "neovim/nvim-lspconfig",
        config = function()
            require("config.lspconfig")
        end,
        after = { "nvim-cmp" },
    })

    -- nicer diagnostics
    use({
        "folke/lsp-trouble.nvim",
        config = function()
            require("trouble").setup({ auto_preview = false, auto_fold = true, auto_close = true })
        end,
    })

    -- better lsp UI
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            local saga = require("lspsaga")

            saga.init_lsp_saga({
                code_action_lightbulb = {
                    enable = false,
                },
                max_preview_lines = 50,
            })
        end,
    })
    -- }}}

    -- Fuzzy filtering {{{
    use({
        "nvim-telescope/telescope.nvim",
        config = function()
            require("config.telescope").setup()
        end,
        requires = "nvim-lua/plenary.nvim",
    })

    use({ "nvim-telescope/telescope-file-browser.nvim" })

    use({ "nvim-telescope/telescope-live-grep-args.nvim" })

    -- FZF sorter for telescope
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        config = function()
            require("telescope").load_extension("fzf")
        end,
        requires = "nvim-telescope/telescope.nvim",
        run = "make",
    })
    -- }}}

    -- Go development {{{
    use({
        "ray-x/go.nvim",
        config = function()
            require("config.go").setup()
        end,
        ft = { "go", "gomod" },
    })
    -- }}}

    -- completion & snippets {{{
    use("onsails/lspkind-nvim")
    use({
        "L3MON4D3/LuaSnip",
        requires = "rafamadriz/friendly-snippets",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip.loaders.from_vscode").lazy_load({
                paths = { "$HOME/.vscode/extensions/amimaro.remix-run-snippets-1.1.0" },
            })
        end,
    })
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-calc")
    use("hrsh7th/cmp-emoji")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")
    use("hrsh7th/cmp-path")
    use("saadparwaiz1/cmp_luasnip")
    use({
        "hrsh7th/nvim-cmp",
        after = {
            "lspkind-nvim",
            "LuaSnip",
            "cmp_luasnip",
            "cmp-nvim-lua",
            "cmp-nvim-lsp",
            "cmp-buffer",
            "cmp-path",
            "cmp-calc",
            "cmp-emoji",
        },
        config = function()
            require("config.cmp").setup()
        end,
    })
    -- }}}
end)
