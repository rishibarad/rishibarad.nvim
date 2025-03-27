return {
  {
    "stevearc/conform.nvim",
    config = function ()
      require("configs.conform")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
        require("configs.lspconfig")
    end,
  },
  {
  -- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation#lazynvim
  	"nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "vim", "lua", "vimdoc", "html", "css" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
}
