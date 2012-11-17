set nocompatible
autocmd! bufwritepost .vimrc source %

" Clipboard
set pastetoggle=F2>
set clipboard=unnamed

" Backspace and del
set backspace=indent,eol,start
set bs=2

" Rebind <leader> key
let mapleader = ','

" Quicksave command
" Disable terminal flow control: 'stty -ixon'
noremap <C-s> :update<CR>
vnoremap <C-s> <C-C>:update<CR>
inoremap <C-s> <C-O>:update<CR>

" Faster tab movement
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" Bind ctrl+move for split movement
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Map sort function to a key
vnoremap <Leader>s :sort<CR>

" Easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" Show whitespace

" Enable Syntax highlighting
filetype off
filetype plugin indent on
syntax on

" Showing line numbers and height
set number
set tw=79
set nowrap
set fo-=t
set colorcolumn=80
highlight colorcolumn ctermbg=darkred

" History settings
set history=700
set undolevels=700

" Tabs
set autoindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/-folder
call pathogen#infect()

"=================================================
" Python IDE Setup

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode.git
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts=1
let g:pymode_rope_goto_def_newwin="vnew"
let g:pymode_rope_extend_complete=1
let g:pymode_breakpoint=0
let g:pymode_syntax=1
let g:pymode_syntax_builtin_objs=0
let g:pymode_syntax_builtin_funcs=0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigation with omnicomplete
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
  if pumvisible()
    if a:action == 'j'
      return "\<C-N>"
    elseif a:action == 'k'
      return "\<C-P>"
    endif
  endif
  return a:action
endfunction

inoremap <silent>j <C-R>=OmniPopup('j')<CR>
inoremap <silent>k <C-R>=OmniPopup('k')<CR>

" Settings for Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/script.php?src_id=1494
set nofoldenable

" Settings for NERDtree
" cd ~/.vim/bundle
" git clone https://github.com/scrooloose/nerdtree.git
" To Setup rope for new project:
"   * [vim] :RopeOpenProject
"   * if using venv: [vim] :e .ropeproject/config.py
"   * if using venv: set virtual environment
map <F2> <ESC>:NERDTreeToggle<CR>
let NERDTreeDirArrows=0
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
