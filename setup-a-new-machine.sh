#
#
#
# HOW TO USE THIS FILE
# ====================
# Copy paste this file in bit by bit.
# don't run it.
#
#
  echo "do not run this script in one go. hit ctrl-c NOW"
  read -n 1

##
## new machine setup.
##


#
# homebrew!
#
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#
# brew install
sh brew.sh
sh brew-cask.sh

# Installs oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Downloads oh-my-zsh honukai theme (https://github.com/oskarkrawczyk/honukai-iterm-zsh):
git clone https://github.com/oskarkrawczyk/honukai-iterm-zsh.git ~/code/honukai-iterm-zsh
cp ~/code/honukai-iterm-zsh/honukai.zsh-theme ~/.oh-my-zsh/themes/

# Installs zsh-autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# nvm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

# go read mathias, paulmillr, gf3, alraa's dotfiles to see what to update with.

# set up osx defaults
#   maybe something else in here https://github.com/hjuutilainen/dotfiles/blob/master/bin/osx-user-defaults.sh
sh .osx

# symlinks!
#   put/move git credentials into ~/.gitconfig.local
#   http://stackoverflow.com/a/13615531/89484
sh symlink-setup.sh

