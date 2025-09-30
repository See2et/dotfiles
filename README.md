[home-managerへの移行を進めています](https://github.com/See2et/nix-home-manager)。

## Setup
```bash
cd $HOME
mkdir .dotfiles
cd .dotfiles
git init --bare ./
git remote set-url origin git@github.com:see2et/dotfiles.git
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

cd $HOME
dot config status.showUntrackedFiles no
dot pull origin main

chmod 755 ./setup.sh
./setup.sh
```
