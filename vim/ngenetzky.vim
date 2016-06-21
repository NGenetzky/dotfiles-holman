" Nathan Genetzky
" ngenetzky@usgs.gov | nathan@genetzky.us
" References:
" registers:http://stackoverflow.com/a/3997110
" vimgrep+regex+magic:http://vi.stackexchange.com/a/2279
" Example vimrc stuff: https://github.com/amix/vimrc
"
" Example vimrc
" https://github.com/seejohnrun/dotfiles/blob/master/.vimrc
" http://chibicode.com/vimrc/

set encoding=utf-8
scriptencoding utf-8

source ~/.dotfiles/vim/setup_vundle.vim
source ~/.dotfiles/vim/setup_lightline.vim
source ~/.dotfiles/vim/setup_c.vim
source ~/.dotfiles/vim/setup_ycm.vim
source ~/.dotfiles/vim/setup_project.vim
source ~/.dotfiles/vim/setup_fugitive.vim
source ~/.dotfiles/vim/setup_syntastic.vim
source ~/.dotfiles/vim/setup_golden_view.vim
source ~/.dotfiles/vim/setup_unite.vim
source ~/.dotfiles/vim/setup_ctrl_p.vim

" Better command-line completion
" set wildmenu            " visual autocomplete for command menu
set wildmode=longest:full,list:full

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Turn auto-wrapping off.
set formatoptions-=t

" Shows syntax highlighting
syntax on

set undofile   " Maintain undo history between sessions
set undodir=~/.vim/undo/

" Replace bad characters with unicode so they are seen easily
" src: Damian Conway, More Instanly Better Vim  Sep 10 2013 on Youtube
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
" src: https://github.com/lukemetz/vim/blob/8466bdde18b0e33a000324fc22bb9092798dbe45/gvimrc
" set listchars=trail:·,precedes:«,extends:»,tab:»
set list


"" Color column
" Set color of color column
"highlight ColorColumn ctermbg=235 guibg=#2c2d27
" Set color of color column
highlight ColorColumn ctermbg=235

" Color column - Highlight column $textwidth with color $colorcolumn
set textwidth=80
let &colorcolumn=join(range(81,999),",")
"set colorcolumn=80

set previewheight=20

" Color column - Highlight any text longer than 80 char.
"au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%80v.\+',-1)
"au BufWinEnter * let w:m2=matchadd('ColorColumn', '\%80v.\+',-1)

"------------------------------------------------------------
" Indentation options {{{
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4
"------------------------------------------------------------
" }}}

"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" jk is escape in insert mode
inoremap jk <esc>

" use ; as :
nnoremap ; :

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Converting case
" Change selected text from name_like_this to NameLikeThis.
vnoremap crc :s/_\([a-z]\)/\u\1/g<CR>gUl
" Change selected text from NameLikeThis to name_like_this.
vnoremap crs :s/\<\@!\([A-Z]\)/\_\l\1/g<CR>gul

" highlight last inserted text
 "nnoremap gV `[v`]

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

nmap <F2> :NERDTreeToggle<CR>
nmap <silent> <F3> <Plug>ToggleProject
nmap <F4> :GundoToggle<CR>
nmap <F5> :TagbarToggle<CR>
nmap <F6> :ToggleGStatus<CR>

" Defined in setup_syntastic
nmap <F9> :SyntasticCheck<CR>
nmap <F12> :SyntasticReset<CR>

" Force the width to be 80 char wide
nmap <F8> :vertical resize 80<CR>

" Leader mappings   ---------------------------------------
let mapleader=","       " leader is comma

" Save or load session
nnoremap <leader>s :mksession ~/.vim/sessions/
nnoremap <leader>l :source ~/.vim/sessions/

" Insert a space and then return to visual mode
noremap <leader><Space> i 

" Search for text within highlighted section only.
vnoremap <leader>/ <Esc>/\%V

" Make it easier to go to the h=^=front/end=$=l of lines
noremap <leader>h ^
noremap <leader>l $

