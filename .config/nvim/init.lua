local modules = {
  -- core
  "core.options", -- Neovim 配置
  "core.gui",
  "core.autocmds", -- 自动执行的命令
  "core.mappings", -- 快捷键

  -- customer
  "customer.plugins", -- 插件管理
  "customer.cmp", -- 自动完成
  "customer.lsp", -- Languase Server Protocol
  "customer.vim-go", -- Golang 语言支持
  "customer.colorscheme", -- 主题
  "customer.treesitter", -- 代码高亮
  "customer.telescope", -- 搜索
  "customer.gitsigns", -- Git
  "customer.lualine", -- 状态栏
  "customer.autopairs", -- 自动完成括号
  "customer.neo-tree", -- 目录树
  "customer.neotest", -- 测试用例
}

for _, module in ipairs(modules) do
  local ok, err = pcall(require, module)

  if not ok then
    error("Error loading " .. module .. "\n\n" .. err)
  end
end
