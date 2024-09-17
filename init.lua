require "keymaps"

require "config.lazy"
require "config.colorscheme"
require "config.telescope"
require "config.autocompletion"
require "config.tabnine"
require "config.neotree"

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
-- o.cc = 79
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


-- Treesitter default config (requires to be in init lua

require'nvim-treesitter.configs'.setup {
  -- A list of parser names
  ensure_installed = { "c", "javascript", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "go" },

  sync_install = false,

  auto_install = true,

  ignore_install = {},

  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

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

-- statusline 
local cmp = {} -- statusline components

--- highlight pattern
-- This has three parts: 
-- 1. the highlight groups
-- 2. text content
-- 3. special sequence to restore highlight: %*
-- Example pattern: %#SomeHighlight#some-text%*
local hi_pattern = '%%#%s#%s%%*'

function _G._statusline_component(name)
  return cmp[name]()
end

function cmp.diagnostic_status()
  local ok = ' λ '

  local ignore = {
    ['c'] = true, -- command mode
    ['t'] = true  -- terminal mode
  }

  local mode = vim.api.nvim_get_mode().mode

  if ignore[mode] then
    return ok
  end

  local levels = vim.diagnostic.severity
  local errors = #vim.diagnostic.get(0, {severity = levels.ERROR})
  if errors > 0 then
    return ' ✘ '
  end

  local warnings = #vim.diagnostic.get(0, {severity = levels.WARN})
  if warnings > 0 then
    return ' ▲ '
  end

  return ok
end

function cmp.position()
  return hi_pattern:format('Search',' %3l:%-2c ')
end

local statusline = {
  '%{%v:lua._statusline_component("diagnostic_status")%} ',
  '%t',
  '%r',
  '%m',
  '%=',
  '%{&filetype} ',
  ' %2p%% ',
  '%{%v:lua._statusline_component("position")%}'
}

vim.o.statusline = table.concat(statusline, '')
