
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:

if &runtimepath =~ 'vim-bookmarks' " {
    let g:bookmark_no_default_key_mappings = 1
    nmap <Leader><Leader> <Plug>BookmarkToggle
    nmap <Leader>i <Plug>BookmarkAnnotate
    nmap <Leader>a <Plug>BookmarkShowAll
    nmap <Leader>j <Plug>BookmarkNext
    nmap <Leader>k <Plug>BookmarkPrev
    nmap <Leader>c <Plug>BookmarkClear
    nmap <Leader>x <Plug>BookmarkClearAll
    nmap <Leader>kk <Plug>BookmarkMoveUp
    nmap <Leader>jj <Plug>BookmarkMoveDown


    " highlight BookmarkSign ctermbg=whatever ctermfg=whatever
    " highlight BookmarkAnnotationSign ctermbg=whatever ctermfg=whatever
    " highlight BookmarkLine ctermbg=whatever ctermfg=whatever
    " highlight BookmarkAnnotationLine ctermbg=whatever ctermfg=whatever
endif
" }

if &runtimepath =~ 'vim-airline' "{
    let g:airline_theme = 'solarized'
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '?'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '?'
    " TODO: fix E121: Undefined variable: g:airline_symbols
    " let g:airline_symbols.linenr = '?'
    " let g:airline_symbols.linenr = '?'
    " let g:airline_symbols.linenr = '¶'
    " let g:airline_symbols.branch = '?'
    " let g:airline_symbols.paste = ' ρ'
    " let g:airline_symbols.paste = 'Þ'
    " let g:airline_symbols.paste = '?'
    " let g:airline_symbols.whitespace = ' Ξ '
endif
" }

if &runtimepath =~ 'clang-format' "{
    " http://llvm.org/releases/3.5.0/tools/clang/docs/ClangFormatStyleOptions.html
    let g:clang_format#command = 'clang-format-3.5'

    let g:clang_format#style_options = {
        \ "BasedOnStyle" :                                    "Google",
        \ "Language" :                                        "Cpp",
        \ "AccessModifierOffset" :                            "-1",
        \ "ConstructorInitializerIndentWidth" :               "4",
        \ "AlignEscapedNewlinesLeft" :                        "true",
        \ "AlignTrailingComments" :                           "true",
        \ "AllowAllParametersOfDeclarationOnNextLine" :       "true",
        \ "AllowShortBlocksOnASingleLine" :                   "false",
        \ "AllowShortIfStatementsOnASingleLine" :             "true",
        \ "AllowShortLoopsOnASingleLine" :                    "true",
        \ "AllowShortFunctionsOnASingleLine" :                "All",
        \ "AlwaysBreakTemplateDeclarations" :                 "true",
        \ "AlwaysBreakBeforeMultilineStrings" :               "true",
        \ "BreakBeforeBinaryOperators" :                      "false",
        \ "BreakBeforeTernaryOperators" :                     "true",
        \ "BinPackParameters" :                               "true",
        \ "ColumnLimit" :                                     "80",
        \ "ConstructorInitializerAllOnOneLineOrOnePerLine" :  "true",
        \ "DerivePointerAlignment" :                          "true",
        \ "ExperimentalAutoDetectBinPacking" :                "false",
        \ "IndentCaseLabels" :                                "true",
        \ "IndentWrappedFunctionNames" :                      "false",
        \ "IndentFunctionDeclarationAfterType" :              "false",
        \ "MaxEmptyLinesToKeep" :                             "1",
        \ "KeepEmptyLinesAtTheStartOfBlocks" :                "false",
        \ "NamespaceIndentation" :                            "None",
        \ "ObjCSpaceAfterProperty" :                          "false",
        \ "ObjCSpaceBeforeProtocolList" :                     "false",
        \ "PenaltyBreakBeforeFirstCallParameter" :            "1",
        \ "PenaltyBreakComment" :                             "300",
        \ "PenaltyBreakString" :                              "1000",
        \ "PenaltyBreakFirstLessLess" :                       "120",
        \ "PenaltyExcessCharacter" :                          "1000000",
        \ "PointerAlignment" :                                "Left",
        \ "SpacesBeforeTrailingComments" :                    "2",
        \ "Cpp11BracedListStyle" :                            "true",
        \ "Standard" :                                        "Auto",
        \ "IndentWidth" :                                     "2",
        \ "UseTab" :                                          "Never",
        \ "BreakBeforeBraces" :                               "Attach",
        \ "SpacesInAngles" :                                  "false",
        \ "SpaceInEmptyParentheses" :                         "false",
        \ "SpacesInCStyleCastParentheses" :                   "false",
        \ "SpacesInContainerLiterals" :                       "true",
        \ "SpaceBeforeAssignmentOperators" :                  "true",
        \ "ContinuationIndentWidth" :                         "4",
        \ "CommentPragmas" :                                  "'^ IWYU pragma:'",
        \ "ForEachMacros" :                                   "[ foreach, Q_FOREACH, BOOST_FOREACH ]",
        \ "SpaceBeforeParens" :                               "ControlStatements",
        \ "DisableFormat" :                                   "false",
        \ "TabWidth" :                                        "4",
        \ "SpacesInParentheses" :                             "true",
        \ }

    let g:clang_format#style_options = {
        \  "BasedOnStyle"                             :  "Google",
        \  "AllowShortIfStatementsOnASingleLine"      :  "true",
        \  "AlwaysBreakTemplateDeclarations"          :  "true",
        \  "Standard"                                 :  "C++11",
        \  "SpacesInParentheses"                      :  "true",
        \  "BreakConstructorInitializersBeforeComma"  :  "true",
        \  "BreakBeforeBraces"                        :  "Stroustrup",
        \  "PenaltyReturnTypeOnItsOwnLine"            :  "0",
        \ }

    " Desired future style options (not available in Clang 3.5)
    " \  "ReturnTypeBreakingStyle" : "RTBS_AllDefinitions",
    " \  "BreakConstructorInitializersBeforeComma"  :  "true",

    " map to <Leader>cf in C++ code
    autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
    autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
    " if you install vim-operator-user
    autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
    " Toggle auto formatting:
    nmap <Leader>C :ClangFormatAutoToggle<CR>
