" More italics in javascript!

exec 'highlight jsSuper' .
            \' term=underline' .
            \' ctermfg=' . synIDattr(synIDtrans(hlID('Constant')), 'fg', 'cterm') .
            \' guifg=' . synIDattr(synIDtrans(hlID('Constant')), 'fg', 'gui')


highlight Keyword cterm=italic
highlight Conditional cterm=italic
highlight Include cterm=italic

" const, let, var
highlight StorageClass cterm=italic

highlight jsSuper cterm=italic
highlight jsReturn cterm=italic
highlight jsThis cterm=italic
highlight jsStatement cterm=italic
highlight jsClassMethodType cterm=italic
