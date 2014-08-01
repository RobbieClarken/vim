set nocompatible                  " Use vim-only features

runtime macros/matchit.vim        " Enable jumping between opening and closing tags with %

filetype off                      " Required for vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Plugin 'gmarik/vundle'
Plugin 'tpope/vim-repeat'
Plugin 'kien/ctrlp.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'pangloss/vim-javascript'
Plugin 'digitaltoad/vim-jade'
Plugin 'RobbieClarken/vim-haproxy'
Plugin 'plasticboy/vim-markdown'
Plugin 'triglav/vim-visual-increment'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-abolish'
Plugin 'nelstrom/vim-visual-star-search'
let g:vim_markdown_folding_disabled=1
filetype plugin indent on

syntax on
colorscheme molokai
highlight Visual term=reverse cterm=reverse guibg=LightGrey

set encoding=utf-8
set fileencoding=utf-8
set history=1000
set spelllang=en_au               " Use Australian English.
set clipboard=unnamed             " Allow putting from the Mac clipboard.
set title                         " Set the terminal's title.

set hidden                        " Don't warn when leaving a buffer with unsaved changes.
set wildmenu                      " Enhanced command line completion.
set wildmode=longest,list         " Fix tab completion for file names.
set ignorecase                    " Case-insensitive searching.
set smartcase                     " Case-sensitive if expression contains a capital letter.
set hlsearch                      " Highlight matches.
set incsearch                     " Highlight matches as you type.

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

autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                      \| exe "normal! g'\"" | endif
autocmd BufRead,BufNewFile *.ejs set filetype=html
autocmd BufRead,BufNewFile *.stt set filetype=c
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType tex setlocal shiftwidth=2 tabstop=2
autocmd FileType js setlocal shiftwidth=2 tabstop=2

" Write with sudo
cmap w!! w !sudo dd of=%

" Turn spell-check on and off
nmap <silent> <leader>s :set spell!<CR>

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

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Clear search highlighting, turn off spell checking and redraw
" the screen.
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR>:set nospell<CR><C-l>

" Make the & command preserve the substitution flags.
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Disable backspace and delete buttons to train myself
" to use <c-h>, and <c-w> and <c-u>.
inoremap <BS> <Nop>
inoremap <Del> <Nop>
