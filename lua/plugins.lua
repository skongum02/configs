packer = require 'packer'

packer.init {
}


local use = packer.use
packer.reset()

packer.startup(function() 
  use 'wbthomason/packer.nvim'
  use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
  use 'preservim/nerdtree'
  use 'neovim/nvim-lspconfig'
end)

require'lspconfig'.metals.setup{}
require'lspconfig'.pyright.setup{}
