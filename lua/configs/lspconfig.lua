-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- This hooks up installed lsps to nvim. Note that this config does not handle the installation.
-- It assumes that language servers listed here are already installed.
-- Tools like mason provide a UI that helps manage installation as well.
-- IMPORTANT: scala "metals" lsp is installed an managed through separate nvim-metals plugin
local servers = {
  "html",
  "cssls",
  "pyright",
  "ts_ls",
}

local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
