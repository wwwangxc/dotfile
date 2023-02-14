vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _go
    autocmd!
    autocmd FileType go setlocal tabstop=8
    autocmd FileType go setlocal shiftwidth=8
    autocmd BufWritePre *.go lua go_org_imports()
  augroup end

  augroup _yaml
    autocmd!
    autocmd FileType yaml setlocal tabstop=2
    autocmd FileType yaml setlocal shiftwidth=2
  augroup end

  augroup _json
    autocmd!
    autocmd FileType json setlocal tabstop=2
    autocmd FileType json setlocal shiftwidth=2
    autocmd FileType json setlocal foldlevel=99
  augroup end

  augroup _lua
    autocmd!
    autocmd BufWritePre *.lua lua vim.lsp.buf.formatting()
  augroup end

  augroup _python
    autocmd!
    autocmd BufWritePre *.py lua vim.lsp.buf.formatting()
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end
]]

--  augroup _git
--    autocmd!
--    autocmd FileType gitcommit setlocal wrap
--    autocmd FileType gitcommit setlocal spell
--  augroup end
--
--autocmd BufWritePre *.lua lua vim.lsp.buf.format { async = true }
