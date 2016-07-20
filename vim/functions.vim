
function! RmViews()
    !rm ~/.vimviews/*
endfunction

function! ExecuteEmbeddedBash()
    "" Execute one-line bash command in html comment and put output into
    "" code block
    ""<!---
    ""head ~/.dotfiles/vim/ngenetzky.vim -n2
    ""-->
    ""```
    ""```
    " let searchfull='<!---bash\n.*\_.-->\n```\_.\{-}```'
    " let replace_output='j^v$h"ay/```oVnk"ap!!bash'
    " exec 'g/'.searchfull.'/normal '.replace_output
    "" As oneliner:
    exec 'g/<!---bash\n.*\_.-->\n```\_.\{-}```/normal j^v$h"ay/```oVnk"ap!!bash'
endfunction


function! ExecuteEmbeddedVimscript()
    "" Execute one-line vimscript command in html comment and put output into
    "" code block
    ""<!---
    "":read !head ~/.dotfiles/vim/ngenetzky.vim -n2
    ""-->
    ""```
    ""```
    let searchfull='<!---vimscript\n.*\_.-->\n```\_.\{-}```'
    let replace_output='j^v$h"ay/```oVnkdk:@a'
    exec 'g/'.searchfull.'/normal '.replace_output
endfunction

function! OpenInNano(filename)
  call VimuxOpenRunner()
  VimuxRunCommand "nano " . a:filename
  VimuxZoomRunner
endfunction

function! OutputSplitWindow(...)
  " this function output the result of the Ex command into a split scratch buffer
  let cmd = join(a:000, ' ')
  let temp_reg = @"
  redir @"
  silent! execute cmd
  redir END
  let output = copy(@")
  let @" = temp_reg
  if empty(output)
    echoerr "no output"
  else
    new
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted
    put! =output
  endif
endfunction
command! -nargs=+ -complete=command ExecSplit call OutputSplitWindow(<f-args>)

" Imported Preserve
" src: https://docwhat.org/vim-preserve-your-cursor-and-window-state/
" A wrapper function to restore the cursor position, window position,
" and last search after running a command.
" Usage: nmap <silent> <Leader><space> :call Preserve("%s/\\s\\+$//e")<CR>
function! Preserve(command)
  " Save the last search
  let last_search=@/
  " Save the current cursor position
  let save_cursor = getpos(".")
  " Save the window position
  normal H
  let save_window = getpos(".")
  call setpos('.', save_cursor)

  " Do the business:
  execute a:command

  " Restore the last_search
  let @/=last_search
  " Restore the window position
  call setpos('.', save_window)
  normal zt
  " Restore the cursor position
  call setpos('.', save_cursor)
endfunction

" Imported RedirectOutput
" src: http://unix.stackexchange.com/a/8296
funct! RedirectOutput(command)
    redir =>output
    silent exec a:command
    redir END
    return output
endfunct!

" src: http://vim.1045645.n5.nabble.com/Saving-the-Quickfix-List-tp1179523p1179526.html
function! SaveQuickFixList(fname) 
    let list = getqflist() 
    for i in range(len(list)) 
        if has_key(list[i], 'bufnr') 
            let list[i].filename = fnamemodify(bufname(list[i].bufnr), ':p') 
            unlet list[i].bufnr 
        endif 
    endfor 
    let string = string(list) 
    let lines = split(string, "\n") 
    call writefile(lines, a:fname) 
endfunction 

function! DoCmdInQuickfixFiles(command)
    "Raised error last time it was used
    for quickfix_item in getqflist()
        execute a:command
    endfor
endfunction

"{{ src: http://dalibornasevic.com/posts/43-12-vim-tips
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()

" populate the argument list with each of the files named in the quickfix list
function! QuickfixFilenames()
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction
"}} end of src: http://dalibornasevic.com/posts/43-12-vim-tips

" src: http://vim.1045645.n5.nabble.com/Saving-the-Quickfix-List-tp1179523p1179526.html
function! LoadQuickFixList(fname) 
    let lines = readfile(a:fname) 
    let string = join(lines, "\n") 
    call setqflist(eval(string)) 
endfunction 
