dir=~/dotfiles
olddir=~/dotfiles_old
files=".bashrc .vimrc .tmux.conf .bash_profile"

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done

vundle_path="$HOME/.vim/bundle/vundle"
[[ -d $vundle_path ]] || git clone https://github.com/gmarik/vundle.git $vundle_path
vim +BundleInstall +qall
