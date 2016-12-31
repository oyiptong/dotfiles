" Begin /etc/vimrc
" Vundle first
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'elzr/vim-json'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'chase/vim-ansible-yaml'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-ragtag'
Plugin 'Valloric/MatchTagAlways'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'hdima/python-syntax'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'tpope/vim-fugitive'
Plugin 'rust-lang/rust.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'elixir-lang/vim-elixir'
Plugin 'chrisbra/csv.vim'
call vundle#end()

filetype indent on
filetype plugin on
syntax on

" syntax highlighting for less
au BufRead,BufNewFile *.less setfiletype css
au BufRead,BufNewFile *.jinja2 setfiletype jinja
au BufRead,BufNewFile *.jsm setfiletype javascript
au BufRead,BufNewFile *.xul setfiletype xml
au BufRead,BufNewFile *.json setfiletype json
au BufRead,BufNewFile .jscsrc setfiletype json
au BufRead,BufNewFile .jshintrc setfiletype json
autocmd FileType c,cpp,java,php,javascript,xml,css,jinja,xul,ruby,python autocmd BufWritePre <buffer> :%s/\s\+$//e

set hlsearch
set incsearch
set ruler
set et
set sw=4
autocmd FileType ruby setlocal sw=2
autocmd FileType javascript setlocal sw=2
autocmd FileType json setlocal sw=2
autocmd FileType html setlocal sw=2
autocmd FileType css setlocal sw=2
set ignorecase
set smartcase
set smarttab
set expandtab
autocmd FileType make set noexpandtab
set number
set backspace=indent,eol,start
set scrolloff=5
if exists('+colorcolumn')
    set colorcolumn=100
endif

set grepprg=ack
set grepformat=%f:%l:%m


set backupdir=~/.vimbackup//
set directory=~/.vimbackup//

" Automatically create .backup directory, writable by the group.
if filewritable("~/.") && ! filewritable("~/.vimbackup")
    silent execute '!umask 002; mkdir ~/.vimbackup'
endif

" write the file as the super user
cmap w!! %!sudo tee > /dev/null %

" syntax completion
set ofu=syntaxcomplete#Complete
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
let mapleader = "\\"

set title
runtime macros/matchit.vim
set wildmenu
set wildignore+=*.swp,*.swo,*.bak,*.pyc,*.class
set nobackup
set nowritebackup
" set noswapfile
set wildmode=list:longest
colo torte
if (&term == "iterm") || (&term == "putty")
  set background=light
endif

" Key bindings
noremap <silent> <F2> :silent noh<Bar>echo<CR>
noremap <silent> <F1> :silent noh<Bar>echo<CR>
" easy to remember splits, turn search highlight off with space
map <leader>s :split<CR>
map <leader>vs :vsplit<CR>

" GVim / MacVim
if has('gui_running')
  " set noantialias
  " set guifont=Monaco:h14
  set antialias
  set guifont=Inconsolata:h14
  colorscheme vividchalk
  " colorscheme wombat

  set go-=T
  set bg=dark
  set vb t_vb=
  hi normal guibg=black
  set transp=2
endif

au! BufWritePost .vimrc source %

let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:indentLine_enabled = 1
let g:vim_json_syntax_conceal = 0
let python_highlight_all = 1
let python_version_2 = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_json_checkers = ['jsonlint']
autocmd FileType javascript let b:syntastic_checkers = findfile('.eslintrc', '.;') != '' ? ['eslint'] : findfile('.jscsrc', '.;') != '' ? ['jshint', 'jscs'] : ['jshint']
let g:syntastic_javascript_jshint_exec='~/.nvm/versions/node/v5.5.0/bin/jshint'
let g:syntastic_javascript_jscs_exec='~/.nvm/versions/node/v5.5.0/bin/jscs'
let g:syntastic_javascript_eslint_exec='~/.nvm/versions/node/v5.5.0/bin/eslint'
let syntastic_mode_map = { 'passive_filetypes': ['html'] }
let g:syntastic_python_checkers = ['flake8']
let g:airline#extensions#tabline#enabled = 1

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc
let g:NERDTreeIgnore=['\~$', '\.pyc$']
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$|obj_.*$|\v[\/](node_modules|dist|build)$',
    \ 'file': '\v\.(exe|so|dll|pyc|ico)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }
" let g:rustfmt_autosave = 1
" End /etc/vimrc
"
