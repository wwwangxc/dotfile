local neotest_status_ok, neotest = pcall(require, "neotest")
if not neotest_status_ok then
  return
end

--local gotest_status_ok, gotest = pcall(require, "neotest-go")
--if not gotest_status_ok then
--  return
--end

neotest.setup {
  icons = {
    --expanded = "",
    --child_prefix = "",
    --child_indent = "",
    --final_child_prefix = "",
    --non_collapsible = "",
    --collapsed = "",

    passed = "",
    running = "",
    failed = "",
    unknown = "",
  },
  adapters = {
    require("neotest-go")({
      experimental = {
        test_table = true,
      },
      args = { "-count=1", "-gcflags=-l", "-timeout=60s" }
    }),
  },
}
