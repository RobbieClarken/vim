Installation
------------

```bash
git clone https://github.com/RobbieClarken/vim ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
vim +BundleInstall +qall
```

Tips
----

### Non-greedy search

For a non-greedy search, use `{-}` instead of `*`. For example, the following will capture what is between the quotes

```vim
/\v"(.{-})"
```

### Typing unicode characters

```vim
^v u<4_digit_hex>
```

For [greek symbols](http://en.wikipedia.org/wiki/Greek_alphabet#Greek_in_Unicode):

```
α = 03B1, β = 03B2, ..., ω = 03C9
```
