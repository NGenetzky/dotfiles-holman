
augroup ProjectSetup
    au BufEnter ~/workspace/* call Workspace()
    " au BufRead,BufEnter ~/workspace/* call Workspace()
    " au BufRead,BufEnter ~/workspace/Kadoka/* call Kadoka()
augroup END

" Projects {
function! Workspace()
    let l:path = split(expand('%:p'), '/')
    if l:path[3] == 'Kadoka'
        call Kadoka()
    endif

    if l:path[3] == 'Kadoka' && (l:path[6] == 'cli' || l:path[7] == 'libcli')
        noremap <leader>t :make test -f /home/dakeng/workspace/Kadoka/main_cli/UserApplications/cli/Makefile
    endif
endfunction

function! Kadoka()
endfunction

" }
