# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install wget
brew install wget

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## Custom zsh theme
git clone https://github.com/powerline/fonts.git
sh fonts/install.sh
# wget https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme -O ~/.oh-my-zsh/themes/bullet-train.zsh-theme
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

## Some custom plugins
git clone https://github.com/zdharma/fast-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

## Install hub command
brew install hub

## Get the personal configurations
cp ~/.zshrc ~/.zshrc.bk
wget https://raw.githubusercontent.com/tiev/tiev/master/.zshrc -O ~/.zshrc
wget https://raw.githubusercontent.com/tiev/tiev/master/.gitconfig -O ~/.gitconfig
wget https://raw.githubusercontent.com/tiev/tiev/master/.gitmessage -O ~/.gitmessage

# Install VIM
brew install neovim
cp ~/.config/nvim/init.vim ~/.config/nvim/init.vim.bk
wget https://raw.githubusercontent.com/tiev/tiev/master/mac/.config/nvim/init.vim -O ~/.config/nvim/init.vim
nvim +PlugInstall +qall

## Install ag command (deprecated, using fzf, installed by Plug in neovim)
# brew install the_silver_searcher

## Install python3 - support python for neovim
brew install python3
pip3 install pynvim

## Install neovim-remote
pip3 install neovim-remote

# Install tmux
brew install tmux
cp ~/.tmux.conf ~/.tmux.conf.bk
wget https://raw.githubusercontent.com/tiev/tiev/master/.tmux.conf -O ~/.tmux.conf
wget https://raw.githubusercontent.com/tiev/tiev/master/.tmuxline.conf -O ~/.tmuxline.conf
brew install urlview # Quick open url for tmux
brew install fpp # Facebook Path Picker

# Fix vim clipboard in tmux
# - need two lines in .tmux.conf
# ```
#   set -g default-shell $SHELL
#   set -g default-command "reattach-to-user-namespace -l ${SHELL}"
# ```
# Not needed for new OSX versions
#brew install reattach-to-user-namespace

# Install RVM
# brew install gpg
# gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
# \curl -sSL https://get.rvm.io | bash -s stable

# Install rbenv
brew update
brew install rbenv ruby-build

# Install Postgres
brew update
brew install postgresql
echo "--------------------"
echo "RUN THIS: "
echo "cp /usr/local/Cellar/postgresql/{version}/homebrew.mxcl.postgresql.plist ~/Library/LaunchAgents/"
echo "____________________"

# Install Redis
brew install redis
echo "--------------------"
echo "RUN THIS: "
echo "cp /usr/local/Cellar/redis/{version}/homebrew.mxcl.redis.plist ~/Library/LaunchAgents/"
echo "____________________"

# Install NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

xcode-select --install

# AFTER
# - install Hasklig font - support ligature -> choose this font & turn ligature support on

# TOYS
brew install tldr
