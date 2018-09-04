" Vim minpac plugin manager {{{1
packadd minpac
call minpac#init()

call minpac#add('bronson/vim-visual-star-search')
call minpac#add('jpo/vim-railscasts-theme')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-fugitive')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-scripts/Tagbar')
call minpac#add('octol/vim-cpp-enhanced-highlight')
call minpac#add('Townk/vim-autoclose')
call minpac#add('altercation/vim-colors-solarized')

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
" General configuration options:
set nocompatible " Use Vim settings, rather then Vi settings
set backspace=indent,eol,start " Allow backspacing over indention, line breaks and insertion start
set history=1000 " Set bigger history of executed commands
set showcmd " Show incomplete commands at the bottom
set showmode " Show current mode at the bottom
set autoread " Automatically re-read files if unmodified inside Vim
set hidden " Manage multiple buffers effectively

" User Interface Options
set laststatus=2 " Always display the status bar
set ruler " Always show cursor position
set wildmenu " Display command line’s tab complete options as a menu
set tabpagemax=40 " Maximum number of tab pages that can be opened from the command line
set cursorline " Highlight the line currently under cursor
:highlight cursorline guibg=lightblue ctermbg=lightgrey
set number " Show line numbers on the sidebar
set relativenumber " Show line number on the current line and relative numbers on all other lines
set noerrorbells " Disable beep on errors
set visualbell " Flash the screen instead of beeping on errors
set mouse=a " Enable mouse for scrolling and re-sizing
set title " Set the window’s title, reflecting the file currently being edited

" Swap and backup file options
set noswapfile
set nobackup
set nowb

" Indentation options:
set autoindent " New lines inherit the indentation of previous lines
filetype plugin indent on " Smart auto indentation (instead of old smartindent option)
set softtabstop=4 " Indent by 2 spaces when hitting tab 
set tabstop=4 " Show existing tab with 4 spaces width
set shiftwidth=4 " When indenting with ‘>’, use 2 spaces width
set expandtab " On pressing tab, insert 4 spaces
set nowrap " Don’t wrap lines

" Search options:
set incsearch " Find the next match as we type the search
set hlsearch " Highlight searches by default
set ignorecase " Ignore case when searching . . 
set smartcase " . . . unless you type a capital

" Text rendering options:
set encoding=utf-8 " Use an encoding that supports Unicode
set linebreak " Wrap lines at convenient points, avoid wrapping a line in the middle of a word
set scrolloff=3 " The number of screen lines to keep above and below the cursor
set sidescrolloff=5 " The number of screen columns to keep to the left and right of the cursor
syntax enable " Enable syntax highlighting

" Miscellaneous Options:
set confirm " Display a confirmation dialog when closing an unsaved file
set nomodeline " Ignore file’s mode lines; use vimrc configurations instead
set nrformats-=octal " Interpret octal as decimal when incrementing numbers
set spell " Enable spellchecking
set spell spelllang=en_us

" Store temporary files in a central spot
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp

" Mappings {{{1
" Remove highlights from the last search
nmap <silent> <leader>h :noh<CR>

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

" Quickfix
nmap <leader>n :cn<CR>
nmap <leader>p :cp<CR>

" Cscope
set cscopequickfix=
set cscopetag 
nmap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
nmap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
nmap <leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>	
nmap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
nmap <leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <leader>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>

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

" GVIM only {{{1
if has("gui_running")
    colorscheme solarized
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
else
    colorscheme railscasts
endif
