## Install

1. Clone git repository:

    `git clone git@github.com:randx/dotvim.git $HOME/.vim`

2. Install git submodules:

    `cd $HOME/.vim`

    `git submodule init`

    `git submodule update`

3. Create a symbol link to vimrc:

    `ln -s $HOME/.vim/vimrc $HOME/.vimrc` 

4. Add .vim/bin to your PATH(exmaple for bash):

    `echo 'export PATH=$PATH:$HOME/.vim/bin' >> $HOME/.bashrc`

