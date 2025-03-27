-- rishi note: not in use yet. I was setting this up but then realized nvchad has handling for a lot of lint/formatting.
-- look into this some more before configuring

return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function ()
    local lint = require("lint")

    lint.linters_by_ft = {
      typescript = { "eslint_d" },
      javascript = { "eslint_d" },
      python = { "pylint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({
      "BufEnter",
      "BufWritePost",
      "InsertLeave",
    }, {
      group = lint_augroup,
        callback = function ()
          lint.try_lint()
        end
      })

    vim.keymap.set("n", "<leader>l", function ()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
