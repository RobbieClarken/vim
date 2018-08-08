if expand('%:p') =~ 'Dropbox/Notes'
  nnoremap <leader>y :echo "YEAH!"<cr>
  nnoremap <buffer> <Left> :lpfile<cr>
  nnoremap <buffer> <Right> :lnfile<cr>
  nnoremap <buffer> <Up> :lprevious<cr>
  nnoremap <buffer> <Down> :lnext<cr>
endif
