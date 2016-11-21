
set background=dark

" ColorSchemes {

" Favorites:
" colorscheme desert
colorscheme jellybeans

" Others:
"Color schemes (uncomment one of the schemes below)
" colorscheme badwolf
" colorscheme xoria256
" colorscheme solarized
" colorscheme base16-atelierdune
" colorscheme bubblegum
" colorscheme base16-tomorrow
" colorscheme base16-eighties
" colorscheme darkburn

" Missing:
" colorscheme tomorrow " TODO: install https://github.com/chriskempson/vim-tomorrow-theme
" colorscheme base16-greenscreen 
" }

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

" Highlight {

" Overloading the default color scheme.
" highlight  Normal      term=none   cterm=none  ctermfg=darkgrey  ctermbg=Black
" highlight  DiffAdd     cterm=none  ctermfg=fg  ctermbg=Blue   gui=none       guifg=fg  guibg=Blue
" highlight  DiffDelete  cterm=none  ctermfg=fg  ctermbg=Blue   gui=none       guifg=fg  guibg=Blue
" highlight  DiffChange  cterm=none  ctermfg=fg  ctermbg=Blue   gui=none       guifg=fg  guibg=Blue
" highlight  DiffText    cterm=none  ctermfg=bg  ctermbg=White  gui=none       guifg=bg  guibg=White

" }
