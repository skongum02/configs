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

command line tools
* bat
* delta (git-delta)
* the_silver_searcher (ag)
* fzf

## Nix

* Install Nix
* Install nix-darwin
* `nix-channel --update` for updating darwin package
* `darwin-rebuild switch` to build new darwin configs 
