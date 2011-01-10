## Install
Clone git repository:
    git clone git://github.com/greyblake/dotvim.git $HOME/.vim
Install git submodules:
    cd $HOME/.vim
    git submodule init
    git submodule update
Create a symbol link to vimrc:
    ln -s $HOME/.vim/vimrc $HOME/.vimrc 
Add .vim/bin to your PATH(exmaple for bash):
    echo 'export PATH=$PATH:$HOME/.vim/bin' >> $HOME/.bashrc

