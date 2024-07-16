-- vim.wo.number = true
-- vim.wo.relativenumber = true

vim.g.did_load_filetypes = 1
vim.g.formatoptions = "qrn1"
vim.opt.showmode = false
vim.opt.updatetime = 100
vim.wo.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.wo.linebreak = true
vim.opt.virtualedit = "block"
vim.opt.undofile = true
vim.opt.shell = "/bin/zsh"

-- Mouse
vim.opt.mouse = "a"
vim.opt.mousefocus = true

-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = "120"
vim.opt.list = false

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Shorter messages
vim.opt.shortmess:append("c")

-- Indent Settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true

-- Folding Settings
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false

-- Fillchars
vim.opt.fillchars = {
  vert = "│",
  fold = "⠀",
  eob = " ", -- suppress ~ at EndOfBuffer
  -- diff = "⣿", -- alternatives = ⣿ ░ ─ ╱
  msgsep = "‾",
  foldopen = "▾",
  foldsep = "│",
  foldclose = "▸"
}

vim.cmd([[highlight clear LineNr]])
vim.cmd([[highlight clear SignColumn]])

-- Resolve missing line numbers error
vim.api.nvim_create_autocmd(
  "BufEnter",
  {
    pattern = "*",
    callback = function()
      if vim.bo.filetype == "dashboad" then
        vim.opt_local.relativenumber = false
        vim.opt_local.number = false
        return
      end
      vim.opt_local.relativenumber = true
      vim.opt_local.number = true
    end
  }
)

-- Auto set indent by filetype
vim.api.nvim_create_autocmd(
  "BufEnter",
  {
    pattern = "*",
    callback = function()
      local filetype = vim.bo.filetype
      if filetype == "dashboad" then
        vim.opt.shiftwidth = 0
        vim.opt.tabstop = 0
        vim.opt.softtabstop = 0
        vim.opt.smartindent = false
        vim.opt.expandtab = false
        vim.wo.number = false
        vim.wo.relativenumber = false
        return
      end

      vim.wo.number = true
      vim.wo.relativenumber = true

      if filetype == "python" or filetype == "go" then
        vim.opt.shiftwidth = 4
        vim.opt.tabstop = 4
        vim.opt.softtabstop = 4
        vim.opt.smartindent = true
        return
      end

      vim.opt.shiftwidth = 2
      vim.opt.tabstop = 2
      vim.opt.softtabstop = 2
      vim.opt.smartindent = true
    end
  }
)
