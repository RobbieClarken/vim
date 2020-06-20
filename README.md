# Installation

```bash
git clone https://github.com/RobbieClarken/vim ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
vim +PlugInstall +qall
```

## language-servers / linters

```bash
# Python
pipx install python-language-server black

# Rust
rustup component add --toolchain nightly rls-preview rust-analysis rust-src

# JavaScript / TypeScript
npm install -g javascript-typescript-langserver

# Java
vim +'CocInstall coc-java'

# Clojure
brew install borkdude/brew/clj-kondo clojure-lsp
```

Other language servers are listed here: https://langserver.org/
