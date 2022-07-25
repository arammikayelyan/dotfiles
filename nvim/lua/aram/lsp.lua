require('lspconfig')
local lsp_installer = require("nvim-lsp-installer")

-- The required servers
local servers = {
  "bashls",
  "html",
  "emmet_ls",
  "gopls",
  "tsserver",
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. name)
    server:install()
  end
end
