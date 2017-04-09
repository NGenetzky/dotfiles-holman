
" Tab nav {
noremap <leader>q gT
noremap <leader>w gt
noremap <C-t>h gT
noremap <C-t>l gt
" }

" Window Control Mappings {
" TODO: Replace gj and gk with other mapping

" Undo SPF13 Mappings that moves to window and minimized old window.
silent! unmap <C-j>
silent! unmap <C-k>
" Maximize current split.
nnoremap <C-_> <C-W>_
"" Split Navigation (Required for C9.io where <C-W> would exit the browswer.)
" Use my own Navigation mappings moving around splits.
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" }
