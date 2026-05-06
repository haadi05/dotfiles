local M = {}

function M.setup()
  -- telescope
  require("telescope").setup({})
  vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files)

  -- markdown preview
  require("render-markdown").setup({
    render_modes = { "n", "c" },
  })
end

return M
