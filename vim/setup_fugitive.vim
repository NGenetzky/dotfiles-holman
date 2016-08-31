if exists(":Gstatus")
    "" Git
    noremap <Leader>ga :Gwrite<CR>
    noremap <Leader>gc :Gcommit<CR>
    noremap <Leader>gsh :Gpush<CR>
    noremap <Leader>gll :Gpull<CR>
    noremap <Leader>gs :call GstatusToggle()<CR>
    noremap <Leader>gb :Gblame<CR>
    noremap <Leader>gd :Gvdiff<CR>
    noremap <Leader>gr :Gremove<CR>

    function! GstatusToggle()
        if buflisted(bufname('.git/index'))
            bd .git/index
        else
            Gstatus
        endif
    endfunction
endif
