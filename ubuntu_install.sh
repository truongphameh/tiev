sudo apt-get install -y curl zsh

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
sudo snap install hub --classic

## Get the personal configurations
cp ~/.zshrc ~/.zshrc.bk
wget https://raw.githubusercontent.com/tiev/tiev/master/.zshrc -O ~/.zshrc
wget https://raw.githubusercontent.com/tiev/tiev/master/.gitconfig -O ~/.gitconfig
wget https://raw.githubusercontent.com/tiev/tiev/master/.gitmessage -O ~/.gitmessage

# Install VIM
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install -y neovim
cp ~/.config/nvim/init.vim ~/.config/nvim/init.vim.bk
wget https://raw.githubusercontent.com/tiev/tiev/master/ubuntu/.config/nvim/init.vim -O ~/.config/nvim/init.vim
nvim +PlugInstall +qall

## Install exuberant-ctags
# sudo apt-get install -y exuberant-ctags

## Install python and support for neovim
sudo apt-get install python-dev python-pip python3-dev python3-pip
pip install neovim
pip3 install neovim

## Install neovim-remote
pip3 install neovim-remote

# Install tmux
sudo apt-get install -y tmux
cp ~/.tmux.conf ~/.tmux.conf.bk
wget https://raw.githubusercontent.com/tiev/tiev/master/.tmux.conf -O ~/.tmux.conf
wget https://raw.githubusercontent.com/tiev/tiev/master/.tmuxline.conf -O ~/.tmuxline.conf

# Install RVM
# sudo apt-get install -y gpgv2
# gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
# \curl -sSL https://get.rvm.io | bash -s stable

# Install rbenv
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash

# Install Postgres
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y postgresql postgresql-contrib

# Install Redis
sudo apt-get install redis-server

# AFTER
# - install Hasklig font - support ligature -> choose this font & turn ligature support on
