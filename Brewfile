# Install with `brew bundle`. Check for drift with `brew bundle check` and list
# installed packages missing from this file with `brew bundle cleanup`.
# Machine-specific packages go in ~/.Brewfile.local, which is loaded at the end.

tap "simonauner/tap"

brew "bat"          # cat with syntax highlighting
brew "ffmpeg"
brew "fnm"          # node version manager, switches on cd
brew "gh"
brew "git"
brew "git-absorb"
brew "jq"
brew "wget"
brew "zoxide"       # smarter cd

cask "1password-cli"
cask "dotnet-sdk"
cask "iterm2"
cask "keycastr"
cask "rectangle"
cask "simonauner/tap/lotsen"

local = File.expand_path("~/.Brewfile.local")
instance_eval(File.read(local)) if File.exist?(local)
