set nocompatible                  " Use vim-only features

runtime macros/matchit.vim        " Jump between opening and closing
                                  " tags with %

filetype off                      " Required for vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Plugin 'gmarik/vundle'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-dispatch'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'pangloss/vim-javascript'
Plugin 'digitaltoad/vim-jade'
Plugin 'RobbieClarken/vim-haproxy'
Plugin 'plasticboy/vim-markdown'
Plugin 'triglav/vim-visual-increment'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-abolish'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'SirVer/ultisnips'
Plugin 'tommcdo/vim-exchange'
Plugin 'atweiden/vim-dragvisuals'
let g:vim_markdown_folding_disabled=1
filetype plugin indent on

syntax on
colorscheme molokai
highlight Visual term=reverse cterm=reverse guibg=LightGrey

set cursorline
set colorcolumn=76
set scrolloff=3

set encoding=utf-8
set fileencoding=utf-8
set history=1000
set spelllang=en_au               " Use Australian English.
set clipboard=unnamed             " Put from the Mac clipboard.
set title                         " Set the terminal's title.

set hidden                        " Don't warn when leaving a buffer
                                  " with unsaved changes.
set wildmenu                      " Enhanced command line completion.
set wildmode=longest,list         " Fix tab completion for file names.
set ignorecase                    " Case-insensitive searching.
set smartcase                     " Case-sensitive if expression
                                  " contains a capital letter.
set hlsearch                      " Highlight matches.
set incsearch                     " Highlight matches as you type.

set autoread
set autowrite                     " Save before commands like :make
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set linebreak                     " Wrap lines at a sensible point.
set backspace=indent,eol,start    " Intuitive backspacing.

set number                        " Show line numbers.
set laststatus=2                  " Always show the status line.
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %=%-16(\ %l,%c-%v\ %)%P

set tags=./.git/tags,./tags,.git/tags,tags

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pyc|png|jpg|gif)$',
  \ }

let g:pyindent_open_paren = '&sw'

autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                      \| exe "normal! g'\"" | endif
autocmd BufRead,BufNewFile *.ejs set filetype=html
autocmd BufRead,BufNewFile *.stt set filetype=c
autocmd BufRead,BufNewFile .bash_local set filetype=sh
autocmd FileType tex setlocal shiftwidth=2 tabstop=2
autocmd FileType tex let b:dispatch = 'latexmk -pdf %'
autocmd FileType javascript let b:dispatch = 'node %'
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType python let b:dispatch = 'python %'

" Write with sudo
cmap w!! w !sudo dd of=%

" Turn spell-check on and off
nmap <silent> <leader>s :set spell!<CR>
nmap <silent> <leader>n :syn match capitalLetters "\v<[a-zA-Z]_?[ijk0-9]?>" contains=@NoSpell<CR>

" Clear search highlighting, turn off spell checking and redraw
" the screen.
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR>:set nospell<CR><C-l>

nmap <C-d> :Dispatch<CR>
imap <C-d> <Esc>:Dispatch<CR>a

" Make the & command preserve the substitution flags.
nnoremap & :&&<CR>
xnoremap & :&&<CR>

nnoremap <C-j> o<Esc>
nnoremap <C-k> O<Esc>
