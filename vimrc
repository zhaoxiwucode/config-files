" ********************* INITIALIZE ********************
set nocompatible	" must be first line

filetype off

" Only use Vundle if it's installed
if filereadable($HOME.'/.vim/bundle/Vundle.vim/autoload/vundle.vim')
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    Plugin 'gmarik/Vundle.vim'
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'kien/ctrlp.vim'
    Plugin 'JazzCore/ctrlp-cmatcher'
    Plugin 'dart-lang/dart-vim-plugin'
    call vundle#end()

    let g:ctrlp_match_func = {'match' : 'matcher#cmatch'}
    let g:ctrlp_max_files = 0
    let g:ctrlp_show_hidden = 1
    let g:ctrlp_prompt_mappings = {
        \ 'AcceptSelection("e")':['<c-t>'],
        \ 'AcceptSelection("t")':['<cr>', '<2-LeftMouse>'],
        \ }
    let g:ycm_autoclose_preview_window_after_completion = 1
endif

filetype plugin indent on   " Automatically detect file types
syntax on	" syntex highlighting

" ********************* VISUAL *************************
" Solarized color scheme with dark background
set t_Co=16
set background=dark
colorscheme solarized

" Highlight cursor
hi CursorColumn guibg=#333333

if has('cmdline_info')
	set ruler	" show the ruler
	set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)	" a ruler on steroids
	set showcmd	" show partial commands in status line and
			" selected characters/lines in visual mode
endif

if has('statusline')
	set laststatus=2	" always show status line. 1=> only show
				" statusline if >1 window
	set statusline=%m%r%h%w\ %l,%c%V%=%<%p%%[b%n][0x%B][len=%L][%{&ff}][%Y]\ %F
endif

" GVIM- (here instead of .gvimrc)
if has('gui_running')
	set guioptions-=T	" remove the toolbar
	set lines=40	" 40 lines of text instead of 24
	set cursorline	" highlight current line
	" highlight bg color of current line
	hi cursorline guibg=#333333
endif

" ********************* ENVIRONMENT ***********************
set backspace=indent,eol,start
set showmatch
set wildmenu
set wildmode=list:longest,full
set shortmess+=filmnrxoOtT
set showmode
set incsearch
set hlsearch
set autowrite
set whichwrap=b,s,h,l,<,>,[,]
set ignorecase
set smartcase
set backup
if version >= 703
	set undofile
endif

if filereadable($HOME.'/.vim/vimrc-etc/init-file-dirs.vim')
	source ~/.vim/vimrc-etc/init-file-dirs.vim
endif
set updatecount=30
set updatetime=1000
set writebackup
set mouse=a
set textwidth=80
set shell=zsh

if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" ****************** DISPLAY **********************
set nu
set encoding=utf-8
set tabpagemax=15
set winminheight=0
set scrolljump=3
set nofoldenable
if version >= 703
	set colorcolumn=+1
endif

if &textwidth > 1
	if version >= 702
	endif
endif

highlight ExtraWhitespace ctermbg=yellow guibg=yellow
match ExtraWhitespace /\s\+$/

" ****************** FORMATTING *******************
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set pastetoggle=<F12>
