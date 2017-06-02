set nocompatible                  " Use Vim-only features

" ===== Load Plugins =====

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'          " Better status line
Plug 'vim-airline/vim-airline-themes'   " Themes for vim-airline
Plug 'tpope/vim-repeat'                 " Add . support to plugin commands
Plug 'tpope/vim-surround'               " Change parentheses and quotes
Plug 'tpope/vim-unimpaired'             " Handy bracket mappings (see :help unimpaired)
Plug 'tpope/vim-abolish'                " Change variable case format
Plug 'tpope/vim-dispatch'               " Asynchronous build dispatcher
Plug 'tpope/vim-fugitive'               " Git support
Plug 'kien/ctrlp.vim'                   " Fuzzy file finder
Plug 'SirVer/ultisnips'                 " Code snippets manager
Plug 'bronson/vim-trailing-whitespace'  " Highlight trailing whitespace
Plug 'triglav/vim-visual-increment'     " Create column of ascending numbers
Plug 'tommcdo/vim-exchange'             " Swap regions of text
Plug 'tpope/vim-commentary'             " Comment / uncomment code
Plug 'christoomey/vim-tmux-navigator'   " Navigate between vim and tmux panes
Plug 'nvie/vim-flake8'                  " Run flake8 on python files
Plug 'pangloss/vim-javascript'          " JavaScript syntax support
Plug 'mxw/vim-jsx'                      " JSX syntax support
Plug 'tmux-plugins/vim-tmux'            " tmux.conf syntax support
Plug 'lervag/vimtex'                    " LaTeX syntax support
Plug 'wannesm/wmgraphviz.vim'           " Graphviz dot file syntax support
Plug 'Glench/Vim-Jinja2-Syntax'         " Jinja2 syntax support
Plug 'dhruvasagar/vim-table-mode'       " Awesome markdown table editing
Plug 'vim-scripts/ReplaceWithRegister'  " use grr
Plug 'w0rp/ale'                         " Asynchronous linter
Plug 'vimwiki/vimwiki'                  " Personal wiki
call plug#end()

filetype plugin indent on         " Enable loading plugins by filetype
runtime macros/matchit.vim        " Jump between opening and closing xml tags with %


" ===== Set Styling =====

set t_Co=256                      " Use 256 colors
syntax enable                     " Turn on syntax highlighting.
set relativenumber                " Show relative line numbers.
set number                        " Also show current line number.
set colorcolumn=82                " Indicate the 82nd column to help avoid.
                                  " writing excessively long lines of code.
set hlsearch                      " Highlight search matches.
set incsearch                     " Highlight search matches as you type.
set title                         " Set the terminal's title.
set laststatus=2                  " Always show the status line.
set listchars=eol:¬,tab:▸\        " Pretty characters for tab and end of line

highlight ColorColumn ctermbg=236


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
set nojoinspaces                  " Joining sentences should only insert 1 space.
set formatoptions-=cro            " Disable automatic comment continuation.
set nrformats-=octal              " Make <C-a> behave sensibly for numbers with
                                  " leading zeros.
set diffopt+=vertical             " Use vertical splits for viewing diffs
set splitbelow                    " Make horizontal splits (eg Gstatus) appear at
                                  " the bottom
set splitright                    " Make new vertical splits appear on the right

set path+=**                      " Make :find look in subdirectories