endif
" }

if &runtimepath =~ 'ctrlp' "{
    " Ignore some folders and files for CtrlP indexing
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$',
      \ 'file': '\.so$\|\.dat$|\.DS_Store$|\.o|\.so'
      \ }
endif
" }

if &runtimepath =~ 'c' "{
    " See https://github.com/vim-scripts/c.vim/blob/master/doc/csupport.txt
    let g:C_MapLeader = '\'
    let g:C_GlobalTemplateDir    = expand('~/.dotfiles/vim/c-support/templates/')
    let g:C_GlobalTemplateFile   = expand('~/.dotfiles/vim/c-support/templates/Templates')
    let g:C_LocalTemplateDir    = expand('~/.dotfiles/vim/c-support/templates/')
    let g:C_LocalTemplateFile   = expand('~/.dotfiles/vim/c-support/templates/Templates')
    let g:C_CodeSnippets        = expand('~/.dotfiles/vim/c-support/codesnippets')
    let g:C_FormatDate          = '%D'
    let g:C_FormatTime          = '%H:%M'
    let g:C_FormatYear          = 'year %Y'
    " Disable <c-j>. Context:
    " if !exists("g:C_Ctrl_j") || ( exists("g:C_Ctrl_j") && g:C_Ctrl_j != 'off' )
    let g:C_Ctrl_j='off'
    " : insert file prolog in a new file ('yes', 'no')
    let g:C_InsertFileHeader ='no'
endif
" }

if &runtimepath =~ 'vim-fugitive' "{
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
" }

if &runtimepath =~ 'gdb-from-vim' "{
    " nnoremap <F4> :GdbFromVimRun <CR>
    " nnoremap <F5> :GdbFromVimStep <CR>
    " nnoremap <F6> :GdbFromVimNext <CR>
    " nnoremap <leader>b :GdbFromVimAddBreakpoint <CR>
    " nnoremap <F8> :GdbFromFromDeleteBreakpoint <CR>
    " nnoremap <F9> :GdbFromVimClear <CR>
endif
" }

if &runtimepath =~ 'GoldenView' "{
    let g:goldenview__enable_default_mapping = 0
    " 1. split to tiled windows
    nmap <silent> <C-L>  <Plug>GoldenViewSplit
    " 2. quickly switch current window with the main pane
    " and toggle back
    nmap <silent> <F8>   <Plug>GoldenViewSwitchMain
    nmap <silent> <S-F8> <Plug>GoldenViewSwitchToggle
    " 3. jump to next and previous window
    " nmap <silent> <C-N>  <Plug>GoldenViewNext
    " nmap <silent> <C-P>  <Plug>GoldenViewPrevious
endif
" }

