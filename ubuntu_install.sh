sudo apt-get install -y curl zsh

# Install oh-my-zsh
sh -c "$(curl https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

## Bullet train theme
git clone https://github.com/powerline/fonts.git
sh fonts/install.sh
wget https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme -O ~/.oh-my-zsh/themes/bullet-train.zsh-theme

## Some custom plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

## Get the personal configurations
cp ~/.zshrc ~/.zshrc.bk
wget https://raw.githubusercontent.com/tiev/tiev/master/.zshrc -O ~/.zshrc
wget https://raw.githubusercontent.com/tiev/tiev/master/.gitconfig -O ~/.gitconfig
wget https://raw.githubusercontent.com/tiev/tiev/master/.gitmessage -O ~/.gitmessage

# Install VIM
sudo apt-get install -y vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ~/.vimrc ~/.vimrc.bk
wget https://raw.githubusercontent.com/tiev/tiev/master/.vimrc -O ~/.vimrc
vim +PluginInstall +qall

## Install exuberant-ctags
sudo apt-get install -y exuberant-ctags

## Compile YouCompleteMe
sudo apt-get install -y build-essential cmake
sudo apt-get install -y python-dev python3-dev
(cd ~/.vim/bundle/YouCompleteMe && ./install.py)

# Install tmux
sudo apt-get install -y tmux
cp ~/.tmux.conf ~/.tmux.conf.bk
wget https://raw.githubusercontent.com/tiev/tiev/master/.tmux.conf -O ~/.tmux.conf
wget https://raw.githubusercontent.com/tiev/tiev/master/.tmuxline.conf -O ~/.tmuxline.conf

# Install RVM
sudo apt-get install -y gpgv2
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable

# Install Postgres
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y postgresql postgresql-contrib
