set -x

# apt
sudo apt update
sudo apt upgrade
sudo apt install zsh

# rust
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

# bob (nvim-version manager)
cargo install bob-nvim
bob

# nvim
bob install stable
bob use stable

# lsd (modern ls)
cargo install lsd

# zabrze (modern abbr)
cargo install zabrze
eval "$(zabrze init --bind-keys)"

# zsh as login shell
sudo chsh -s "$(which zsh)" $USER
# antigen (plugin manager for zsh)
curl -L git.io/antigen > antigen.zsh
# launch zsh
zsh

