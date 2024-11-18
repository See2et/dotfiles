## Setup
```bash
cd $HOME
mkdir .dotfiles
cd .dotfiles
git init --bare ./
git remote add origin https://github.com/see2et/dotfiles.git
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
cd $HOME
dot config status.showUntrackedFiles no
dot pull origin main
```
