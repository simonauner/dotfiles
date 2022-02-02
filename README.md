# Simons's dotfiles

Based off [Paul Irish's dotfiles](https://github.com/paulirish/dotfiles), which are great. These are adapted to my needs.

## Setup

#### installing & using

Some applications are worth installing manually since a Brew install will mess with future updates:

- Browsers
- Slack
- Iterm2
- VSCode
- Spoitfy
- https://rectangleapp.com/
- BeardedSpice for media controls

Let's go!

- fork this to your own acct
- clone that repo
- Create `.gitconfig.local` with user settings

      [user]
      	useConfigOnly = true
      	email = <email>
      	name = <name>
      [credential]
      	helper = osxkeychain

- Install [nvm](https://github.com/creationix/nvm#installation) and node
- read and run parts of `setup-a-new-machine.sh`
- read and run `npm-install.sh`
- use it. yay!

## Migration

Steps to migrate from another computer.

- Export iterm config
- Copy `.extra`