if &runtimepath =~ 'lightline' "{
    set laststatus=2

    if !has('gui_running')
      set t_Co=256
    endif

    let g:lightline = {
          \ 'colorscheme': 'wombat',
          \ 'active': {
          \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
          \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
          \ },
          \ 'component_function': {
          \   'fugitive': 'LightLineFugitive',
          \   'filename': 'LightLineFilename',
          \   'fileformat': 'LightLineFileformat',
          \   'filetype': 'LightLineFiletype',
          \   'fileencoding': 'LightLineFileencoding',
          \   'mode': 'LightLineMode',
          \   'ctrlpmark': 'CtrlPMark',
          \ },
          \ 'component_expand': {
          \   'syntastic': 'SyntasticStatuslineFlag',
          \ },
          \ 'component_type': {
          \   'syntastic': 'error',
          \ },
          \ 'subseparator': { 'left': '|', 'right': '|' }
          \ }

    function! LightLineModified()
      return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
    endfunction

    function! LightLineReadonly()
      return &ft !~? 'help' && &readonly ? 'RO' : ''
    endfunction

    function! LightLineFilename()
      let fname = expand('%:t')
      return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
            \ fname == '__Tagbar__' ? g:lightline.fname :
            \ fname =~ '__Gundo\|NERD_tree' ? '' :
            \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
            \ &ft == 'unite' ? unite#get_status_string() :
            \ &ft == 'vimshell' ? vimshell#get_status_string() :
            \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
            \ ('' != fname ? fname : '[No Name]') .
            \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
    endfunction

    function! LightLineFugitive()
      try
        if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
          let mark = ''  " edit here for cool mark
          let branch = fugitive#head()
          return branch !=# '' ? mark.branch : ''
        endif
      catch
      endtry
      return ''
    endfunction

    function! LightLineFileformat()
      return winwidth(0) > 70 ? &fileformat : ''
    endfunction

    function! LightLineFiletype()
      return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
    endfunction

    function! LightLineFileencoding()
      return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
    endfunction

    function! LightLineMode()
      let fname = expand('%:t')
      return fname == '__Tagbar__' ? 'Tagbar' :
            \ fname == 'ControlP' ? 'CtrlP' :
            \ fname == '__Gundo__' ? 'Gundo' :
            \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
            \ fname =~ 'NERD_tree' ? 'NERDTree' :
            \ &ft == 'unite' ? 'Unite' :
            \ &ft == 'vimfiler' ? 'VimFiler' :
            \ &ft == 'vimshell' ? 'VimShell' :
            \ winwidth(0) > 60 ? lightline#mode() : ''
    endfunction

    function! CtrlPMark()
      if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
        call lightline#link('iR'[g:lightline.ctrlp_regex])
        return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
              \ , g:lightline.ctrlp_next], 0)
      else
        return ''
      endif
    endfunction

    let g:ctrlp_status_func = {
      \ 'main': 'CtrlPStatusFunc_1',
      \ 'prog': 'CtrlPStatusFunc_2',
      \ }

    function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
      let g:lightline.ctrlp_regex = a:regex
      let g:lightline.ctrlp_prev = a:prev
      let g:lightline.ctrlp_item = a:item
      let g:lightline.ctrlp_next = a:next
      return lightline#statusline(0)
    endfunction

    function! CtrlPStatusFunc_2(str)
      return lightline#statusline(0)
    endfunction

    let g:tagbar_status_func = 'TagbarStatusFunc'

    function! TagbarStatusFunc(current, sort, fname, ...) abort
        let g:lightline.fname = a:fname
      return lightline#statusline(0)
    endfunction

    augroup AutoSyntastic
      autocmd!
      autocmd BufWritePost *.c,*.cpp call s:syntastic()
    augroup END
    function! s:syntastic()
      SyntasticCheck
      call lightline#update()
    endfunction

    let g:unite_force_overwrite_statusline = 0
    let g:vimfiler_force_overwrite_statusline = 0
    let g:vimshell_force_overwrite_statusline = 0
endif
" }

