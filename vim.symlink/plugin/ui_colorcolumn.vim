
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=1 foldmethod=marker:
" ColorColumn {

" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/
" "highlight ColorColumn ctermbg=235 guibg=#2c2d27

" if exists('+colorcolumn')
"     " All columns past 80.
"     let &colorcolumn=join(range(81,999),",")
"     " Just column 80
"     " set colorcolumn=80
" else
" " Color column - Highlight any text longer than 80 char.
"     au BufWinEnter * let w:m2=matchadd('ColorColumn', '\%80v.\+',-1)
" endif

" highlight ColorColumn term=reverse ctermbg=1 guibg=LightRed
highlight! ColorColumn term=reverse ctermbg=235 guibg=LightGrey
" augroup colorcolumn
"     autocmd!
"     autocmd ColorScheme solarized highlight ColorColumn term=reverse ctermbg=1 guibg=LightRed
"     autocmd ColorScheme * highlight ColorColumn term=reverse ctermbg=235 guibg=LightGrey
" augroup end
" }

