if expand('%:p') =~ 'Dropbox/Notes'
  nnoremap <buffer> <Left> :lpfile<cr>
  nnoremap <buffer> <Right> :lnfile<cr>
  nnoremap <buffer> <Up> :lprevious<cr>
  nnoremap <buffer> <Down> :lnext<cr>
endif
