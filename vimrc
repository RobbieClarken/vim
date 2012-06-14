set nocompatible                  " Must come first because it changes other options.

set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
cmap w!! w !sudo dd of=%
colorscheme molokai
syntax on
set number

call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

runtime plugin/matchit.vim        " Load the matchit plugin.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set title                         " Set the terminal's title

set laststatus=2                  " Show the status line all the time
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

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

" Python mode
let g:pymode_lint_write = 0
let g:pymode_folding = 0
" let g:pymode_run_key = 'R'

autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType js setlocal shiftwidth=2 tabstop=2

" Fix tab completion for file names
set wildmode=longest,list,full
set wildmenu
