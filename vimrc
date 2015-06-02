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
Plugin 'Keithbsmiley/swift.vim'
Plugin 'triglav/vim-visual-increment'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-abolish'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'SirVer/ultisnips'
Plugin 'tommcdo/vim-exchange'
Plugin 'atweiden/vim-dragvisuals'
Plugin 'ervandew/supertab'
Plugin 'junegunn/vim-easy-align'
Plugin 'tpope/vim-commentary'
Plugin 'zaiste/tmux.vim'
filetype plugin indent on

syntax on
colorscheme molokai
highlight Visual term=reverse cterm=reverse guibg=LightGrey

set cursorline
set colorcolumn=82
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
set formatoptions-=cro            " Disable automatic comment continuation
set cm=blowfish2

set number                        " Show line numbers.
set laststatus=2                  " Always show the status line.
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %=%-16(\ %l,%c-%v\ %)%P

set tags=./.git/tags,./tags,.git/tags,tags

let mapleader=" "
nnoremap <SPACE> <Nop>

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v\C(/\.(git|hg|svn)|/node_modules|/coverage|/dbd?|O\..*)$',
  \ 'file': '\v\.(exe|so|dll|pyc|png|jpg|gif)$',
  \ }
let g:pyindent_open_paren = '&sw'
let g:vim_markdown_folding_disabled = 1
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:SuperTabDefaultCompletionType = "<c-n>"

autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                      \| exe "normal! g'\"" | endif
autocmd BufRead,BufNewFile *.ejs set filetype=html
autocmd BufRead,BufNewFile *.stt set filetype=c
autocmd BufRead,BufNewFile .bash_local set filetype=sh
autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby
autocmd FileType tex setlocal shiftwidth=2 tabstop=2
autocmd FileType tex let b:dispatch = 'latexmk -pdf %'
autocmd FileType javascript let b:dispatch = 'node %'
autocmd FileType javascript nnoremap <leader>t :!npm test<CR>
autocmd FileType javascript nnoremap <leader>r :!node --expose_gc %<CR>
autocmd FileType json nnoremap <leader>t :!npm test<CR>
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType python let b:dispatch = 'python %'
autocmd FileType python nnoremap <leader>r :!python %<cr>
autocmd FileType mkd setlocal shiftwidth=2 tabstop=2
autocmd FileType mkd nnoremap o A<CR>
autocmd FileType * setlocal formatoptions-=cro

inoremap jk <Esc>
cnoremap jk <Esc>

" Write with sudo
cnoremap w!! w !sudo dd of=%

" Turn spell-check on and off
nnoremap <silent> <leader>s :set spell!<CR>
nnoremap <silent> <leader>n :syn match capitalLetters "\v<[a-zA-Z]_?[ijk0-9]?>" contains=@NoSpell<CR>

" Clear search highlighting, turn off spell checking and redraw
" the screen.
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR>:set nospell<CR><C-l>

nnoremap <leader>d :Dispatch<CR>

" Make the & command preserve the substitution flags.
nnoremap & :&&<CR>
xnoremap & :&&<CR>

nnoremap <C-j> o<Esc>
nnoremap <C-k> O<Esc>

" Prevent vim trying to paste last insert buffer when you hit <C-Space>
inoremap <Nul> <Space>

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vnoremap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nnoremap ga <Plug>(EasyAlign)

nnoremap <leader>w :%s/\v\s+$//<cr>
