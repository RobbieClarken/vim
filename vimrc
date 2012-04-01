set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
cmap w!! w !sudo dd of=%
colorscheme molokai
syntax on
set number
call pathogen#infect()
filetype plugin indent on

"set backspace=indent,eol,start    " Intuitive backspacing.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

" vim-latexsuite settings
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

" LustyExplorer
set hidden

" Tab mappings
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

