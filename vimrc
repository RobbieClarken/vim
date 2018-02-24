set nocompatible                  " Use Vim-only features

" ===== Load Plugins =====

call plug#begin('~/.vim/plugged')
Plug 'wincent/terminus'                 " mouse support, reload on focus, handle window resize
Plug 'vim-airline/vim-airline'          " Better status line
Plug 'vim-airline/vim-airline-themes'   " Themes for vim-airline
Plug 'tpope/vim-repeat'                 " Add . support to plugin commands
Plug 'tpope/vim-surround'               " Change parentheses and quotes
Plug 'tpope/vim-unimpaired'             " Handy bracket mappings (see :help unimpaired)
Plug 'tpope/vim-abolish'                " Change variable case format
Plug 'tpope/vim-fugitive'               " Git support
Plug 'tpope/vim-projectionist'          " Switching from test file to implementation file
Plug 'tpope/vim-commentary'             " Comment / uncomment code
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }  " Install fzf
Plug 'junegunn/fzf.vim'                 " Fuzzy find files with ctrl-p
Plug 'SirVer/ultisnips'                 " Code snippets manager
Plug 'ntpeters/vim-better-whitespace'   " Highlight trailing whitespace
Plug 'triglav/vim-visual-increment'     " Create column of ascending numbers
Plug 'tommcdo/vim-exchange'             " Swap regions of text
Plug 'christoomey/vim-tmux-navigator'   " Navigate between vim and tmux panes
Plug 'pangloss/vim-javascript'          " JavaScript syntax support
Plug 'mxw/vim-jsx'                      " JSX syntax support
Plug 'tmux-plugins/vim-tmux'            " tmux.conf syntax support
Plug 'lervag/vimtex'                    " LaTeX syntax support
Plug 'wannesm/wmgraphviz.vim'           " Graphviz dot file syntax support
Plug 'Glench/Vim-Jinja2-Syntax'         " Jinja2 syntax support
Plug 'vim-scripts/ReplaceWithRegister'  " use grr
Plug 'w0rp/ale'                         " Asynchronous linter
Plug 'vimwiki/vimwiki'                  " Personal wiki
Plug 'Vimjas/vim-python-pep8-indent'    " PEP8 indentation
Plug 'xtal8/traces.vim'                 " Show outcome of substitution in realtime
Plug 'chriskempson/base16-vim'          " base16 themes
call plug#end()

filetype plugin indent on         " Enable loading plugins by filetype
runtime macros/matchit.vim        " Jump between opening and closing xml tags with %

" ===== Set Styling =====

set t_Co=256                      " Use 256 colors
syntax enable                     " Turn on syntax highlighting.
set number                        " Show current line number.
set colorcolumn=90                " Discourage excessively long lines of code.
set hlsearch                      " Highlight search matches.
set incsearch                     " Highlight search matches as you type.
set title                         " Set the terminal's title.
set laststatus=2                  " Always show the status line.

" Show tabs as fancy unicode characters
set listchars=tab:└─
set list

" Use base16
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

highlight ColorColumn ctermbg=236
highlight Comment cterm=italic
highlight Type cterm=italic

" ===== Configure Vim =====

set encoding=utf-8                " Use utf-8 as default encoding.
set history=1000                  " Save last 1000 commands in vim history.
set spelllang=en_au               " Use Australian English.

" Copy/paste to Mac and X clipboard.
if has('mac')
  set clipboard=unnamed
else

  set clipboard=unnamedplus

  if executable("xsel")

    function! PreserveClipboard()
      call system("xsel -ib", getreg('+'))
    endfunction

    function! PreserveClipboadAndSuspend()
      call PreserveClipboard()
      suspend
    endfunction

    autocmd VimLeave * call PreserveClipboard()
    nnoremap <silent> <c-z> :call PreserveClipboadAndSuspend()<cr>
    vnoremap <silent> <c-z> :<c-u>call PreserveClipboadAndSuspend()<cr>

  endif

endif

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
set nrformats-=octal              " Make <C-a> behave sensibly for numbers with leading zeros.
set diffopt+=vertical             " Use vertical splits for viewing diffs
set splitbelow                    " Make horizontal splits (eg Gstatus) appear at the bottom
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

if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j                " Remove comment leader when joining comment lines
endif

set scrolloff=3                       " Start scrolling 3 lines before edge of viewport

" Ignore annoying swapfile messages; we don't care about opening the file in multiple buffers
" because wincent/terminus will always reload changed files on focus
set shortmess+=A

if has('linebreak')
  let &showbreak='⤷ '
endif

" Make the & command preserve the substitution flags.
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Readline commands in command mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Store large relative jumps in jumplist
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : '') . 'j'

" ===== Keyboard Shortcuts =====

" Write with sudo
cnoremap w!! w !sudo dd of=%

" Use jk to return to normal mode
inoremap jk <Esc>
cnoremap jk <Esc>

