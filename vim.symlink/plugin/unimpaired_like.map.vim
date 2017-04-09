
" Unimparied like mappings

" ]a, ]b, ]e, ]g, ]h, ]j, ]k, ]l, ]n, ]o, ]q, ]r, ]t, ]u, ]v, ]w, ]x, ]y
" [a, [b, [e, [g, [h, [j, [k, [l, [n, [o, [q, [r, [t, [u, [v, [w, [x, [y

" J: Jump list {
nnoremap [j <C-O>
nnoremap ]j <C-I>
" }

" C: Change list {
" [c]c ia already used for vimdiff
nnoremap [x g;
nnoremap ]x g,
" }

" Y: Tabs {
noremap [y gT
noremap ]y gt
" }

