"" scrooloose/nerdtree

" The script provides the following options that can customise the behaviour the
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
