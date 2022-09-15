return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"
    
    -- colorscheme
    use "tyrannicaltoucan/vim-deep-space"

    -- save as root
    use "lambdalisue/suda.vim"

    -- treesitter - syntax hl, ast manipulation
    use { "nvim-treesitter/nvim-treesitter" }

    -- statusline & icons
    use {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("config.lualine").setup()
        end,
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }
end)
