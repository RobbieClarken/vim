Installation
------------

```bash
git clone --recursive https://github.com/RobbieClarken/vim ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
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
<C-v>u{4 hex bytes}
<C-v>U{up to 8 hex bytes}
```

For example, `<C-v>u0e3f` for `฿`. The Unicode Consortium provide lists of unicode characters [by name](http://www.unicode.org/charts/charindex.html) and [by script](http://www.unicode.org/charts/script/index.html).

You can also use digraphs which are easier to remember:

```vim
<C-k>{2 digraph characters}
```

A list of digraphs can be found at `:h digraph-table` but some examples are:

```
α = a*
β = b*
π = p*
→ = ->
× = *X
± = +-
∆ = DE
€ = Eu
£ = Pd
```
