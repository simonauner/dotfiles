# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

if [[ $INTELLIJ_ENVIRONMENT_READER ]]; then
return
fi

export LC_MESSAGES=en_US.UTF-8



# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="honukai"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Disable warning about insecure completions, since mulitple users on the same machine needs
# group read/write permissions
ZSH_DISABLE_COMPFIX="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git history-substring-search zsh-autosuggestions)

# User configuration

# Personal scripts, symlinked from dotfiles/bin. `git-*` scripts here become
# `git <subcommand>` for free.
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



# Load our dotfiles
#   ~/.extra can be used for settings you don’t want to commit,
#   Use it to configure your PATH, thus it being first in line.
for file in ~/.{extra,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

# Remap alt-left and alt-right to forward/backward word skips.
# via @waltz, https://gist.github.com/waltz/8658549
bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word
#source /usr/local/dev-env/ansible/mac_profile


# Define Cursor as React editor, makes file paths clickable in terminal
export REACT_EDITOR=cursor

arch_name="$(uname -m)"

# Add brew to command-line
__brew_cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}"
__brew_cache_file="$__brew_cache_dir/brew_shellenv.${arch_name}.zsh"
mkdir -p "$__brew_cache_dir" 2>/dev/null

if [ "${arch_name}" = "x86_64" ]; then
  __brew_bin="/usr/local/bin/brew"
else
  __brew_bin="/opt/homebrew/bin/brew"
fi

if [ -x "$__brew_bin" ]; then
  if [ ! -s "$__brew_cache_file" ]; then
    "$__brew_bin" shellenv >| "$__brew_cache_file"
  fi
  source "$__brew_cache_file"
fi

# z beats cd most of the time.
#   github.com/ajeetdsouza/zoxide (successor to the unmaintained rupa/z)
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

export YVM_DIR=/opt/homebrew/opt/yvm
if [[ -r "$YVM_DIR/yvm.sh" ]]; then
  yvm() {
    unset -f yvm
    . "$YVM_DIR/yvm.sh"
    yvm "$@"
  }
fi

# pnpm
export PNPM_HOME="/Users/simonauner/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end



# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/simonauner/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/simonauner/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/simonauner/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/simonauner/google-cloud-sdk/completion.zsh.inc'; fi

# bun completions
[ -s "/Users/simonauner/.bun/_bun" ] && source "/Users/simonauner/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.docker/bin:$PATH"

# fnm switches node version on cd
eval "$(fnm env --use-on-cd --shell zsh)"
