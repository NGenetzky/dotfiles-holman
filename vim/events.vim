
function! OnReadStdin()
    s:std_in=1
endfunction

function! OnStartup()
    " if 0 == argc()
    " end
    if !exists("s:std_in") && 0 == argc()
        if !has("gui_running")
            NERDTree
        endif
    endif
    " if exists("s:std_in")
    " endif
endfunction



autocmd StdinReadPre * call OnReadStdin()
autocmd VimEnter * call OnStartup()
