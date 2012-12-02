Installation
------------

    git clone https://github.com/RobbieClarken/vim ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    cd ~/.vim
    git submodule init
    git submodule update
    vim +BundleInstall +qall

Tips
----

Typing unicode characters
    ^v u<4 digit hex>

For [greek symbols](http://en.wikipedia.org/wiki/Greek_alphabet#Greek_in_Unicode):
    α = 03B1
    β = 03B1
    ...
    ω = 03C9
