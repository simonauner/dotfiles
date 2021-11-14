# Simons's dotfiles

Based off [Paul Irish's dotfiles](https://github.com/paulirish/dotfiles), which are great. These are adapted to my needs.

## Setup

#### installing & using

Some applications are worth installing manually since a Brew install will mess with future updates:

- Browsers
- Slack
- VSCode

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

- read and run parts of `setup-a-new-machine.sh`
- use it. yay!

#### what you get

- Mac OSX default settings (Paul Irish's)
- homebrew apps:
  - git
  - ack
  - kdiff3
  - jq
  - z
- homebrew cask
  - rectangle for window management
  - iterm2
- oh-my-zsh
  - git
  - history substring search
  - autosuggestions
  - syntax highlighting on terminal commands
- functions:
  - `n`: load `nvm` and use default version
  - `mkdc`: create directory and `cd` into it

## Migration

Steps to migrate from another computer.

- Export iterm config
- Copy `.extra`
