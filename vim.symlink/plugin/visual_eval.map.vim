

" Execute in various environments
" In shell
vnoremap ge y:read !<C-R>"<CR>
" In shell with Do
vnoremap gd DoThis
" In python
vnoremap gp y:read !python -c '<C-R>"'<CR>
" In vimscript
vnoremap gv y:@"<CR>
