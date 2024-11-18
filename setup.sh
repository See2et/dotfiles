set -x

# apt
sudo apt update
sudo apt upgrade
sudo apt install zsh

# gh
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
	&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y

# deno
sudo apt install -y p7zip-full
curl -fsSL https://deno.land/x/install/install.sh | sh

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
nvm install --lts
nvm use --lts

# python
sudo apt install -y python3-pip
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install -y python3.10 python3.10-venv # 任意のバージョン
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.10 310
# sudo update-alternatives --config python # 切り替えるときはこれ

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
sudo apt install ripgrep
sudo apt install xclip
sudo apt install unzip # some lsp needs this: denols...etc

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

# lazygit

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/

# zsh as login shell
sudo chsh -s "$(which zsh)" $USER
# antigen (plugin manager for zsh)
curl -L git.io/antigen > antigen.zsh
# launch zsh
zsh
