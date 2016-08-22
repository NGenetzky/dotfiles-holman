
function! OnReadStdin()
    s:std_in=1
endfunction

function! OnStartup()
    if 0 == argc()
    end
    if !exists("s:std_in") && 0 == argc()
        NERDTree
    end
    if exists("s:std_in")
    end
endfunction



autocmd StdinReadPre * call OnReadStdin()
autocmd VimEnter * call OnStartup()