" Insert Date(d) or Time(t)
noremap <leader>d :put =strftime('%Y-%m-%d')<C-M>
noremap <leader>t :put =strftime('%H:%M')<C-M>

" Refresh my source file
noremap <leader>r :so ~/.vimrc<CR>

" Surround word with quote
" Imported from:
" https://mkaz.github.io/2011/08/31/vim-cheat-sheet/
" Not able to verify...
"map <Leader>' ysiw'
"map <Leader>" ysiw"

" Add Trailing Semi-colon
map <Leader>; g_a;<Esc>

" Uses a tmp file as a global clipboard
vmap <leader>y :w! /tmp/vitmp<CR>
nmap <leader>p :r! cat /tmp/vitmp<CR>

nmap <leader>8 80A <Esc>d80|

" Saves all files that have been modified and runs make. \| is required to use
" the bar/pipe inside the mapping.
map <leader>m :update \| make <CR>

vmap <leader>c :!column -t<CR>

"------------------------------------------------------------
" }}}
"------------------------------------------------------------
" Functions {{{1
function! InstallVundle()
    !git clone https://github.com/gmarik/vundle.git ~/.dotfiles/vim/bundle/Vundle.vim
endfunction
function! NGEmail()
    normal inathan@genetzky.us
endfunction
fu! Vimrc()
    source ~/.vimrc
endfunction
fu! LoggerEditor()
    " Import logging library
    let @i = 'aimport logging'

    " In every function
    let @l = 'alogger = logging.getLogger(__name__)  # Obtain logger for this module.'
    " replace <msg = >
    let @m = ':s/msg = /logger.info(/ge'

    " find logIt
    let @n = '/logIt'
    " Replace info message with error message
    let @e = ':s/logger.info/logger.error/ge'

    " Convert from % string style to format style
    " replace < % >
    let @f = ':s/ % /.format(/ge'

    " Convert from % string style to format style
    " replace < + >
    let @g = ':s/ + /.format(/ge'

    " replace <%s> and <%d>
    let @d = ':s/%d/{}/ge'
    let @s = ':s/%s/{}/ge'

    " Insert text between first {} on line.
    let @p = '^/{}a'

    " Find all lines in python files longer than 80 characters
    let @e = ':vimgrep /\(^.\{80,}\)\@<=./ **/*.py'

    " Find all logger messages:
    " /\(^\s*logger.*(\)\('.*\|'.*'\n\s*'.*\).*)/
    "vimgrep /^\s*logger.*(.*' +\n.*)/ **/*.py

    " replace <'>
    "let @q = ':s/"/\'/ge'
    "let @q = !normal :s/'/"€kb€kb€kb"/'/ge
endfunction

fu! Batch_mod_2015_11_19()
    " Execute on all python in cwd and in any sub directories
    args **/*.py
    set hidden
    " Will find logger and < +> on the same line. < +> must be at end of line
    " example
    "-logger.error('Burn probability directory does not exist: ' +
    "-             bp_dir)
    "+logger.error('Burn probability directory does not exist: {0}'
    "+             .format(bp_dir))
    argdo :%s/\(^\s*logger.*(.*\)' +\(\n\s*\)\(.*)\)/\1{0}'\2.format(\3)/e

    " Will find logger and < + > on the same line
    " example:
    "-logger.info('Creating output directory ' + output_dir)
    "+logger.info('Creating output directory {0}'.format(output_dir))
    argdo :%s/\(^\s*logger.*('.*\)' + \(.*)\)/\1{0}'.format(\2)/e

    " Will find logger on first line. Then find <' + > after a quoted string
    " on the 2nd line.
    " example:
    " logger.error('Error resampling bands stack file.  No bands were '
    "-             'specified in ' + stack_file)
    "+             'specified in {0}'.format(stack_file))
    argdo :%s/\(^\s*logger.*('.*'\n\s*'.*\)' + \(.*)\)/\1{0}'.format(\2)/e

    " Write files
    argdo update
endfunction

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
"------------------------------------------------------------
" }}}
