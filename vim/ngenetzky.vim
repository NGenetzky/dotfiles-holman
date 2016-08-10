" Nathan Genetzky
" ngenetzky@usgs.gov | nathan@genetzky.us
" References:
" registers:http://stackoverflow.com/a/3997110
" vimgrep+regex+magic:http://vi.stackexchange.com/a/2279
" Example vimrc stuff: https://github.com/amix/vimrc
"
" Example vimrc
" https://github.com/seejohnrun/dotfiles/blob/master/.vimrc
" http://chibicode.com/vimrc/
" https://github.com/skwp/dotfiles
" https://github.com/joedicastro/dotfiles/tree/master/vim

set encoding=utf-8
scriptencoding utf-8

" Basic options ----------------------------------------------------------- {{{

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

set noautoindent
" wrap: lines longer than the width of the window will wrap and displaying
" continues on the next line
set wrap
" Turn off spell checking.
set nospell

" Mouse is only available in normal and visual mode.
set mouse=nv
set mousehide

" Better command-line completion
" set wildmenu            " visual autocomplete for command menu
set wildmode=longest:full,list:full

" Show partial commands in the last line of the screen
set showcmd

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Turn auto-wrapping off.
set formatoptions-=t

" Shows syntax highlighting
syntax on

set cryptmethod=blowfish

set previewheight=20

set exrc
set secure

" This conditional would cause the system clipboard to be used by default.
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

" }}}
" Plugin settings --------------------------------------------------------- {{{1

source ~/.dotfiles/vim/setup_clang_format.vim
source ~/.dotfiles/vim/setup_fugitive.vim
source ~/.dotfiles/vim/setup_syntastic.vim
source ~/.dotfiles/vim/setup_project.vim
source ~/.dotfiles/vim/setup_gdb_from_vim.vim
source ~/.dotfiles/vim/setup_ultisnips.vim
" source ~/.dotfiles/vim/setup_vundle.vim
" source ~/.dotfiles/vim/setup_lightline.vim
" source ~/.dotfiles/vim/setup_c.vim
" source ~/.dotfiles/vim/setup_ycm.vim
" source ~/.dotfiles/vim/setup_golden_view.vim
" source ~/.dotfiles/vim/setup_unite.vim
" call SetupUnite()
" source ~/.dotfiles/vim/setup_ctrl_p.vim

" }}}
" Searching -------------------------------------------------- {{{

" Use case insensitive search,
set ignorecase
" except when using capital letters
set smartcase

" Highlight searches (use <C-L> to temporarily clear highlighting; see the
" mapping of <C-L> below)
set hlsearch

" }}}
" Indentation options ----------------------------------------------------- {{{

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4

"------------------------------------------------------------
" }}}
" Font and Schemes -------------------------------------------------------- {{{

" Color schemes (uncomment one of the schemes below)
colorscheme desert
" colorscheme badwolf
" colorscheme xoria256
" colorscheme jellybeans
" colorscheme solarized
" colorscheme base16-atelierdune
" colorscheme bubblegum
" colorscheme base16-tomorrow
" colorscheme base16-greenscreen
" colorscheme base16-eighties
" colorscheme darkburn
 " colorscheme tomorrow " TODO: install https://github.com/chriskempson/vim-tomorrow-theme

set guifont=Monospace\ Bold\ 10
"set guifont=Courier\ 10\ Pitch\ Bold\ 7
"set guifont=Bitstream\ Vera\ Sans\ Mono\ Bold\ 7
set background=dark
set guioptions=aegimrLt

" }}}
" List -------------------------------------------------------------------- {{{
" Replace bad characters with unicode so they are seen easily
" src: Damian Conway, More Instanly Better Vim  Sep 10 2013 on Youtube
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
" src: https://github.com/lukemetz/vim/blob/8466bdde18b0e33a000324fc22bb9092798dbe45/gvimrc
" set listchars=trail:·,precedes:«,extends:»,tab:»
set list
set listchars=tab:».,trail:·,nbsp:.
" }}}
" Undo and Backups -------------------------------------------------------- {{{
set undofile   " Maintain undo history between sessions
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backup

" Directory used for swap files
set dir=/var/tmp

" }}}
" Highlighting ------------------------------------------------------------- {{{

" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/
" "highlight ColorColumn ctermbg=235 guibg=#2c2d27

if exists('+colorcolumn')
    " All columns past 80.
    let &colorcolumn=join(range(81,999),",")
    " Just column 80
    " set colorcolumn=80
else
" Color column - Highlight any text longer than 80 char.
    au BufWinEnter * let w:m2=matchadd('ColorColumn', '\%80v.\+',-1)
endif

" highlight ColorColumn term=reverse ctermbg=1 guibg=LightRed
highlight! ColorColumn term=reverse ctermbg=235 guibg=LightGrey
augroup colorcolumn
    autocmd!
    " autocmd ColorScheme solarized highlight ColorColumn term=reverse ctermbg=1 guibg=LightRed
    autocmd ColorScheme * highlight ColorColumn term=reverse ctermbg=235 guibg=LightGrey
augroup end

" }}}
" Filetype specific ----{{{1
" Markdown ------------------------------------------------------------{{{2
au! BufRead,BufNewFile *.markdown set filetype=mkd
au! BufRead,BufNewFile *.md       set filetype=mkd
au! BufRead,BufNewFile *.md       set spell
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let g:markdown_syntax_conceal = 0
" }}}

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s
au BufNewFile,BufRead  *.bash_*  set filetype=sh
" autocmd FileType vim setlocal foldmethod=marker
" autocmd FileType cpp,c,h setlocal foldmethod=syntax
" Note, perl automatically sets foldmethod in the syntax file
autocmd Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax
autocmd Syntax c,cpp,vim,xml,html,xhtml,perl normal zR

" au BufRead */Desktop/*/*  set tw=31
"}}}
" Mappings ------------------------------------------------------------{{{1

source ~/.dotfiles/vim/mappings.vim

"------------------------------------------------------------
" }}}
" Functions ------------------------------------------------------------{{{1
source ~/.dotfiles/vim/functions.vim
function! InstallSPF13()
    !curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
endfunction
function! InstallVundle()
    !git clone https://github.com/gmarik/vundle.git ~/.dotfiles/vim/bundle/Vundle.vim
endfunction
" }}}

" Projects ------------------------------------------------------------{{{1
" augroup ProjectSetup
" au BufRead,BufEnter ~/workspace/Kadoka/Kadoka/UserApplications/libraries/librrdb/* set tw=90
" au BufRead,BufEnter ~/workspace/Kadoka/Kadoka/UserApplications/sysmon/* set tw=91
" augroup END

function! Project_librrdb()
    set makeprg=make
    nooremap <buffer> <localleader>t :make test
    nooremap <buffer> <localleader>l :make test RrdtoolTestSuite
endfunction
"     let l:path = expand('%:p')
"     if l:path == expand('~/workspace/Kadoka/Kadoka/UserApplications/libraries/librrdb/')
"         let @m='iworks'
"         if &filetype == 'yaml'
"             let @n='iworks'
"         else
"             let @n='iworks'
"         endif
"     elseif l:path == expand('~/workspace/Kadoka/Kadoka/UserApplications/k')
"         let @m='iworks for both'
"     endif
" endfunction


" }}}
