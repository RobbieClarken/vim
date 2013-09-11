set nocompatible                  " use iMproved features
filetype off                      " required for vundle

set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

set encoding=utf-8
set fileencoding=utf-8

set wrap
set linebreak
set nolist

set spelllang=en_au               " Use Australian English
" Turn spelling on and off
nmap <silent> <leader>s :set spell!<CR>

cmap w!! w !sudo dd of=%
colorscheme molokai
set number

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'pangloss/vim-javascript'
Bundle 'digitaltoad/vim-jade'
Bundle 'walm/jshint.vim'
Bundle 'RobbieClarken/vim-haproxy'
Bundle 'plasticboy/vim-markdown'

filetype plugin indent on
syntax on

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
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Tab mappings
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tN :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" Change selected text to Title Case
vmap gt :s/\%V\<\(\w\)\(\w*\)\>/\u\1\L\2/ge<cr>:noh<cr>

autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType tex setlocal shiftwidth=2 tabstop=2
autocmd FileType js setlocal shiftwidth=2 tabstop=2
autocmd BufRead,BufNewFile *.ejs setlocal ft=html

let g:vim_markdown_folding_disabled=1

" Fix tab completion for file names
set wildmode=longest,list

set clipboard=unnamed
