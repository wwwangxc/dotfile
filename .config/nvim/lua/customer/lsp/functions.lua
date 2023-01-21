function go_org_imports(wait_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = { only = { "source.organizeImports" } }
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
  for cid, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
        vim.lsp.util.apply_workspace_edit(r.edit, enc)
      end
    end
  end
end

function FileExist(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

function GoModelName()
  if not FileExist("go.mod") then return nil end
  for line in io.lines("go.mod") do
    if vim.startswith(line, "module") then
      local items = vim.split(line, " ")
      local module_name = vim.trim(items[2])
      return module_name
    end
  end
  return nil
end
