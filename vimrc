" vim: nowrap fdm=marker

" Vim Plug plugin manager {{{1
if has("win32")
    call plug#begin('~/vimfiles/bundle')
else
    call plug#begin('~/.vim/bundle')
endif

Plug 'bronson/vim-visual-star-search'
Plug 'jpo/vim-railscasts-theme'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/Tagbar'
Plug 'wolfpython/cscope_map.vim'
Plug 'altercation/vim-colors-solarized'

call plug#end()

" Map leader key {{{1
" Use the space key as our leader. Put this near the top of your vimrc
let mapleader = "\<Space>"

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

" Bind `q` to close the buffer for help files
autocmd Filetype help nnoremap <buffer> q :q<CR>

" Preferences {{{1
" Indentation
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Display line numbers
set relativenumber

" Store temporary files in a central spot
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp

" Mappings {{{1
" Quick toggles
nmap <silent> <leader>l :set list!<CR>
nmap <silent> <leader>s :set spell!<CR>

" File opening
" Shortcut for opening file in same directory as current file
cmap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Switch current buffer with # buffer
nmap <leader><leader> <c-^>

" Vimrc maintenance
nmap <silent> <leader>v :e $MYVIMRC<CR>
nmap <silent> <leader>so :source $MYVIMRC<CR>

" Save modified file
imap <c-s> <ESC>:w<CR>
map <c-s> <ESC>:w<CR>

" Plugin setup {{{1
" Tagbar
nmap <silent> <leader>t :TagbarToggle<CR>
let g:tagbar_autoclose = 1 " Automatically close window when jumping to a tag.
let g:tagbar_autoshowtag = 1 " Open the current tags fold to highlight the tag.
let g:tagbar_width = 70

" CtrlP
nmap <leader>f :<C-u>CtrlP<space>
nmap <silent> <leader>m :<C-u>CtrlPMRU<cr>
nmap <silent> <leader>b :<C-u>CtrlPBuffer<cr>

" Cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-
nmap <leader>n :cn<CR>  " Next occurence
nmap <leader>p :cp<CR>  " Previous occurence

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
" Clean current buffer
function! Cleanup()
    set ff=unix
    %s/\s*$//
    ''
    %s/\t/    /g
    ''
endfunction
map <silent> <F2> :call Cleanup()<CR>
map! <silent> <F2> :call Cleanup()<CR>

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

    colorscheme solarized

    if has("win32")
        set guifont=Lucida_Console
    else
        set guifont=Droid\ Sans\ Mono
    endif
else
    colorscheme railscasts
endif