if &runtimepath =~ 'nerdtree' "{
    " scrooloose/nerdtree     " The script provides the following options that can customise the behaviour the
    " NERD tree. These options should be set in your vimrc.

    " |'loaded_nerd_tree'|            Turns off the script.

    " |'NERDTreeAutoCenter'|          Controls whether the NERD tree window centers
    "                                 when the cursor moves within a specified
    "                                 distance to the top/bottom of the window.

    " |'NERDTreeAutoCenterThreshold'| Controls the sensitivity of autocentering.

    " |'NERDTreeCaseSensitiveSort'|   Tells the NERD tree whether to be case
    "                                 sensitive or not when sorting nodes.

    " |'NERDTreeSortHiddenFirst'|     Tells the NERD tree whether to take the dot
    "                                 at the beginning of the hidden file names
    "                                 into account when sorting nodes.

    " |'NERDTreeChDirMode'|           Tells the NERD tree if/when it should change
    "                                 vim's current working directory.

    " |'NERDTreeHighlightCursorline'| Tell the NERD tree whether to highlight the
    "                                 current cursor line.

    " |'NERDTreeHijackNetrw'|         Tell the NERD tree whether to replace the netrw
    "                                 autocommands for exploring local directories.

    " |'NERDTreeIgnore'|              Tells the NERD tree which files to ignore.

    " |'NERDTreeRespectWildIgnore'|   Tells the NERD tree to respect |'wildignore'|.

    " |'NERDTreeBookmarksFile'|       Where the bookmarks are stored.

    " |'NERDTreeBookmarksSort'|       Whether the bookmarks list is sorted on
    "                                 display.

    " |'NERDTreeMouseMode'|           Tells the NERD tree how to handle mouse
    "                                 clicks.

    " |'NERDTreeQuitOnOpen'|          Closes the tree window after opening a file.

    " |'NERDTreeShowBookmarks'|       Tells the NERD tree whether to display the
    "                                 bookmarks table on startup.

    " |'NERDTreeShowFiles'|           Tells the NERD tree whether to display files
    "                                 in the tree on startup.

    " |'NERDTreeShowHidden'|          Tells the NERD tree whether to display hidden
    "                                 files on startup.

    " |'NERDTreeShowLineNumbers'|     Tells the NERD tree whether to display line
    "                                 numbers in the tree window.

    " |'NERDTreeSortOrder'|           Tell the NERD tree how to sort the nodes in
    "                                 the tree.

    " |'NERDTreeStatusline'|          Set a statusline for NERD tree windows.

    " |'NERDTreeWinPos'|              Tells the script where to put the NERD tree
    "                                 window.

    " |'NERDTreeWinSize'|             Sets the window size when the NERD tree is
    "                                 opened.

    " |'NERDTreeMinimalUI'|           Disables display of the 'Bookmarks' label and 
    "                                 'Press ? for help' text.

    " |'NERDTreeCascadeOpenSingleChildDir'|
    "                                 Cascade open while selected directory has only
    "                                 one child that also is a directory.

    " |'NERDTreeAutoDeleteBuffer'|    Tells the NERD tree to automatically remove 
    "                                 a buffer when a file is being deleted or renamed
    "                                 via a context menu command.

    " |'NERDTreeCreatePrefix'|        Specify a prefix to be used when creating the
    "                                 NERDTree window.

    "" jistr/vim-nerdtree-tabs

    " g:nerdtree_tabs_open_on_gui_startup (default: 1)
    " Open NERDTree on gvim/macvim startup
    let g:nerdtree_tabs_open_on_gui_startup = 0

    " g:nerdtree_tabs_open_on_console_startup (default: 0)
    " Open NERDTree on console vim startup
    let g:nerdtree_tabs_open_on_console_startup = 0

    " g:nerdtree_tabs_no_startup_for_diff (default: 1)
    " Do not open NERDTree if vim starts in diff mode

    " g:nerdtree_tabs_smart_startup_focus (default: 1)
    " On startup, focus NERDTree if opening a directory, focus file if opening a file. (When set to 2, always focus file window after startup).

    " g:nerdtree_tabs_open_on_new_tab (default: 1)
    " Open NERDTree on new tab creation (if NERDTree was globally opened by :NERDTreeTabsToggle)
    let g:nerdtree_tabs_open_on_new_tab = 0

    " g:nerdtree_tabs_meaningful_tab_names (default: 1)
    " Unfocus NERDTree when leaving a tab for descriptive tab names

    " g:nerdtree_tabs_autoclose (default: 1)
    " Close current tab if there is only one window in it and it's NERDTree

    " g:nerdtree_tabs_synchronize_view (default: 1)
    " Synchronize view of all NERDTree windows (scroll and cursor position)

    " g:nerdtree_tabs_synchronize_focus (default: 1)
    " Synchronize focus when switching windows (focus NERDTree after tab switch if and only if it was focused before tab switch)

    " g:nerdtree_tabs_focus_on_files (default: 0)
    " When switching into a tab, make sure that focus is on the file window, not in the NERDTree window. (Note that this can get annoying if you use NERDTree's feature "open in new tab silently", as you will lose focus on the NERDTree.)

    " g:nerdtree_tabs_startup_cd (default: 1)
    " When given a directory name as a command line parameter when launching Vim, :cd into it.

    " g:nerdtree_tabs_autofind (default: 0)
    " Automatically find and select currently opened file in NERDTree.
endif
" }

if &runtimepath =~ 'project.vim' "{
    " let g:proj_flags='gs'

    " " Project: Run on file
    " " %f is replaced with the full path and filename
    " " %F is replaced with the full path and filename with spaces
    " " quoted
    " " %n is replaced with the filename alone
    " " %N is replaced with the filename alone with spaces quoted
    " " %h is replaced with the home directory
    " " %H is replaced with the home directory with spaces quoted
    " " %r is replaced with the directory relative to the CD path
    " " %R is replaced with the directory relative to the CD path with spaces quoted
    " " %d is replaced with the CD directory.
    " " %D is replaced with the CD directory.with spaces quoted
    " " %% is replaced with a single % that is not used in expansion.
endif
" }

