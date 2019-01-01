# Installation

```bash
git clone https://github.com/RobbieClarken/vim ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
vim +PlugInstall +qall
```

## language-servers

```bash
pipsi install python-language-server
rustup component add --toolchain nightly rls-preview rust-analysis rust-src
```

Other language servers are listed here: https://langserver.org/
