vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smarttab = true

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.wrap = true

local map = vim.keymap.set

-- clear search highlight
map("n", "<Esc>", ":nohlsearch<CR>", { desc = "Clear search highlight" })

-- useful when moving accross long lines
map("n", "j", "gj")
map("n", "k", "gk")
map("v", "j", "gj")
map("v", "k", "gk")

-- smart way to move btw. windows
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")

-- shortcuts
map("n", "<leader>q", ":qa<CR>", { desc = "Quick quit all" })
map("n", "<leader>w", ":w<CR>", { desc = "Quick write" })

-- lsp diagnostic
vim.diagnostic.config({
  virtual_text = false
})
map("n", "<leader>d", ":lua vim.diagnostic.open_float(0, {scope='line'})<CR>", { desc = "Show lint diagnostic" })

-- indent
local function set_indent(filetypes, size)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = filetypes,
    callback = function()
      vim.opt_local.expandtab = true
      vim.opt_local.shiftwidth = size
      vim.opt_local.softtabstop = size
    end,
  })
end

set_indent({ "python", "ruby" }, 4)
set_indent({ "lua", "yaml", "json", "html", "css", "javascript", "typescript", "svelte", "tsx" }, 2)

-- trailing cleaning
local function trim_trailing_whitespace()
  local save_cursor = vim.fn.winsaveview()
  vim.cmd([[keeppatterns %s/\s\+$//e]])
  vim.fn.winrestview(save_cursor)
end

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype ~= "markdown" then
      trim_trailing_whitespace()
    end
  end
})

-- clipboard
vim.g.clipboard = {
  name = 'pb',
  copy = {
    ['+'] = 'pbcopy',
    ['*'] = 'pbcopy',
  },
  paste = {
    ['+'] = 'pbpaste',
    ['*'] = 'pbpaste',
  },
  cache_enabled = 0,
}

-- theme
vim.cmd.colorscheme("rose-pine")

-- nvim tree open/close behavier
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      require("nvim-tree.api").tree.open()
    end
    -- if vim.fn.argc() > 0 then
    --   vim.cmd("wincmd l")
    -- end
  end,
})
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd("quit")
    end
  end,
})