if &runtimepath =~ 'vim-space' "{
    " Set this variable to disable space.vim
    "
    "   let g:space_loaded = 1

    " Set this variable to disable select mode mappings
    "
    "   let g:space_disable_select_mode = 1

    " These variables disables the usage of <Space> for groups of different
    " movement commands
    "
    " Disable <Space> for character movements, e.g. fFtT;,
    "   let g:space_no_character_movements = 1
    "
    " Disable <Space> for searches, e.g. /?#*nN
    "   let g:space_no_search = 1
    "
    " Disable <Space> for jump commands, e.g. Ctrl-O, Ctrl-I, g, and g;
    "   let g:space_no_jump = 1
    "
    " Disable <Space> for diff commands, e.g. [c and ]c
    "   let g:space_no_diff = 1
    "
    " Disable <Space> for brace movement commands, e.g. [(, ]), [{ and ]}
    "   let g:space_no_brace = 1
    "
    " Disable <Space> for method movement commands, e.g. [m, ]m, [M and ]M
    "   let g:space_no_method = 1
    "
    " Disable <Space> for section movement commands, e.g. [[, ]], [] and ][
    "   let g:space_no_section = 1
    "
    " Disable <Space> for fold movement commands, e.g. [z, ]z, zj and zk
    "   let g:space_no_folds = 1
    "
    " Disable <Space> for tag movement commands, e.g. Ctrl-], :tag, etc.
    "   let g:space_no_tags = 1
    "
    " Disable <Space> for quickfix and location list commands, e.g. :cc, :ll, etc.
    "   let g:space_no_quickfix = 1
    "
    " Disable <Space> for undolist movements, e.g. g- and g+
    "   let g:space_no_undolist = 1
endif
" }

if &runtimepath =~ 'syntastic' "{
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

    let g:syntastic_mode_map = { 'mode': 'passive' }

    " Python
    let g:syntastic_python_checkers = ['pep8', 'python', 'pylint']

    " Cpp
    "let g:syntastic_cpp_compiler = 'clang++'
    "let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
    let g:syntastic_cpp_compiler = "g++"
    let g:syntastic_cpp_compiler_options = "-std=c++11 -stdlib=libc++ -Wall -Wextra -Wpedantic"
endif
" }

if &runtimepath =~ 'ultisnips' "{
    " UltiSnips: the Python version from g:UltiSnipsUsePythonVersion (2) is not available.
    let g:UltiSnipsUsePythonVersion = 2

    " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
    let g:UltiSnipsExpandTrigger="<c-J>"
    let g:UltiSnipsListSnippets="<c-b>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

    let g:UltiSnipsSnippetsDir="~/.vim/snippets"
    if !isdirectory(expand(g:UltiSnipsSnippetsDir))
        call mkdir(expand(g:UltiSnipsSnippetsDir), "p")
    endif
    let g:UltiSnipsSnippetDirectories=["UltiSnips", "code_snippets"]
endif
" }

if &runtimepath =~ 'unite.vim' "{
    let g:unite_source_history_yank_enable = 1
    " TODO: Causes error on fresh install: Unknown function.
    call unite#filters#matcher_default#use(['matcher_fuzzy'])

    if &runtimepath =~ 'vimproc.vim'
        nnoremap <leader>T :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
    endif
    nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
    if &runtimepath =~ 'neomru.vim'
        nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
    endif
    if &runtimepath =~ 'unite-outline.vim'
        nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
    endif
    if &runtimepath =~ 'neoyank.vim'
        nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
    endif
    nnoremap <leader>b :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

    " Custom mappings for the unite buffer
    autocmd FileType unite call s:unite_settings()
    function! s:unite_settings()
      " Play nice with supertab
      let b:SuperTabDisabled=1
      " Enable navigation with control-j and control-k in insert mode
      imap <buffer> <C-j>   <Plug>(unite_select_next_line)
      imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
    endfunction
endif
" }

if &runtimepath =~ 'YouCompleteMe' "{
    let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
    let g:ycm_confirm_extra_conf=0
endif
" }