" Add folders that vimgrep shouldn't search
set wildignore+=.venv/**
set wildignore+=.git/**
set wildignore+=node_modules/**
set wildignore+=dist/**
set wildignore+=coverage/**
set wildignore+=**.pyc
set wildignore+=**.ipynb
set wildignore+=*.egg-info/**
set wildignore+=tmp/**
set wildignore+=docs/_build/**
set wildignore+=db/**
set wildignore+=dbd/**
set wildignore+=vendor/**
set wildignore+=temp/**
set wildignore+=tags
set wildignore+=**.class

" Prevent ins-completion from looking in node_modules
set complete-=i

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

" Alternate buffers
nnoremap <leader><leader> <c-^>

" Write with sudo
cnoremap w!! w !sudo dd of=%

" Ctrl-o in insert mode to insert a line above
inoremap <C-o> <Esc>O

nnoremap <leader>v :source ~/.vimrc<CR>

nnoremap <leader><left> :vertical resize +10<CR>
nnoremap <leader><right> :vertical resize -10<CR>
nnoremap <leader><up> :resize +5<CR>
nnoremap <leader><down> :resize -5<CR>

" Generate ctags
nnoremap <leader>] :silent execute '!ctags -R . >/dev/null &' \| execute ':redraw!'<CR>

" Delete trailing white space with <Space>w
nnoremap <leader>s :%s/\v\s+$// \| :nohlsearch<CR>

" <Space>l to clear search highlighting, turn off spell checking and redraw the screen.
nnoremap <leader>l :nohlsearch \| set nospell<CR><C-l>

" Use <Space>d to run dispatch
nnoremap <leader>d :Dispatch<CR>

" ------ Executing Scripts ------

" Use <Space>r to execute scripts
autocmd FileType javascript nnoremap <leader>r :!node --expose_gc %<CR>
autocmd FileType python nnoremap <leader>r :!python3 %<CR>
autocmd FileType sh nnoremap <leader>r :!/bin/bash %<CR>
autocmd FileType java nnoremap <leader>r :!javac % && java %:r<CR>

" ------ Running Tests ------

" Use <Space>t to run tests
autocmd FileType javascript nnoremap <leader>t :!npm test<CR>
autocmd FileType python nnoremap <leader>t :!pytest -m 'not slow' -v --tb=short tests/<CR>
autocmd FileType ruby nnoremap <leader>t :!bundle exec rspec<CR>
autocmd FileType cucumber nnoremap <leader>t :!pytest -v<CR>
autocmd FileType cpp nnoremap <leader>t :!make test && ./test -c<CR>

" Use <Space>T to test individual modules
autocmd FileType python nnoremap <leader>T :!pytest -m 'not slow' -v --tb=short %<CR>
autocmd FileType javascript nnoremap <leader>T :!./node_modules/.bin/mocha --compilers js:babel-core/register --require ./tests/helper.js %<CR>

" Use <Space>w to test wip tests
autocmd FileType python nnoremap <leader>w :!pytest -m wip -v --tb=short tests/<CR>
autocmd FileType python nnoremap <leader>W :!pytest -m wip -v --tb=short %<CR>

" Underline current line with equals signs (for rst headings)
nnoremap <leader>= YpVr=

" ------ Linting ------

autocmd FileType python nnoremap <leader>f :call Flake8()<CR>
autocmd FileType javascript nnoremap <leader>f :!yarn eslint %<cr>

" ------ Opening Files ------

autocmd FileType html nnoremap <leader>o :!open -a 'Google Chrome' %<CR>


" ===== Plugin Configuration =====

" ------ kien/ctrlp.vim ------
" Files and folders we don't want CtrlP to match
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v\C(
            \/\.(git|hg|svn)
            \|/tmp
            \|/node_modules
            \|/coverage
            \|/(db|dbd)
            \|/bin/darwin-x86
            \|O\..*
            \|vendor
            \|temp
            \)$',
  \ 'file': '\v\.(exe|so|dll|pyc|png|jpg|gif)$',
\ }
let g:ctrlp_use_caching = 0
let g:ctrlp_working_path_mode=0

" ------ vim-airline/vim-airline ------
let g:airline_left_sep = ' »'
let g:airline_right_sep = '« '
let g:airline_theme='bubblegum'

" ------ mxw/vim-jsx ------
let g:jsx_ext_required = 0

" ------ dhruvasagar/vim-table-mode ------
" activate table mode with <Leader>mm to avoid colision with test shortcut
let g:table_mode_map_prefix = '<Leader>m'
let g:table_mode_corner="|"

" ----- w0rp/ale -----
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_open_list = 1
let g:ale_python_mypy_options = '--ignore-missing-imports'


" ===== Filetype Configuration =====

" Indent <head> and <body> tags in HTML
let g:html_indent_inctags = "html,body,head,tbody"

" Set filetypes of unmatched files
autocmd BufRead,BufNewFile *.ejs set filetype=html
autocmd BufRead,BufNewFile *.stt set filetype=c
autocmd BufRead,BufNewFile .bash_local set filetype=sh
autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby
autocmd BufRead,BufNewFile *.sls set filetype=yaml
autocmd BufRead,BufNewFile *.dockerfile set filetype=dockerfile

" Filetype specific customisations
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType mkd nnoremap o A<CR>
autocmd FileType markdown set textwidth=90
autocmd FileType rst setlocal shiftwidth=3 tabstop=3 textwidth=94
autocmd FileType jinja setlocal shiftwidth=2 tabstop=2
autocmd FileType php setlocal shiftwidth=4 tabstop=4

let maplocalleader = "\\"

iabbrev teh the

highlight Comment cterm=italic
highlight Type cterm=italic

highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
