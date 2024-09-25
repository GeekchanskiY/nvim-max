local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

-- utils -- 
local wrap = function(func, ...)
  local args = {...}
  return function()
    func(unpack(args))
  end
end

-- Window navigation -- 

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Window resize --

keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Lexplore --
keymap("n", "<leader>e", ":Lex 30<cr>", opts)


-- Buffers --

keymap("n", "<S-l>", "<Cmd>BufferNext<CR>", opts)
keymap("n", "<S-h>", "<Cmd>BufferPrevious<CR>", opts)
keymap("n", "<S-j>", "<Cmd>BufferClose<CR>", opts)
keymap("n", "<S-k>", "<Cmd>BufferPin<CR>", opts)
-- Doc --

local function doc()
  if vim.bo.filetype == 'go' then
    require("go.godoc").run()
  else
    print("cant show doc for this file type")
  end
end


vim.keymap.set("n", "<leader>gs", doc, opts)

-- go to declaration and definition
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