if &runtimepath =~ 'bookmarks' "{
    let g:bookmark_no_default_key_mappings = 1
    nmap <Leader><Leader> <Plug>BookmarkToggle
    nmap <Leader>i <Plug>BookmarkAnnotate
    nmap <Leader>a <Plug>BookmarkShowAll
    nmap <Leader>j <Plug>BookmarkNext
    nmap <Leader>k <Plug>BookmarkPrev
    nmap <Leader>c <Plug>BookmarkClear
    nmap <Leader>x <Plug>BookmarkClearAll
    nmap <Leader>kk <Plug>BookmarkMoveUp
    nmap <Leader>jj <Plug>BookmarkMoveDown

    " highlight BookmarkSign ctermbg=whatever ctermfg=whatever
    " highlight BookmarkAnnotationSign ctermbg=whatever ctermfg=whatever
    " highlight BookmarkLine ctermbg=whatever ctermfg=whatever
    " highlight BookmarkAnnotationLine ctermbg=whatever ctermfg=whatever

    " " ⚑    Sets bookmark icon for sign column
    " let g:bookmark_sign = '>>'
    " " ☰    Sets bookmark annotation icon for sign column
    " let g:bookmark_annotation_sign = '##'
    " " 0    Save bookmarks per working dir, the folder you opened vim from
    " let g:bookmark_save_per_working_dir = 1
    " " 1    Enables/disables automatic saving for bookmarks
    " let g:bookmark_auto_save = 0
    " " 0    Save bookmarks when leaving a buffer, load when entering one
    " let g:bookmark_manage_per_buffer = 1
    " " $HOME .'/.vim-bookmarks'    Sets file for auto saving (ignored when bookmark_save_per_working_dir is enabled)
    let g:bookmark_auto_save_file = $HOME . '/.vim/bookmarks'
    " " 0    Automatically close bookmarks split when jumping to a bookmark
    " let g:bookmark_auto_close = 1
    " " 0    Enables/disables line highlighting
    " let g:bookmark_highlight_lines = 1
    " " 1    Enables/disables warning when clearing all bookmarks
    " let g:bookmark_show_warning = 0
    " " 1    Enables/disables warning when toggling to clear a bookmark with annotation
    " let g:bookmark_show_toggle_warning = 0
    " " 0    Enables/disables line centering when jumping to bookmark
    " let g:bookmark_center = 1
    " " 0    Prevent any default key mapping from being created
    " let g:bookmark_no_default_key_mappings = 1
    " " 0    Use the location list to show all bookmarks
    " let g:bookmark_location_list = 1
endif
" }

if &runtimepath =~ 'neocomplcache' "{
    "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

    " Enable heavy features.
    " Use camel case completion.
    "let g:neocomplcache_enable_camel_case_completion = 1
    " Use underbar completion.
    "let g:neocomplcache_enable_underbar_completion = 1

    " Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplcache#undo_completion()
    inoremap <expr><C-l>     neocomplcache#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return neocomplcache#smart_close_popup() . "\<CR>"
      " For no inserting <CR> key.
      "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplcache#close_popup()
    inoremap <expr><C-e>  neocomplcache#cancel_popup()
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

    " For cursor moving in insert mode(Not recommended)
    "inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
    "inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
    "inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
    "inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
    " Or set this.
    "let g:neocomplcache_enable_cursor_hold_i = 1
    " Or set this.
    "let g:neocomplcache_enable_insert_char_pre = 1

    " AutoComplPop like behavior.
    "let g:neocomplcache_enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplcache_enable_auto_select = 1
    "let g:neocomplcache_disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplcache_force_omni_patterns')
      let g:neocomplcache_force_omni_patterns = {}
    endif
    let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
endif
" }

if &runtimepath =~ 'neosnippet.vim' "{
    " Plugin key-mappings.
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)

    " SuperTab like snippets behavior.
    "imap <expr><TAB>
    " \ pumvisible() ? "\<C-n>" :
    " \ neosnippet#expandable_or_jumpable() ?
    " \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

    " For conceal markers.
    if has('conceal')
      set conceallevel=2 concealcursor=niv
    endif

    " Enable snipMate compatibility feature.
    let g:neosnippet#enable_snipmate_compatibility = 1

    " Tell Neosnippet about the other snippets
    let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
endif
" }

