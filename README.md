# Nvim max config
I do use this config for development 100% of my work time

nvim version: 0.11.0-dev

## Setup

To display icons and other stuff properly, install nerd font 
copy font.zip and unarchive font to /usr/local/share/fonts/ 
and then run:
```bash
sudo fc-cache -fv
```

nodejs required
sudo apt-get install luarocks


if no clipboard provider
sudo apt install xclip


LSP Server installation guides 
https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md



for lua i prefer to install brew & then lua-language-server with it 
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Then follow installation instructions after brew installed & install lua-language-server:
```
brew install lua-language-server
```

Language servers I also use:
```bash 
sudo npm install -g typescript-language-server typescript 
```


ripgrep for grep in treesitter 
```bash
sudo apt-get install ripgrep
```

## Useful commands 
-- DiffviewOpen / DiffviewClose - look through updates

You'll possibly need to update nodejs 
https://askubuntu.com/questions/426750/how-can-i-update-my-nodejs-to-the-latest-version

## TODO's

Vim-go is a GOAT, really: 
https://github.com/fatih/vim-go/blob/master/doc/vim-go.txt
Some commands which are meta for me:
```
GoDoc 
GoLint 
GoImports/GoFmt 

```


Some sources for nvim cmp plugin
https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources

Obsidian integration lol
https://github.com/epwalsh/obsidian.nvim

## Hints (keymaps I do always forget about):
```
u - undo changes 
:noh - disable highlighting
```

something interesting 
https://github.com/numToStr/Comment.nvim


check how to create custom behavior here:
https://github.com/weizheheng/nvim-workbench/blob/main/lua/workbench/project_workbench.lua 

