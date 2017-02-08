
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:

set background=dark

" ColorSchemes {

" Favorites:
" colorscheme desert
if &runtimepath =~ 'anotherdark' "{
colorscheme anotherdark
endif "}
" colorscheme jellybeans

" Others:
"Color schemes (uncomment one of the schemes below)

" colorscheme badwolf
" colorscheme sialoquent
" colorscheme xoria256

if &runtimepath =~ 'vim-colors-solarized' " {
" colorscheme solarized
endif " 'vim-colors-solarized'
" }

" wobat: Lots of blue
" colorscheme wombat

" molokai: Some are vibrant, but many are dull.
" colorscheme molokai

" base16-atelierdune is very neon green.
" colorscheme base16-atelierdune

" bubblegum has way to much grey.
" colorscheme bubblegum

" darkburn isn't bad but a little dull. Lots of a greyish-green
" colorscheme darkburn

" Missing:
" colorscheme tomorrow " TODO: install https://github.com/chriskempson/vim-tomorrow-theme
" colorscheme base16-tomorrow
" colorscheme base16-greenscreen 
" colorscheme base16-eighties
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
highlight  DiffAdd     cterm=none  ctermfg=Green  ctermbg=DarkGrey  gui=none  guifg=Green  guibg=black
highlight  DiffDelete  cterm=none  ctermfg=Red    ctermbg=DarkGrey  gui=none  guifg=Red    guibg=black
highlight  DiffChange  cterm=none  ctermfg=LightGrey  ctermbg=DarkGrey  gui=none  guifg=White  guibg=DarkGrey
highlight  DiffText    cterm=none  ctermfg=White   ctermbg=DarkYellow  gui=none  guifg=White   guibg=DarkYellow

" }
