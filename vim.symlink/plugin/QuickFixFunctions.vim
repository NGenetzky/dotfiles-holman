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
