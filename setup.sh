#!/bin/bash
 git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
wget https://raw.githubusercontent.com/i-cooltea/resource/master/vim-api_scripts.json -v -O ~/.vim/bundle/.vundle/script-names.vim-scripts.org.json

# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
