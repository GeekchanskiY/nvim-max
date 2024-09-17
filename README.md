# Nvim max config
I do use this config for development 100% of my work time


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


## TODO's

Vim-go is a GOAT, really: 
https://github.com/fatih/vim-go/blob/master/doc/vim-go.txt

Some sources for nvim cmp plugin
https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources

