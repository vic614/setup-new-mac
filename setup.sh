# Current directory
temp_dir="/tmp/setup-new-mac"
git clone https://github.com/vic614/setup-new-mac.git $temp_dir

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew -v || (echo Brew is not installed && exit 1)
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# setup ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Setup Vim
# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# copy dotfiles

for file in $temp_dir/dotfiles/*;do cp "$file" "$HOME/.$file"; done

# install vim plugins
vim +PluginInstall +qall

