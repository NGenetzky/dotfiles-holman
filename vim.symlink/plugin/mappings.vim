" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:

" Override original mappings {

" use ; as :. By default it repeats last f/F/t/T movement.
" nnoremap ; :

" I do not want j and k mapped to gj and gk like they are in spf13.
try
    unmap j
    unmap k
catch /^Vim\%((\a\+)\)\=:E31/	" catch E31: No such mapping

endtry

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy
" which is the default
map Y y$

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" }

" Mappings that add features: {

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <S-L> :nohl<CR><C-L>

" jk is escape in insert mode
inoremap jk <esc>

" Converting case
" Change selected text from name_like_this to NameLikeThis.
vnoremap crc :s/_\([a-z]\)/\u\1/g<CR>gUl
" Change selected text from NameLikeThis to name_like_this.
vnoremap crs :s/\<\@!\([A-Z]\)/\_\l\1/g<CR>gul


"" Copy/Paste/Cut
noremap YY "+y
noremap PP "+gP
noremap XX "+x

" }

" G Mappings {

" highlight last inserted text
nnoremap gV `[v`]
nnoremap gp `[v`]

" }

" Leader mappings {
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
noremap <leader>sv :so ~/.vimrc<CR>

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

" Use ctrl p to open buffer
noremap <leader>b :CtrlPBuffer<CR>

" Find string of text in all files under current directory.
" <CR> left off so statement can be modified.
nnoremap <leader>f yiw:grep -F '<C-R>"' ./ -r --include "*.cpp" --include "*.h"
vnoremap <leader>f y:grep -F '<C-R>"' ./ -r --include "*.cpp" --include "*.h"

" }

" Command Mode Mappings {

" Allow saving of files as sudo when I forgot to start vim using sudo.
" http://stackoverflow.com/a/7078429
cmap w!! w !sudo tee > /dev/null %

" }

" Future Mappings {

"I skimmed through :help index and made a list of some of the unused nmap keys:

" Q (switch to "Ex" mode)
" Z except ZZ, ZQ
" \
" gb, gc, gl, gx, gy, gz
" zp, zq, zu, zy
" cd, cm, co, cp, cq, cr, cs, cu, cx, cy
" dc, dm, do, dp, dq, dr, ds, du, dx, dy
" gA, gB, gC, gG, gK, gL, gM, gO, gS, gX, gY, gZ
" zB, zI, zJ, zK, zP, zQ, zP, zS, zT, zU, zV, zY, zZ
" ]a, ]b, ]e, ]g, ]h, ]j, ]k, ]l, ]n, ]o, ]q, ]r, ]t, ]u, ]v, ]w, ]x, ]y
" [a, [b, [e, [g, [h, [j, [k, [l, [n, [o, [q, [r, [t, [u, [v, [w, [x, [y
" CTRL-G, CTRL-K
" CTRL-\ a - z (reserved for extensions)
" CTRL-\ A - Z (not used)

" }
