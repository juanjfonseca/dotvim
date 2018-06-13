" vim: nowrap fdm=marker

" Vim minpac plugin manager {{{1
packadd minpac
call minpac#init()

call minpac#add('sonjapeterson/1989.vim')
call minpac#add('bronson/vim-visual-star-search')
call minpac#add('jpo/vim-railscasts-theme')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-sensible')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-scripts/Tagbar')
call minpac#add('wolfpython/cscope_map.vim')
call minpac#add('octol/vim-cpp-enhanced-highlight')
call minpac#add('Townk/vim-autoclose')

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
set cursorline
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Display line numbers
set relativenumber
set number

" Search settings
set ignorecase
set smartcase

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

" Ignore white space
nmap <silent><leader>w :set diffopt+=iwhite<CR>

" Build Unit Test
nmap <silent><leader>u :make test -j 8<CR>

" Plugin setup {{{1
" FZF
nnoremap <C-p> :<C-u>FZF<CR>

" Tagbar
nmap <silent> <leader>t :TagbarToggle<CR>
let g:tagbar_autoclose = 1 " Automatically close window when jumping to a tag.
let g:tagbar_autoshowtag = 1 " Open the current tags fold to highlight the tag.
let g:tagbar_width = 90

" Cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-
nmap <leader>n :cn<CR>
nmap <leader>p :cp<CR>

" Deoplete
let g:deoplete#enable_at_startup = 1

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

    set background=dark

    if has("win32")
        set guifont=Lucida_Console:h10:cANSI:qDRAFT
    else
        set guifont=Droid\ Sans\ Mono
    endif
endif
