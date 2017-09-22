# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install wget
brew install wget

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## Bullet-train theme
git clone https://github.com/powerline/fonts.git
sh fonts/install.sh
wget https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme -O ~/.oh-my-zsh/themes/bullet-train.zsh-theme

## Some custom plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

## Get the personal configurations
cp ~/.zshrc ~/.zshrc.bk
wget https://raw.githubusercontent.com/tiev/tiev/master/mac.zshrc -O ~/.zshrc
wget https://raw.githubusercontent.com/tiev/tiev/master/.gitconfig -O ~/.gitconfig
wget https://raw.githubusercontent.com/tiev/tiev/master/.gitmessage -O ~/.gitmessage

# Install VIM
brew install neovim
wget -xL https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -O ~/.local/share/nvim/site/autoload/plug.vim
cp ~/.config/nvim/init.vim ~/.config/nvim/init.vim.bk
wget https://raw.githubusercontent.com/tiev/tiev/master/mac.init.vim -O ~/.config/nvim/init.vim
nvim +PlugInstall +qall

## Install ag command
brew install the_silver_searcher

# Install tmux
brew install tmux
cp ~/.tmux.conf ~/.tmux.conf.bk
wget https://raw.githubusercontent.com/tiev/tiev/master/mac.tmux.conf -O ~/.tmux.conf
wget https://raw.githubusercontent.com/tiev/tiev/master/.tmuxline.conf -O ~/.tmuxline.conf

# Install RVM
brew install gpg
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable

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

xcode-select --install
