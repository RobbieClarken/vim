# Installation

```bash
git clone https://github.com/RobbieClarken/vim ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
vim +PlugInstall +qall
```

## language-servers

```bash
pipx install python-language-server
rustup component add --toolchain nightly rls-preview rust-analysis rust-src
npm install -g javascript-typescript-langserver
vim +'CocInstall coc-java'
```

Other language servers are listed here: https://langserver.org/
