
"" Override original mappings

" use ; as :. By default it repeats last f/F/t/T movement.
" nnoremap ; :

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy
" which is the default
map Y y$

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" jk is escape in insert mode
inoremap jk <esc>

" Converting case
" Change selected text from name_like_this to NameLikeThis.
vnoremap crc :s/_\([a-z]\)/\u\1/g<CR>gUl
" Change selected text from NameLikeThis to name_like_this.
vnoremap crs :s/\<\@!\([A-Z]\)/\_\l\1/g<CR>gul


"" Tab nav
noremap <leader>q gT
noremap <leader>w gt
noremap <C-t>h gT
noremap <C-t>l gt

"" Copy/Paste/Cut
noremap YY "+y
noremap PP "+gP
noremap XX "+x


" Unimparied like mappings {{{

" Jump list
nnoremap [j <C-O>
nnoremap ]j <C-I>

" Change list
" [c]c ia already used for vimdiff
nnoremap [x g;
nnoremap ]x g,

" Tabs
noremap [y gT
noremap ]y gt
" }}}

" G Mappings

" highlight last inserted text
nnoremap gV `[v`]
" nnoremap gp `[v`]

" TODO: Replace gj and gk with other mapping
"" Split Navigation (Required for C9.io where <C-W> would exit the browswer.)
nnoremap gh <C-W>h
nnoremap gj <C-W>j
nnoremap gk <C-W>k
nnoremap gl <C-W>l

" Execute in various environments
" In shell
vnoremap ge y:read !<C-R>"<CR>
" In python
vnoremap gp y:read !python -c '<C-R>"'<CR>
" In vimscript
vnoremap gv y:@"<CR>

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
" au BufRead,BufEnter ~/workspace/Kadoka/Kadoka/UserApplications/sysmon/* set tw=91

vmap <leader>c :!column -t<CR>

map <leader>w :w<CR>

nmap <leader>n :call OpenInNano(expand('%:p'))<CR>

" Use ctrl p to open buffer
noremap <leader>b :CtrlPBuffer<CR>

" Find string of text in all files under current directory.
" <CR> left off so statement can be modified.
nnoremap <leader>f yiw:grep -F '<C-R>"' ./ -r --include "*.cpp" --include "*.h"
vnoremap <leader>f y:grep -F '<C-R>"' ./ -r --include "*.cpp" --include "*.h"


