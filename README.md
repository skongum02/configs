# configs
Configs I want to carry over on new systems


vim plugins

* surround
* fugitive
* NERDTree
```
mkdir -p ~/.vim/pack/vkong/start
cd ~/.vim/pack/vkong/start
git clone https://tpope.io/vim/surround.git
vim -u NONE -c "helptags surround/doc" -c q
```

command line tools (already a part of nix configs)
* bat
* delta (git-delta)
* the_silver_searcher (ag)
* fzf
* gh (github command line)

## Nix (for mac)

* Install Nix
* Install nix-darwin
* `nix-channel --update` for updating darwin package
* `darwin-rebuild switch` to build new darwin configs 

## Neovim
* Follow guide for copying .vimrc to init.vim from neovim website
