vim.cmd [[
  set guifont = "SauceCodePro Nerd Font:h13.5"
  let g:neovide_transparency = 0.0
  let g:transparency = 0.8
  let g:neovide_background_color = '#0f1117'.printf('%x', float2nr(255 * g:transparency))
]]
