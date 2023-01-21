local toggleterm_status_ok, toggleterm = pcall(require, "toggleterm")
if not toggleterm_status_ok then
  return
end

toggleterm.setup {
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
    return 20
  end,
  on_open = function()
    vim.opt.cmdheight = 0
    vim.opt.laststatus = 0
  end,
  on_close = function()
    vim.opt.cmdheight = 1
    vim.opt.laststatus = 3
  end,
  hide_numbers = true, -- hide the number column in toggleterm buffers
  autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  shade_terminals = true,
  open_mapping = [[<c-\>]],
  direction = 'float', -- support 'vertical' 'horizontal' 'tab' 'float'
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'single', -- support [single, double, shadow, curved]
    -- like `size`, width and height can be a number or function which is passed the current terminal
    --width = <value>,
    --height = <value>,
    winblend = 3,
  },
  winbar = {
    enabled = false,
    name_formatter = function(term) --  term: Terminal
      return term.name
    end
  },
}
