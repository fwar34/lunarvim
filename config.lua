--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
-- lvim.colorscheme = "onedarker"
-- lvim.colorscheme = "default"
lvim.colorscheme = "onedark"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.insert_mode["<C-f>"] = "<Right>"
lvim.keys.insert_mode["<C-b>"] = "<Left>"
lvim.keys.insert_mode["<C-j>"] = "<Down>"
lvim.keys.insert_mode["<C-k>"] = "<Up>"
lvim.keys.insert_mode["<C-a>"] = "<Esc>I"
lvim.keys.insert_mode["<C-e>"] = "<Esc>A"
lvim.keys.insert_mode["<C-d>"] = "<Del>"
lvim.keys.normal_mode["<leader>rn"] = "<CMD>RnvimrToggle<CR>"
lvim.keys.normal_mode["<leader>ud"] = "<CMD>GundoToggle<CR>"

-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = false
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "cpp",
  "go",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { exe = "black", filetypes = { "python" } },
--   { exe = "isort", filetypes = { "python" } },
--   {
--     exe = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { exe = "flake8", filetypes = { "python" } },
--   {
--     exe = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     args = { "--severity", "warning" },
--   },
--   {
--     exe = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
  -- {"folke/tokyonight.nvim"},
  -- {
  --   "folke/trouble.nvim",
  --   cmd = "TroubleToggle",
  -- },
  -- {
    -- "norcalli/nvim-base16.lua",
    -- config = function()
    --   local theme_names = base16.theme_names()
    --   base16_position = 1
    --   function cycle_theme()
    --     base16_position = (base16_position % #theme_names) + 1
    --     base16(base16.themes[theme_names[base16_position]], true)
    --   end
    -- end
  -- },
  {
    "joshdick/onedark.vim",
  },
  {'glepnir/oceanic-material'},
  {
    'kevinhwang91/rnvimr', cmd = 'RnvimrToggle',
    config = function()
      -- Make Ranger replace Netrw and be the file explorer
      vim.g.rnvimr_enable_ex = 1
      -- Make Ranger to be hidden after picking a file
      vim.g.rnvimr_enable_picker = 1
      -- Make Neovim wipe the buffers corresponding to the files deleted by Ranger
      vim.g.rnvimr_enable_bw = 1
      -- Link CursorLine into RnvimrNormal highlight in the Floating window
      vim.cmd [[ highlight link RnvimrNormal CursorLine ]]

      -- if vim.fn.empty(vim.fn.glob(cheatsheets_path)) > 0 then
      -- end
      -- Map Rnvimr action
      vim.g.rnvimr_action = {
        [ '<C-t>' ] = 'NvimEdit tabedit',
        [ '<C-x>' ] = 'NvimEdit split',
        [ '<C-v>' ] = 'NvimEdit vsplit',
        [ 'gw' ] = 'JumpNvimCwd',
        [ 'yw' ] = 'EmitRangerCwd',
      }
    end
  },
  -- Marks
  {
    'kshenoy/vim-signature', config = function ()
      vim.g.SignatureIncludeMarks = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVW'
    end
  },
  {'easymotion/vim-easymotion'},
  {'lambdalisue/suda.vim'},
  {'mhinz/vim-signify'},
  {'dstein64/vim-startuptime', cmd = 'StartupTime'},
  {'ryanoasis/vim-devicons', },
  {'sjl/gundo.vim', cmd = 'GundoToggle', config = 'vim.g.gundo_prefer_python3 = 1'},
  {
    -- 提供 ctags/gtags 后台数据库自动更新功能
    {'ludovicchabant/vim-gutentags', event = 'VimEnter *'},
    -- 提供 GscopeFind 命令并自动处理好 gtags 数据库切换
    -- 支持光标移动到符号名上：<leader>cg 查看定义，<leader>cs 查看引用
    {'skywind3000/gutentags_plus', event = 'VimEnter *'},
  },
  {
    'skywind3000/asynctasks.vim', after = 'asyncrun.vim',
    requires = {'skywind3000/asyncrun.vim', event = 'VimEnter *'},
    config = function()
      -- 告诉 asyncrun 运行时自动打开高度为 6 的 quickfix 窗口，不然你看不到任何输出
      vim.g.asyncrun_open = 6
    end
  },
  {
    'wellle/targets.vim', event = 'VimEnter *',
  },
  {
    'dstein64/vim-win', event = 'VimEnter *',
    config = function()
    end
  },
  { 'tpope/vim-unimpaired', event = 'VimEnter *', },
  { 'derekwyatt/vim-fswitch', ft = {'cpp', 'c'}, },
  { 'skywind3000/awesome-cheatsheets', event = 'VimEnter *', },
  { 'ianva/vim-youdao-translater', event = 'VimEnter *', },
  { 'guns/xterm-color-table.vim', cmd = 'XtermColorTable' },
  {
    -- 使用 ALT+e 会在不同窗口/标签上显示 A/B/C 等编号，然后字母直接跳转
    't9md/vim-choosewin',
    config = function()
      -- 使用 ALT+E 来选择窗口
      vim.cmd [[ nmap <m-e> <Plug>(choosewin) ]]
    end
  },
  {
    -- 用 v 选中一个区域后，ALT_+/- 按分隔符扩大/缩小选区
    'terryma/vim-expand-region',
    config = function()
      -- ALT_+/- 用于按分隔符扩大缩小 v 选区
      vim.cmd [[ map <m-=> <Plug>(expand_region_expand) ]]
      vim.cmd [[ map <m--> <Plug>(expand_region_shrink) ]]
    end
  },

}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=4 sw=4" },
-- }