# .vim by Potapov Sergey (aka Blake)

## What is it?
This is my daily use .vim. It includes my vimrc file, plugins, syntax checkers, color themes, snippets and so on. Everything what makes me happy:) Since I am a ruby developer it contains a lot of ruby oriented things.

## Install
Clone git repository:
    git clone https://github.com/greyblake/dotvim.git $HOME/.vim
Install git submodules:
    cd $HOME/.vim
    git submodule init
    git submodule update
Create a symbol link to vimrc:
    ln -s $HOME/.vim/vimrc $HOME/.vimrc 

## Requirements
Some plugins and features need builtin python and ruby interpreters. See the next section how to build Vim with this options.

## Building Vim from sources
Here I described how I built Vim. If you want all features to work I should do the same.

### Prerequisites
You should have at least the next packages installed to get and build Vim my way:
    - libgtk2.0-dev
    - python-dev
    - python3-dev
    - ruby-dev
    - mercurial
That means you should do the next as root (example for Debian like distributions):
    apt-get install libgtk2.0-dev python-dev python3-dev ruby-dev mercurial

### Getting Vim sources
Get the Vim with Mercurial:
    hg clone https://vim.googlecode.com/hg/ vim

### Building
Ok. Now lets configure it and build.
Go to the Vim sources directory:
    cd vim
Specify where you want Vim to be installed:
    export VIM_DIR=<absolute path to directory>
Run configure script with necessary options:
    ./configure --prefix=$VIM_DIR --enable-pythoninterp=yes --enable-python3interp=yes --enable-rubyinterp=yes --enable-gui=yes
The do:
    make
    make install
That's all.
Don't forget to add vim bin directory to you PATH in your .bashrc:
    echo "export PATH=\$PATH:${VIM_DIR}/bin" >> ~/.bashrc
