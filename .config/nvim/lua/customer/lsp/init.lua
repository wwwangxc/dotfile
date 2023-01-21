local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "customer.lsp.lsp-installer"
require 'customer.lsp.functions'
--require "customer.lsp.null-ls"
require("customer.lsp.handlers").setup()
