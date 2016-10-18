" ====================================================
" General settings and plugins. ====================== 
" ====================================================

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" General
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-pathogen'

" VIM theming
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
" Plugin 'chriskempson/base16-vim'
" Plugin 'flazz/vim-colorschemes'

" Base plugins for work
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-scripts/vim-auto-save'
" Plugin 'gregsexton/MatchTag'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'vim-scripts/taglist.vim'
" Plugin 'SirVer/ultisnips'

" C/C++ Development
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Mizuchi/STL-Syntax'
Plugin 'Shougo/neocomplete.vim'
Plugin 'scrooloose/syntastic'
" Plugin 'xolox/vim-misc'
" Plugin 'vim-scripts/a.vim'
" Plugin 'majutsushi/tagbar'

" python/django
" Plugin 'vim-scripts/django.vim'
" Plugin 'kevinw/pyflakes-vim'
" Plugin 'jmcomets/vim-pony'
" Plugin 'tpope/vim-surround'
" Plugin 'vim-scripts/xmledit'

" Web-development
" Plugin 'mattn/emmet-vim'
" Plugin 'skammer/vim-css-color'      
" Plugin 'vim-scripts/loremipsum'
" Plugin 'hail2u/vim-css3-syntax' 
" Plugin 'kchmck/vim-coffee-script'
" Plugin 'StanAngeloff/php.vim'
" Plugin 'jaxbot/browserlink.vim'
" Plugin 'groenewege/vim-less'

call vundle#end()            " required
filetype plugin indent on    " required

call pathogen#infect()

let mapleader = ","
let g:mapleader = ","
nmap <leader>rr :source ~/.vimrc

" Source vimrc file
nmap ,rr :source ~/.vimrc<CR>

" Fast saving
nmap <leader>w :w!<CR>
" Fast quit
nmap <leader>q :qall!<CR>

set mouse=a

" Very important
set nobackup
set nowb
set noswapfile

" Change the file when it's changed from the outside
set autoread

" Set wildmode
set wildmode=longest:full,full

" Use wildmenu
set wildmenu

" Ignoce compiled files
set wildignore=*.o,*~,*.pyc

" Show currect position
set ruler

" Set how much VIM has to remember
set history=5048

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" ====================================================
" VIM user interface =================================
" ====================================================

" Commang line height
set cmdheight=2

" Configure backspace so it acts as it should acts
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search like in modenr browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Turn on magic for regular expressions
set magic

" Show matching brackets
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Turn off add hihlights
map <leader>hl :nohlsearch<CR>

" Sound errors!!!
set noerrorbells
set novisualbell
set t_vb=
set tm=500

syntax enable

set t_Co=256

" For GUI
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set guitablabel=%M\ %t
endif

" Set encoding to UTF-8
set encoding=utf-8

" Unix as standart file type(ff)
set ffs=unix,dos,mac

set laststatus=2
set number 

set expandtab
set shiftwidth=4
set smarttab

set autoindent
set smartindent

" Work with windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Work with tabs
map <leader>tn :tabnew<CR>
map <leader>to :tabonly<CR>
map <leader>tb :tabclose<CR>
map <leader>tm :tabmove

" Work with buffers
map <leader>nn :bnext<CR>
map <leader>pp :bprevious<CR>
map <leader>bd :bd<CR>

" Remember info about open buffer on close
set viminfo^=%

" C++ Syntax highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

" Return to last edit position
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \ exe "normal! g`\"" |
            \ endif

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("%")

    if buflisted(l:alternateBufNum)
        buffer #
    else 
        bnext
    endif

    if bufnr("#") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction
 
" ====================================================
" vim-colors-solarized  ==============================
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" ====================================================
" vim-airline ========================================

let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_section_b = '%{strftime("%c")}'
let g:airlone_section_y = 'BN: %{bufnr("%")r'

" ====================================================
" Emmet-vim ==========================================
" let g:user_emmet_leader_key='<C-e>'
" ====================================================

" ====================================================
" delimitMate ========================================
 
let delimitMate_expand_cr = 1
au FileType mail let b:delimitMate_expand_cr = 1
" ====================================================

" ====================================================
" start NerdTree on start-up and focus active window =
 "autocmd VimEnter * NERDTree
 "autocmd VimEnter * wincmd p
" ====================================================
 
" ====================================================
" NERDTreeTabs =======================================
 
map <leader>n <plug>NERDTreeTabsToggle<CR>
" ====================================================

" ====================================================
" CPP syntax highlighting ============================
 
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
" ====================================================

" ====================================================
" Python settings ====================================

autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4
" ====================================================

" ====================================================
" neocomplete.vim ====================================
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" ====================================================
" vim-auto-save ======================================
let g:auto_save_silent = 1

" ====================================================
" syntastic ==========================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
