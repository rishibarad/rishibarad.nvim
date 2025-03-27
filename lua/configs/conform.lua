-- https://github.com/stevearc/conform.nvim
-- Setting up formatting and linting: https://www.youtube.com/watch?v=ybUE4D80XSk

return {
  "stevearc/conform.nvim",
  -- lazy load plugin until below events trigger it
  event = {
    "BufReadPre", -- triggered when opening existing file
    "BufNewFile", -- triggered when opening a new file
  },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        typescript =  { "prettier" },
        javascript = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" }, -- conform will do isort first (organizing imports) and then execute black after
        scala = { "scalafmt" },
      },
      format_on_save = {
        lsp_fallback = true, -- if formatter isn't available for filetype, it'll try to fallback to an lsp-provided one
        async = false, -- recommended by docs. formatting shouldnt be async.
        timeout_ms = 500, -- because its not async, we need a timeout
      }
    })

    -- Set:
    --    "n" -> normal mode
    --    "v" -> visual mode
    -- Keybinding:
    --    "<leader>mp" -> "i.e. make pretty"
    vim.keymap.set({ "n", "v" }, "<leader>mp", function ()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, { desc = "Format file (normal mode) or range (visual mode)"})
  end,
}

