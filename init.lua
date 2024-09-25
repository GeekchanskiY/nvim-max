require "keymaps"
require "hooks"

require "config.lazy"
require "config.colorscheme"
require "config.telescope"
require "config.autocompletion"
require "config.tabnine"
require "config.neotree"
require "config.auto_pairs"
require "config.auto_tags"
require "config.go_nvim"
require "config.lualune"

local g = vim.g
local o = vim.opt
-- local g = vim.global
o.mouse = "a"
o.shiftwidth = 4
o.tabstop = 4
o.number = true
o.relativenumber = true
o.fileencoding = "utf-8"
o.clipboard = "unnamedplus"
o.cursorline = true
o.backup = false
o.ignorecase = true
o.hlsearch = true
o.smartindent = true
o.cmdheight = 1
o.swapfile = false
o.wrap = false
o.syntax= "on"
o.tabstop = 4
o.softtabstop = 4
-- o.cc = "99"

o.smarttab = true
o.wrap = false
o.showcmd = true
o.showmatch = true
o.history = 1000

-- set buffers modifiable to avoid errors
o.modifiable = true

-- advanced options 
o.scrolloff = 8
o.updatetime = 50


-- codelens
g.codelens_auto = 0 -- call codelens to see who made changes
g.codelens_show_references = 1
g.codelens_show_tests = 1
g.codelens_allow_same_line = 1
g.codelens_bg_colour='#282828' -- gruvbox bg
g.codelens_fg_colour='#458588'
-- Treesitter default config (requires to be in init lua

require'nvim-treesitter.configs'.setup {
  -- A list of parser names
  ensure_installed = {
	  "c",
	  "javascript",
	  "lua",
	  "vim",
	  "vimdoc",
	  "query",
	  "markdown",
	  "markdown_inline",
	  "go",
  },

  sync_install = false,

  auto_install = true,

  ignore_install = {},

  -- parser_install_dir = "/some/path/to/store/parsers", 
  -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    disable = function(_, buf)
        local max_filesize = 10 * 1024 * 1024 -- 10 MB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    additional_vim_regex_highlighting = true,
  },
}


