# Simons's dotfiles

Based off [Paul Irish's dotfiles](https://github.com/paulirish/dotfiles), which are great. These are adapted to my needs.

## Setup

### Fresh computer

- Install homebrew first, it will install XCode dev tools to get `git` and so on:
  ```
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```
- Add SSH keys to Github

### Installing & using

Some applications are worth installing manually since a Brew install will mess with future updates:

- Browsers
- Slack
- VSCode
- Spotify
- [Hyper](https://hyper.is/)
- [BeardedSpice](https://beardedspice.github.io/) for media controls

#### Let's go!

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

#### Configuration of applications

- [Make iTerm2 open split tabs in same directory](https://apple.stackexchange.com/questions/337377/iterm2-split-vertically-with-current-profile-with-same-working-directory/337386#337386)

### What you get

- Mac OSX default settings (Paul Irish's)
- homebrew apps:
  - git
  - jq
  - z
  - bat
- homebrew cask
  - rectangle for window management
  - iterm2
  - insomna (better Postman)
- oh-my-zsh
  - git
  - history substring search
  - autosuggestions
  - syntax highlighting on terminal commands
- [z](https://github.com/rupa/z)
- functions:
  - `mkdc`: create directory and `cd` into it

## Migration

Steps to migrate from another computer.

- Copy `.extra`
