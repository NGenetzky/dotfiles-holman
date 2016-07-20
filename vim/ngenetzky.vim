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
" TODO: Maybe turn it on for Markdown files?
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

" }}}
" Plugin settings --------------------------------------------------------- {{{1

source ~/.dotfiles/vim/setup_clang_format.vim
source ~/.dotfiles/vim/setup_fugitive.vim
source ~/.dotfiles/vim/setup_syntastic.vim
source ~/.dotfiles/vim/setup_project.vim
source ~/.dotfiles/vim/setup_gdb_from_vim.vim
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

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
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

" Color schemes (uncomment one of the rows below)
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

" jk is escape in insert mode
inoremap jk <esc>

" use ; as :
" nnoremap ; :

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy
" which is the default
map Y y$

" Converting case
" Change selected text from name_like_this to NameLikeThis.
vnoremap crc :s/_\([a-z]\)/\u\1/g<CR>gUl
" Change selected text from NameLikeThis to name_like_this.
vnoremap crs :s/\<\@!\([A-Z]\)/\_\l\1/g<CR>gul

" highlight last inserted text
nnoremap gV `[v`]

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Split Navigation (Required for C9.io where <C-W> would exit the browswer.)
noremap gh <C-W>h
noremap gj <C-W>j
noremap gk <C-W>k
noremap gl <C-W>l

noremap <leader>x :bn<CR>

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>x :bn<CR>

"" Tab nav
noremap <leader>q gT
noremap <leader>w gt
noremap <C-t>h gT
noremap <C-t>l gt

"" Copy/Paste/Cut
" This conditional would cause the system clipboard to be used by default.
" if has('unnamedplus')
"   set clipboard=unnamed,unnamedplus
" endif
noremap YY "+y
noremap PP "+gP
noremap XX "+x

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Function Key Mappings ----------------------------------

nmap <F2> :NERDTreeToggle<CR>
nmap <silent> <F3> <Plug>ToggleProject
nmap <F4> :GundoToggle<CR>
nmap <F5> :TagbarToggle<CR>
nmap <F6> :ToggleGStatus<CR>

" Defined in setup_syntastic
nmap <F9> :SyntasticCheck<CR>
nmap <F12> :SyntasticReset<CR>

" Force the width to be 80 char wide
nmap <F8> :vertical resize 80<CR>

" Leader mappings   ---------------------------------------
let mapleader=","       " leader is comma

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" Save or load session
nnoremap <leader>s :mksession ~/.vim/sessions/
nnoremap <leader>l :source ~/.vim/sessions/

" session management (needs a plugin?)
" nnoremap <leader>so :OpenSession
" nnoremap <leader>ss :SaveSession
" nnoremap <leader>sd :DeleteSession<CR>
" nnoremap <leader>sc :CloseSession<CR>

" Insert a space and then return to visual mode
noremap <leader><Space> i 

" Search for text within highlighted section only.
vnoremap <leader>/ <Esc>/\%V

" Insert Date(d) or Time(t)
noremap <leader>d :put =strftime('%Y-%m-%d')<C-M>
noremap <leader>t :put =strftime('%H:%M')<C-M>

" Refresh my source file
noremap <leader>r :so ~/.vimrc<CR>

" Surround word with quote
" Imported from:
" https://mkaz.github.io/2011/08/31/vim-cheat-sheet/
nmap <Leader>' ysiw'
nmap <Leader>" ysiw"

" Add Trailing Semi-colon
map <Leader>; g_a;<Esc>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>
nnoremap <leader>.. :lcd ..<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Uses a tmp file as a global clipboard
vmap <leader>y :w! /tmp/vitmp<CR>
nmap <leader>p :r! cat /tmp/vitmp<CR>
nmap <leader>x :w! >>/tmp/vim_cut \|'<,'>d

nmap <leader>8 80A <Esc>d80|

" Saves all files that have been modified and runs make. \| is required to use
" the bar/pipe inside the mapping.
map <leader>m :update \| make <CR>

vmap <leader>c :!column -t<CR>

map <leader>w :w<CR>

nmap <leader>n :call OpenInNano(expand('%:p'))<CR>

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
set exrc
set secure
au BufRead ~/workspace/Kadoka/Kadoka/UserApplications/libraries/librrdb/* set tw=90
au BufRead ~/workspace/Kadoka/Kadoka/UserApplications/sysmon/* set tw=91

" function! ProjectBufRead()
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
