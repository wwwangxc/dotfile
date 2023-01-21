local util = require "lspconfig/util"

return {
  cmd = { "gopls", "serve" },
  filetypes = { "go", "gomod" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      ["local"] = GoModelName(),
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      usePlaceholders = false,
    },
  },
}
