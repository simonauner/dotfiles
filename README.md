# Simons's dotfiles

Based off [Paul Irish's dotfiles](https://github.com/paulirish/dotfiles), which are great. These are adapted to my needs.

## Setup

#### installing & using

Some applications are worth installing manually since a Brew install will mess with future updates:

- Chrome and Canary
- Slack
- Sublime
- iterm2

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

#### what you get

- git config (Paul Irish's)
- Mac OSX default settings (Paul Irish's)
- homebrew
  - git
  - ack
  - kdiff3
- homebrew cask
  - ~~dropbox~~
  - spectacle
  - ~~iterm2-nightly~~ Isn't signed through Brew, needs to be manually installed
  - ~~sublime-text3~~
  - ~~spotify~~
  - ~~chrome~~
  - ~~chrome canary~~
- z
- oh-my-zsh
- aliases:
  - `mkdc`: create directory and `cd` into it

## Migration

Steps to migrate from another computer.

- Export iterm config
- Copy `.extra`
- Copy useful tools from `/usr/local/bin`
  - `gcred`
