alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dot config status.showUntrackedFiles no
dot pull origin main
