-- leader
vim.g.mapleader = " "

-- general
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.updatetime = 250

-- ui
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.termguicolors = true
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- markdown comfort
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.spell = true
vim.opt.spelllang = "en_us"
vim.opt.conceallevel = 2

-- plugins
require("plugins").setup()

-- keymaps
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>quit<cr>")
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>")

vim.keymap.set("n", "<leader>c", function()
  vim.cmd("edit " .. vim.fn.stdpath("config") .. "/init.lua")
end, { silent = true })

vim.keymap.set("n", "<leader>r", function()
  vim.cmd("source " .. vim.fn.stdpath("config") .. "/init.lua")
  print("Config reloaded")
end, { silent = true })

-- checkbox toggle
vim.keymap.set("n", "<C-l>", function()
  local line = vim.api.nvim_get_current_line()

  if line:match("^%- %[%s%] ") then
    line = line:gsub("^%- %[%s%] ", "- [x] ")
  elseif line:match("^%- %[x%] ") then
    line = line:gsub("^%- %[x%] ", "- [ ] ")
  else
    line = "- [ ] " .. line
  end

  vim.api.nvim_set_current_line(line)
end, { silent = true })
