
augroup ProjectSetup
    " au BufRead,BufEnter ~/workspace/* call Workspace()
    au BufRead,BufEnter ~/workspace/Kadoka/* call Kadoka()
    au BufRead,BufEnter ~/workspace/Kadoka/UserApplications/libraries/libcli/* call Kadoka_cli()
augroup END

" Projects {
function! Kadoka()
    " Change function call into ProgramComponent.
    let @m='^vEebhdve"ayddk"zpfpve"apjF{"apviwS"V:s/_/", "/ge'
    " Change assignment to read from vm.
    let @v='^vf=bbe"adiautof=lF=bve"byf=llCvm["b"].as<a>();'
    " Read template for ProgramComponent
    let @p=':r~/workspace/Kadoka/Kadoka/UserApplications/libraries/libcli/ProgramComponent.cpp.template'
    call setreg('o','( "", boost::program_options::value<int>(), "" )')
endfunction

function! Kadoka_cli()
    noremap <leader>t :make test -f /home/dakeng/workspace/Kadoka/cli/UserApplications/cli/Makefile
endfunction
" }
