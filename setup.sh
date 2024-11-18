set -x

# apt
sudo apt update
sudo apt upgrade
sudo apt install zsh

# rust
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
sudo apt install build-essential
source $HOME/.cargo/env
source $HOME/.cargo/bin

# bob (nvim-version manager)
cargo install bob-nvim

# nvim
bob install stable
bob use stable

# lsd (modern ls)
cargo install lsd

# zabrze (modern abbr)
cargo install zabrze

# go
sudo add-apt-repository -y ppa:longsleep/golang-backports
sudo apt-get update
sudo apt-get install --no-install-recommends -y golang

# ghq
go install github.com/x-motemen/ghq@latest

# fzf
sudo apt install fzf

# zsh as login shell
sudo chsh -s "$(which zsh)" $USER
# antigen (plugin manager for zsh)
curl -L git.io/antigen > antigen.zsh
# launch zsh
zsh
