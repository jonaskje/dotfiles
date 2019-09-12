call plug#begin('~/.vim/plugged')
Plug 'rust-lang/rust.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'flazz/vim-colorschemes'
call plug#end()

language C
set autowrite 
set backspace=eol,start,indent
set clipboard=unnamed
set hidden
set history=3000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set noswapfile 
set scrolloff=10
set statusline=%f\ %m%r%=\ C:%c\ (%v)\ R:%l/%L 
set synmaxcol=200 " No syntax highlighting of long files
set virtualedit=onemore
set relativenumber
set number
syntax on

" Allow cursor one char after last character on line
set virtualedit=onemore

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

" > rust.vim
let g:autofmt_autosave = 1
" < rust.vim

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif

nmap <silent> K :LspHover<cr> 
nmap <silent> gd :LspDefinition<cr>
nmap <silent> <F2> :LspRename<cr>
nmap <F3> :cn<CR>
nmap <S-F3> :cp<CR>
nmap <silent> <F7> :silent!mak<cr>

nmap <M-j> }
nmap <M-k> {

nmap <M-h> b
nmap <M-l> el


if has("gui_running")
	" not sure which of these I like most...
	"set guifont=DejaVu_Sans_Mono_for_Powerline:h8:cDEFAULT:qDEFAULT
	set guifont=DejaVu_Sans_Mono_for_Powerline:h10:cDEFAULT:qCLEARTYPE
	set guioptions-=T   "no toolbar
	set guioptions-=m   "no menubar
	colorscheme solarized8_dark
	"colorscheme molokai
endif

" a visual hint in the terminal to see if in insert mode or not
:autocmd InsertEnter * set nocul
:autocmd InsertLeave * set cul

au! BufWritePost ~\.vimrc source %

" This will automatically open/close the quick fix window if there are build
" errors
"autocmd QuickFixCmdPost [^l]* nested copen
autocmd QuickFixCmdPost [^l]* nested cw
autocmd QuickFixCmdPost    l* nested lwindow


