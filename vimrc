" ===== Load Plugins =====

set nocompatible                  " Use Vim-only features
filetype off                      " Required for Vundle
set runtimepath+=~/.vim/bundle/vundle/    " Tell Vim where to find Vundle
call vundle#begin()                       " Enable the :Plugin command
Plugin 'gmarik/vundle'                    " Let Vundle manage Vundle
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-repeat'                 " Add . support to plugin commands
Plugin 'tpope/vim-surround'               " Change parentheses and quotes
Plugin 'tpope/vim-unimpaired'             " Handy bracket mappings
Plugin 'tpope/vim-abolish'                " Change variable case format
Plugin 'tpope/vim-dispatch'               " Asynchronous build dispatcher
Plugin 'kien/ctrlp.vim'                   " Fuzzy file finder
Plugin 'SirVer/ultisnips'                 " Code snippets manager
Plugin 'bronson/vim-trailing-whitespace'  " Highlight trailing whitespace
Plugin 'triglav/vim-visual-increment'     " Create column of ascending numbers
Plugin 'nelstrom/vim-visual-star-search'  " * search from visual mode
Plugin 'tommcdo/vim-exchange'             " Swap regions of text
Plugin 'ervandew/supertab'                " Tab-completion
Plugin 'junegunn/vim-easy-align'          " Align tabular data
Plugin 'tpope/vim-commentary'             " Comment / uncomment code
Plugin 'christoomey/vim-tmux-navigator'   " Navigate between vim and tmux panes
Plugin 'pangloss/vim-javascript'          " JavaScript syntax support
Plugin 'digitaltoad/vim-jade'             " Jade syntax support
Plugin 'RobbieClarken/vim-haproxy'        " HAProxy syntax support
Plugin 'plasticboy/vim-markdown'          " Markdown syntax support
Plugin 'keith/swift.vim'                  " Swift syntax support
Plugin 'mxw/vim-jsx'                      " JSX syntax support
call vundle#end()                 " Finish putting plugins on the runtimepath
filetype plugin on                " Enable loading plugins by filetype
runtime macros/matchit.vim        " Jump between opening and closing xml tags with %

" ===== Set Styling =====

syntax enable                     " Turn on syntax highlighting.
" Use molokai colorscheme if it is available.
try
  colorscheme molokai
catch
endtry
set number                        " Show line numbers.
set cursorline                    " Highlight line the cursor is on.
set colorcolumn=82                " Indicate the 82nd column to help avoid
                                  " writing excessively long lines of code.
set scrolloff=3                   " Always display at least 3 lines above cursor.
set hlsearch                      " Highlight search matches.
set incsearch                     " Highlight search matches as you type.
set title                         " Set the terminal's title.
set laststatus=2                  " Always show the status line.
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %=%-16(\ %l,%c-%v\ %)%P

" ===== Configure Vim =====

set encoding=utf-8                " Use utf-8 as default encoding.
set history=1000                  " Save last 1000 commands in vim history.
set spelllang=en_au               " Use Australian English.
set clipboard=unnamed             " Put from the Mac clipboard.
set hidden                        " Don't warn when leaving an unsaved buffer.
set wildmenu                      " Enhanced command line completion.
set wildmode=longest,list         " Fix tab completion for file names.
set ignorecase                    " Case-insensitive searching.
set smartcase                     " Case-sensitive if contains a capital letter.
set autoread                      " Automatically re-read changed files.
set autowrite                     " Save before commands like :make.
set smartindent                   " Automatically indent after {
set expandtab                     " Expand tab to spaces.
set tabstop=2                     " Replace tab with 2 spaces.
set shiftwidth=2                  " Make > command indent by 2 spaces.
set linebreak                     " Wrap lines at a sensible point.
set backspace=indent,eol,start    " Intuitive backspacing.
set formatoptions-=cro            " Disable automatic comment continuation.

" Use stronger encryption
if v:version >= 704
  set cryptmethod=blowfish2
else
  set cryptmethod=blowfish
endif
set tags=./.git/tags,./tags,.git/tags,tags  " Where to find ctags file

" Disable automatic comment continuation
autocmd FileType * setlocal formatoptions-=cro

" When reopening a file, jump to the last location
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                      \| exe "normal! g'\"" | endif

" Make the & command preserve the substitution flags.
nnoremap & :&&<CR>
xnoremap & :&&<CR>


" ===== Keyboard Shortcuts =====

" Use jk to return to normal mode
inoremap jk <Esc>
cnoremap jk <Esc>

" Use space bar as leader key
let mapleader=" "
" Disable space as a command
nnoremap <Space> <Nop>
" Prevent vim trying to paste last insert buffer when you hit <C-Space>
inoremap <Nul> <Space>

" Write with sudo
cnoremap w!! w !sudo dd of=%

" Turn spell-check on and off
nnoremap <silent> <leader>s :set spell!<CR>

" Add a line above or below with <Space>k or <Space>j and stay in normal mode
nnoremap <leader>j o<Esc>
nnoremap <leader>k O<Esc>

" Delete trailing white space with <Space>w
nnoremap <leader>w :%s/\v\s+$//<CR>

" <Space>l to clear search highlighting, turn off spell checking and redraw the
" screen.
nnoremap <leader>l :<C-u>nohlsearch<CR>:set nospell<CR><C-l>


" ===== Plugin Configuration =====

" ------ kien/ctrlp.vim ------
" Files and folders we don't want CtrlP to match
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v\C(/\.(git|hg|svn)|/node_modules|/coverage|/dbd?|O\..*)$',
  \ 'file': '\v\.(exe|so|dll|pyc|png|jpg|gif)$',
  \ }

" ------ plasticboy/vim-markdown.git ------
let g:vim_markdown_folding_disabled = 1    " Disable folding

" ------ ervandew/supertab ------
let g:SuperTabDefaultCompletionType = "<c-n>"

" ------ tpope/vim-dispatch ------
autocmd FileType tex let b:dispatch = 'latexmk -pdf %'
autocmd FileType javascript let b:dispatch = 'node %'
autocmd FileType python let b:dispatch = 'python %'
nnoremap <leader>d :Dispatch<CR>


" ===== Special Filetype Configuration =====

" Set filetypes of unmatched files
autocmd BufRead,BufNewFile *.ejs set filetype=html
autocmd BufRead,BufNewFile *.stt set filetype=c
autocmd BufRead,BufNewFile .bash_local set filetype=sh
autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby

autocmd FileType javascript nnoremap <leader>t :!npm test<CR>
autocmd FileType javascript nnoremap <leader>r :!node --expose_gc %<CR>
autocmd FileType json nnoremap <leader>t :!npm test<CR>
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType python nnoremap <leader>t :!python manage.py test<CR>
autocmd FileType python nnoremap <leader>u :!python -m unittest discover<CR>
autocmd FileType python nnoremap <leader>r :!python %<CR>
autocmd FileType mkd nnoremap o A<CR>
