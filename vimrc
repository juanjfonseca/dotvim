" vim: nowrap fdm=marker

execute pathogen#infect()
syntax on
filetype plugin indent on

" load plugins that ship with vim {{{1
runtime macros/matchit.vim
runtime ftplugin/man.vim

" Autocommands {{{1
if has("autocmd")
    augroup vimrcEx
        au!
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif
    augroup END
endif

" Preferences {{{1
" Indentation {{{2
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Display line numbers
set relativenumber

" Store temporary files in a central spot {{{2
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp

" Mappings {{{1
" Quick toggles {{{2
nmap <silent> <leader>s :set spell!<CR>
nmap <silent> <leader>l :set list!<CR>
nmap <silent> <CR> :silent :nohlsearch<CR>
nmap <silent> <leader>h :set hlsearch!<CR>

" Commands to quickly set >1 option in one go {{{2
command! -nargs=* Wrap set wrap linebreak nolist
command! -nargs=* Maxsize set columns=1000 lines=1000

" File opening {{{2
" Shortcut for opening file in same directory as current file
cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Switch current buffer with # buffer
nnoremap <leader><leader> <c-^>

" Move around splits with <c-hjkl> {{{2
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Vimrc maintenance {{{2
nmap <silent> <leader>v :e $MYVIMRC<CR>

" Save modified file {{{2
inoremap <c-s> <ESC>:w<CR>
noremap <c-s> <ESC>:w<CR>

" Plugin setup {{{1
" Tagbar {{{2
nnoremap <silent> <leader>t :TagbarToggle<CR>
let g:tagbar_autoclose = 1 " Automatically close window when jumping to a tag.
let g:tagbar_width = 70
let g:tagbar_autoshowtag = 1 " Open the current tags fold to highlight the tag.

" CtrlP {{{2
nnoremap <leader>f :<C-u>CtrlP<space>
nnoremap <silent> <leader>m :<C-u>CtrlPMRU<cr>
nnoremap <silent> <leader>b :<C-u>CtrlPBuffer<cr>

" Cscope {{{2
set cscopequickfix=s-,c-,d-,i-,t-,e-
" Next occurence
nnoremap <leader>n :cn<CR>
" Previous occurence
nnoremap <leader>p :cp<CR>

" Fix constant spelling mistakes {{{1
iab teh       the
iab Teh       The
iab taht      that
iab Taht      That
iab alos      also
iab Alos      Also
iab aslo      also
iab Aslo      Also
iab becuase   because
iab Becuase   Because
iab bianry    binary
iab Bianry    Binary
iab bianries  binaries
iab Bianries  Binaries
iab charcter  character
iab Charcter  Character
iab charcters characters
iab Charcters Characters
iab exmaple   example
iab Exmaple   Example
iab exmaples  examples
iab Exmaples  Examples
iab shoudl    should
iab Shoudl    Should
iab seperate  separate
iab Seperate  Separate
iab fone      phone
iab Fone      Phone
iab wiht      with

" Custom commands {{{1
" Run OS command {{{2
function! RunSystemCall(systemcall)
    let output = system(a:systemcall)
    let output = substitute(output, "\n", '', 'g')
    return output
endfunction

" Clean current buffer {{{2
function! Cleanup()
    set ff=unix
    %s/\s*$//
    ''
    %s/\t/    /g
    ''
endfunction
map <silent> <F2> :call Cleanup()<CR>
map! <silent> <F2> :call Cleanup()<CR>

" Load Checkedout Congo Files and tags File {{{2
function! LoadCongo()
    cd $CONGO_VIEW//spec_apps/Congo/Source/Host
    args `cleartool lsprivate -co -short`
    set tags=$CONGO_VIEW//spec_apps/Congo/Source/tags
    bd 1
endfunction

" Load Quickfix files into args {{{2
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

" Colorscheme {{{1
colorscheme railscasts

" GVIM only {{{1
if has("gui_running")
    " Do not use modal alert dialogs! (Prefer Vim style prompt.)
    " http://stackoverflow.com/questions/4193654/using-vim-warning-style-in-gvim
    set guioptions+=c
    " Do not use scrollbars
    set guioptions-=rL
    " Do not use the toolbar
    set guioptions-=T
    set guioptions-=m

    set guicursor=n-v-c:block-Cursor-blinkon0
    set guicursor+=ve:ver35-Cursor
    set guicursor+=o:hor50-Cursor
    set guicursor+=i-ci:ver25-Cursor
    set guicursor+=r-cr:hor20-Cursor
    set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
    
    if has("win32")
        set guifont=Lucida_Console
    else
        set guifont=Droid\ Sans\ Mono
    endif
endif
