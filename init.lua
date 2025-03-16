-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure plugins ]]
-- NOTE: Here is where you install your plugins.
-- you can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require("lazy").setup("plugins", {})

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = "unnamedplus"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- document existing key chains
-- require("which-key").add({
-- 	["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
-- 	["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
-- 	["<leader>g"] = { name = "[G]it", _ = "which_key_ignore" },
-- 	["<leader>h"] = { name = "Git [H]unk", _ = "which_key_ignore" },
-- 	["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
-- 	["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
-- 	["<leader>t"] = { name = "[T]oggle", _ = "which_key_ignore" },
-- 	["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
-- })
-- register which-key VISUAL mode
-- required for visual <leader>hs (hunk stage) to work
-- require("which-key").add({
-- 	["<leader>"] = { name = "VISUAL <leader>" },
-- 	["<leader>h"] = { "Git [H]unk" },
-- }, { mode = "v" })

-- Setup neovim lua configuration
-- require("neodev").setup()

vim.wo.relativenumber = true
vim.api.nvim_set_keymap("n", "}", "{", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "{", "}", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "}", "{", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "{", "}", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>nf", vim.lsp.buf.format, { desc = "[N]eovim [F]ormat" })
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { desc = "Code [A]action" })

vim.keymap.set("n", "<Leader>w", "<C-W>", { noremap = true, silent = true })
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