nnoremap <Left> :cpfile<cr>
nnoremap <Right> :cnfile<cr>
nnoremap <Up> :cprevious<cr>
nnoremap <Down> :cnext<cr>

nnoremap <leader>q :keepalt bdelete<cr>

" Enable moving visually selected lines up and down
xmap J ]egv=gv
xmap K [egv=gv

" Use space bar as leader key
let mapleader=" "
" Disable space as a command
nnoremap <Space> <Nop>
" Prevent vim trying to paste last insert buffer when you hit <C-Space>
inoremap <Nul> <Space>

" Alternate buffers
nnoremap <leader><leader> <c-^>

nnoremap <leader>w :write<cr>

nnoremap <leader>v :source ~/.vimrc<CR>

nnoremap <leader><left> :vertical resize +10<CR>
nnoremap <leader><right> :vertical resize -10<CR>
nnoremap <leader><up> :resize +5<CR>
nnoremap <leader><down> :resize -5<CR>

" Generate ctags
nnoremap <leader>] :silent execute '!ctags -R . >/dev/null &' \| execute ':redraw!'<CR>
autocmd FileType javascript nnoremap <leader>] :silent execute '!es-ctags -R . >/dev/null &' \| execute ':redraw!'<CR>

" Delete trailing white space with <Space>w
nnoremap <leader>s :StripWhitespace<cr>

" <Space>l to clear search highlighting, turn off spell checking and redraw the screen.
nnoremap <leader>l :nohlsearch \| set nospell<CR><C-l>

" Run all tests with <Space>t or just the current test file with <Space>T
autocmd FileType cpp nnoremap <leader>t :!make test && ./test -c<CR>
autocmd FileType cucumber nnoremap <leader>t :!pytest -v<CR>
autocmd FileType javascript nnoremap <leader>t :!npm test<CR>
autocmd FileType php nnoremap <leader>t :!phpunit -c tests/phpunit.xml --color tests/unit/<CR>
autocmd FileType php nnoremap <leader>T :!phpunit -c tests/phpunit.xml --color %<CR>
autocmd FileType python nnoremap <leader>t :!pytest -m 'not slow' -v --tb=short tests/<CR>
autocmd FileType python nnoremap <leader>T :!pytest -m 'not slow' -v --tb=short %<CR>
autocmd FileType ruby nnoremap <leader>t :!bundle exec rspec<CR>

" Underline current line with equals signs (for rst headings)
nnoremap <leader>= YpVr=

" ------ Opening Files ------

autocmd FileType html nnoremap <leader>o :!open -a 'Google Chrome' %<CR>

" ------ grepping -----

if executable("rg")
  set grepprg=rg\ -S\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m
endif

command -nargs=+ -complete=file -bar Rg silent! grep <args>|redraw!

" ===== Plugin Configuration =====

" ------ junegunn/fzf.vim ------
nnoremap <C-p> :Files<cr>

" ------ christoomey/vim-tmux-navigator ------
" Enable quick navigation between windows from visual mode
xnoremap <silent> <c-h> <Esc>:TmuxNavigateLeft<cr>
xnoremap <silent> <c-j> <Esc>:TmuxNavigateDown<cr>
xnoremap <silent> <c-k> <Esc>:TmuxNavigateUp<cr>
xnoremap <silent> <c-l> <Esc>:TmuxNavigateRight<cr>

" ------ lervag/vimtex ------
let g:vimtex_view_method='skim'

" ------ vim-airline/vim-airline ------
let g:airline_left_sep = ' »'
let g:airline_right_sep = '« '
let g:airline_theme='bubblegum'

" ------ mxw/vim-jsx ------
let g:jsx_ext_required = 0

" ----- w0rp/ale -----

" Run ALE only when saving
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'

let g:ale_open_list = 1
let g:ale_python_mypy_options = '--ignore-missing-imports'

" Fix rendering issues:
nnoremap <leader>a :ALEDisable<cr> \| :ALEEnable<cr>

" ----- vimwiki/vimwiki -----
let g:vimwiki_list = [{'path': '~/Dropbox/Notes/', 'syntax': 'markdown', 'ext': '.md'}]

" ----- SirVer/ultisnips -----
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips/"


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
autocmd BufRead,BufNewFile wscript set filetype=python
autocmd BufRead,BufNewFile *.spec set filetype=python
autocmd BufRead,BufNewFile .eslintrc set filetype=yaml

" Filetype specific customisations
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType mkd nnoremap o A<CR>
autocmd FileType markdown setlocal textwidth=90
autocmd FileType rst setlocal shiftwidth=3 tabstop=3 textwidth=94
autocmd FileType jinja setlocal shiftwidth=2 tabstop=2
autocmd FileType php setlocal shiftwidth=4 tabstop=4
autocmd FileType crontab setlocal commentstring=#\ %s
autocmd FileType expect setlocal commentstring=#\ %s


" ===== Local vim configuration =====

if filereadable(".git/vimrc")
  source .git/vimrc
endif

if filereadable("../.git/vimrc")
  source ../.git/vimrc
endif