if &runtimepath =~ 'vim-multiple-cursors' "{

    let g:multi_cursor_use_default_mapping=0
    " Default mapping
    let g:multi_cursor_next_key='<C-m>'
    let g:multi_cursor_prev_key='<C-n>'
    let g:multi_cursor_skip_key='<C-x>'
    let g:multi_cursor_quit_key='<Esc>'

    " let g:multi_cursor_quit_key='<Esc>'
    " nnoremap <Esc> :call multiple_cursors#quit()<CR>

    " Map start key separately from next key
    " let g:multi_cursor_start_key='<F6>'

    " Currently there are four additional global settings one can tweak:

    " g:multi_cursor_exit_from_visual_mode (Default: 1)
    let g:multi_cursor_exit_from_visual_mode=0
    let g:multi_cursor_exit_from_insert_mode=0

    " If set to 0, then pressing g:multi_cursor_quit_key in Visual mode will not
    " quit and delete all existing cursors. This is useful if you want to press
    " Escape and go back to Normal mode, and still be able to operate on all the
    " cursors.

    " map dictionaries {
    " g:multi_cursor_insert_maps (Default: {})

    " Any key in this map (values are ignored) will cause multi-cursor Insert mode
    " to pause for timeoutlen waiting for map completion just like normal vim.
    " Otherwise keys mapped in insert mode are ignored when multiple cursors are
    " active. For example, setting it to {'\':1} will make insert-mode mappings
    " beginning with the default leader key work in multi-cursor mode. You have to
    " manually set this because vim doesn't provide a way to see which keys start
    " mappings.

    " g:multi_cursor_normal_maps (Default: see below)

    " Default value: {'!':1, '@':1, '=':1, 'q':1, 'r':1, 't':1, 'T':1, 'y':1,
    " '[':1, ']':1, '\':1, 'd':1, 'f':1, 'F':1, 'g':1, '"':1, 'z':1, 'c':1, 'm':1,
    " '<':1, '>':1}

    " Any key in this map (values are ignored) will cause multi-cursor Normal mode
    " to pause for map completion just like normal vim. Otherwise keys mapped in
    " normal mode will "fail to replay" when multiple cursors are active. For
    " example, changing it from {} to {'d':1} makes normal-mode mappings beginning
    " with d (such as dw to delete a word) work in multi-cursor mode.

    " g:multi_cursor_visual_maps (Default: see below)

    " Default value: {'i':1, 'a':1, 'f':1, 'F':1, 't':1, 'T':1}

    " Any key in this map (values are ignored) will cause multi-cursor Visual mode
    " to pause for map completion just like normal vim. Otherwise keys mapped in
    " visual mode will "fail to replay" when multiple cursors are active. For
    " example, changing it from {} to {'i':1} makes visual-mode mappings beginning
    " with i (such as it to select an "inner tag block") work in multi-cursor
    " mode.

    " The default list contents should work for anybody, unless they have remapped
    " a key from an operator-pending command to a non-operator-pending command or
    " vice versa.

    " These keys must be manually listed because vim doesn't provide a way to
    " automatically see which keys start mappings, and trying to run motion
    " commands such as j as if they were operator-pending commands can break
    " things.
    " }

    " Interactions with other plugins {

    " Multiple_cursors_before/Multiple_cursors_after (Default: nothing)

    " Other plugins may trigger on keypresses when in insert mode. These plugins
    " generally provide a means to toggle their active state. These hooks allow
    " the user to provide functions in their .vimrc to do this when
    " multiple-cursor-mode is entered.

    " For example, if you are using Neocomplete, add this to your vimrc to prevent
    " conflict:
    " Called once right before you start selecting multiple cursors
    function! Multiple_cursors_before()
        if exists(':NeoCompleteLock')==2
            exe 'NeoCompleteLock'
        endif
    endfunction

    " Called once only when the multiple selection is canceled (default <Esc>)
    function! Multiple_cursors_after()
        if exists(':NeoCompleteUnlock')==2
            exe 'NeoCompleteUnlock'
        endif
    endfunction
    " }

    " Highlight {

    " The plugin uses the highlight group multiple_cursors_cursor and
    " multiple_cursors_visual to highlight the virtual cursors and their
    " visual selections respectively. You can customize them by putting
    " something similar like the following in your vimrc:

    " " Default highlighting (see help :highlight and help :highlight-link)
    " highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
    " highlight link multiple_cursors_visual Visual
    " }
endif
" }

