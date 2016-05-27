
" Example checking plugin for syntastic.vim
" http://stackoverflow.com/a/22827392

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol = 'X'
let g:syntastic_warning_symbol = '!'

" Only check when requested using F5 key
let g:syntastic_mode_map = { 'mode': 'passive' }
nmap <F5> :SyntasticCheck<CR>
nmap <F6> :SyntasticReset<CR>

" Python
let g:syntastic_python_checkers = ['pep8', 'python', 'pylint']

" Cpp
"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_cpp_compiler = "g++"
let g:syntastic_cpp_compiler_options = "-std=c++11 -stdlib=libc++ -Wall -Wextra -Wpedantic"

