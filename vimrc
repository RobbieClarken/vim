set nocompatible                  " use iMproved features
filetype off                      " required for vundle

set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
cmap w!! w !sudo dd of=%
colorscheme molokai
syntax on
set number

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'klen/python-mode'
Bundle 'LaTeX-Box-Team/LaTeX-Box'
Bundle 'pangloss/vim-javascript'
Bundle 'digitaltoad/vim-jade'

filetype plugin indent on

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

inoremap jj <Esc>

" Python mode
let g:pymode_lint_write = 0
let g:pymode_folding = 0

" LaTeX-Box settings
imap <buffer> ]]		  <Plug>LatexCloseCurEnv
map <silent> <Leader>ls :silent !/Applications/Skim.app/Contents/SharedSupport/displayline <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>" "%:p" <CR>
let g:LatexBox_viewer = 'skim'
let g:LatexBox_latexmk_options = '-pvc'

autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType tex setlocal shiftwidth=4 tabstop=4
autocmd FileType js setlocal shiftwidth=2 tabstop=2

" Fix tab completion for file names
set wildmode=longest,list

set clipboard=unnamed