if &runtimepath =~ 'c.vim' "{
    " Several global variables are checked by the script to customize it:

    "  ----------------------------------------------------------------------------
    "  GLOBAL VARIABLE           DEFAULT VALUE                    TAG (see below)
    "  ----------------------------------------------------------------------------
    "  g:C_CExtension             'c'
    "  g:C_CFlags                 '-Wall -g -O0 -c'
    "  g:C_CodeCheckExeName       'check'
    "  g:C_CodeCheckOptions       '-K13'
    "  g:C_CodeSnippets           plugin_dir.'/c-support/codesnippets/'
    "  g:C_Ctrl_j                 'on'
    "  g:C_CustomTemplateFile     $HOME.'/.vim/templates/c.templates'
    "  g:C_Debugger               'gdb'
    "  g:C_Dictionary_File        ''
    "  g:C_GlobalTemplateFile     plugin_dir.'c-support/templates/Templates'
    "  g:C_GuiSnippetBrowser      'gui'
    "  g:C_InsertFileHeader       'yes'
    "  g:C_LFlags                 '-Wall -g -O0'
    "  g:C_Libs                   '-lm'
    "  g:C_LineEndCommColDefault  49
    "  g:C_LoadMenus              'yes'
    "  g:C_CreateMenusDelayed     'no'
    "  g:C_LocalTemplateFile      $HOME.'/.vim/c-support/templates/Templates'
    "  g:C_MapLeader              '\'
    "  g:C_MenuHeader             'yes'
    "  g:C_NonCComment            '#'
    "  g:C_OutputGvim             'vim'
    "  g:C_Printheader            "%<%f%h%m%<  %=%{strftime('%x %X')}     Page %N"
    "  g:C_RootMenu               '&C\/C\+\+.'
    "  g:C_SourceCodeExtensions   'c cc cp cxx cpp CPP c++ C i ii'
    "  g:C_TypeOfH                'cpp'
    "  g:C_VimCompilerName        gcc
    "  g:Xterm_Executable         'xterm'
    "  g:Xterm_Options            '-fa courier -fs 12 -geometry 80x24'

    "  Linux/UNIX:
    "   g:C_CCompiler             'gcc'
    "   g:C_CplusCompiler         'g++'
    "   g:C_ExeExtension          ''
    "   g:C_Man                   'man'
    "   g:C_ObjExtension          '.o'
    "  Windows:
    "   g:C_CCompiler             'gcc.exe'
    "   g:C_CplusCompiler         'g++.exe'
    "   g:C_ExeExtension          '.exe'
    "   g:C_Man                   'man.exe'
    "   g:C_ObjExtension          '.obj'

    " The variable plugin_dir will automatically be set to one of the following values:
    "   $HOME.'/.vim/'        for Linux/Unix
    "   $VIM.'/vimfiles/'     for Windows


    "  ----------------------------------------------------------------------------
    "  GLOBAL VARIABLE           SHORT EXPLANATION
    "  ----------------------------------------------------------------------------
    "  g:C_CCompiler             : The name of the C compiler.
    "  g:C_CExtension            : Extension of C files. Everything else is C++.
    "  g:C_CFlags                : Compiler flags used for a compilation.
    "  g:C_CodeCheckExeName      : The name of the CodeCheck (TM) executable (the
    "                              default is 'check')
    "  g:C_CodeCheckOptions      : Default options for CodeCheck (TM) (see
    "                              |csupport-run-codecheck|).
    "  g:C_CodeSnippets          : The name of the code snippet directory (see
    "                              |csupport-snippets|).
    "  g:C_CplusCompiler         : The name of the C++ compiler.
    "  g:C_Ctrl_j                : hotkey Ctrl-j 'on'/'off' (see |csupport-Ctrl-j|)
    "  g:C_CustomTemplateFile    : sets the custom template file (see|csupport-templates|)
    "  g:C_Debugger              : the default debugging: 'gdb', 'kdbg', or 'ddd'
    "  g:C_Dictionary_File       : The name(s) of the dictionary file(s) used for
    "                              word completion (see also |csupport-dictionary|)
    "  g:C_ExeExtension          : C/C+ file extension for executables (leading
    "                              point required if not empty)
    "  g:C_GlobalTemplateFile    : sets the global template file (see |csupport-templates|)
    "  g:C_GuiSnippetBrowser     : code snippet browser: 'gui', 'commandline'
    "  g:C_InsertFileHeader      : insert file prolog in a new file ('yes', 'no')
    "  g:C_LFlags                : Compiler flags used for linkage.
    "  g:C_Libs                  : Libraries to link with.
    "  g:C_LineEndCommColDefault : Default starting column for end-of-line comments.
    "  g:C_LoadMenus             : Load menus and mappings ("yes", "no") at startup.
    "  g:C_CreateMenusDelayed    : Load menus only with filetypes 'c' or 'cpp'
    "  g:C_LocalTemplateFile     : sets the local template file (see |csupport-templates|)
    "  g:C_Man                   : The name of the man utility.
    "  g:C_MapLeader             : the map leader for hotkeys (see ||csupport-usage-vim|)
    "  g:C_MenuHeader            : Switch the submenu header on/off.
    "  g:C_NonCComment           : comment leader string for a non-C comment
    "  g:C_ObjExtension          : C/C+ file extension for objects (leading point
    "                              required if not empty)
    "  g:C_OutputGvim            : when program is running output goes to the vim command
    "                              line ("vim"), to a buffer ("buffer") or to an xterm ("xterm").
    "  g:C_Printheader           : hardcopy: definition of the page header
    "  g:C_RootMenu              : The name of the root menu entry of this plugin
    "                              (see |csupport-custom-root|).
    "  g:C_SourceCodeExtensions  : filename extensions for C/C++ implementation files
    "  g:C_TypeOfH               : filetype of header files with extension 'h' (c,cpp)
    "  g:C_VimCompilerName       : the compiler name used by :compiler
    "  g:Xterm_Executable        : the xterm executable
    "  g:Xterm_Options           : the xterm options
    "  g:C_XtermDefaults         : the xterm options
    "                              (included for backwards compatibility)
endif
" }

if &runtimepath =~ 'auto-pairs' "{
    let g:AutoPairs = {}
endif
"}

if &runtimepath =~ 'vim-easytags' "{
    let g:easytags_file = $HOME . '/.vim/tags'
endif
"}
