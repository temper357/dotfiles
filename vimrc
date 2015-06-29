set nocompatible

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Define bundles via Github repos
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-fugitive'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'blarghmatey/split-expander'
Bundle 'rking/ag.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/tComment'
Bundle 'scrooloose/nerdtree'
Bundle "tomtom/tlib_vim"
Bundle "skwp/greplace.vim"
Bundle "scrooloose/syntastic"
Bundle 'Lokaltog/vim-easymotion'
Bundle "dkprice/vim-easygrep"
Bundle "myusuf3/numbers.vim"
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'jgdavey/tslime.vim'
Bundle 'henrik/vim-qargs'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mxw/vim-jsx'
Bundle 'pangloss/vim-javascript'
Bundle 'gertjanreynaert/cobalt2-vim-theme'
Bundle 'trusktr/seti.vim'
Bundle 'moll/vim-bbye'
Bundle 'Valloric/YouCompleteMe'
Bundle 'mattn/emmet-vim'
Bundle 'vim-scripts/BufOnly.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'Raimondi/delimitMate'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'othree/html5.vim'
Bundle 'othree/html5-syntax.vim'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
Bundle 'Peeja/vim-cdo'
" Bundle 'Shougo/vimproc.vim'
" Bundle 'Shougo/unite.vim'

filetype on

set shell=/bin/bash
runtime macros/matchit.vim
" use old regext engine. speed up ruby syntax highlighting
set re=1

set ttyfast
set lazyredraw
set breakindent
set clipboard=unnamed
set autoread
set hidden

" let mapleader = ","
" noremap \ ,

nnoremap <leader>ev :vsp $MYVIMRC<CR> " type,evto edit the Vimrc

let $PATH='/usr/local/bin:' . $PATH

" Sessions
let g:session_autoload = 'no'

" Leader Mappings
map <Space> <leader>
map <Leader>w :update<CR>
map <Leader>q :qall<CR>
map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gp :Gpush<CR>
"
if has("gui_running")
  " GUI is running or is about to start.
  "   " Maximize gvim window (for an alternative on Windows, see simalt
  "   below).
  set lines=999 columns=999
endif

" Toggle nerdtree with F10
map <F10> :NERDTreeToggle<CR>
" Current file in nerdtree
map <F9> :NERDTreeFind<CR>
let g:NERDTreeShowHidden=1

" Reduce timeout after <ESC> is recvd. This is only a good idea on fast links.
set ttimeout
set ttimeoutlen=20
set notimeout

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path

" highlight vertical column of cursor
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline
set cursorline

"key to insert mode with paste using F2 key
map <F2> :set paste<CR>i
" Leave paste mode on exit
au InsertLeave * set nopaste

" Command aliases
cabbrev tp tabprev
cabbrev tn tabnext
cabbrev tf tabfirst
cabbrev tl tablast

set backspace=2   " Backspace deletes like most programs in insert mode
set nocompatible  " Use Vim settings, rather then Vi settings
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=500
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set hlsearch      " highlight matches
set laststatus=2  " Always display the status line
" set autowrite     " Automatically :write before running commands

" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" if filereadable(expand("~/.vimrc.bundles"))
"  source ~/.vimrc.bundles
" endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " enable css,sass autocomplete
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd BufNewFile,BufRead *.scss             set ft=scss.css

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

" bind K to search word under cursor
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·

let g:ctrlp_working_path_mode = 'ra'
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup
  let g:grep_cmd_opts = '--line-numbers --noheading'

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " Use ag in unite grep source.
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
        \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
        \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''

endif

" Airline
" let g:airline_powerline_fonts = 1
" if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
" endif
" let g:airline_symbols.space = "\ua0"
" let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1 "enable the tabline
let g:airline#extensions#tabline#fnamemod = ':t' " show just the filename of buffers in the tab line
let g:airline_detect_modified=1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
" Quick Buffer switch mappings {{{
" The idea is to press <leader> and then the number from normal mode to switch
" e.g. `,2` would switch to the second buffer (listed at the top of the
" airline strip
 
":nnoremap <silent> <Leader> :<C-u>try \| execute "b" . v:count \| catch \| endtry<CR>
for i in range(1, 99)
    execute printf('nnoremap <Leader>%d :%db<CR>', i, i)
endfor
for i in range(1, 99)
    execute printf('nnoremap <Leader>d%d :Bdelete %d<CR>', i, i)
endfor
" }}}

set t_Co=256

set smartcase
set ignorecase
set noantialias

" Color scheme
colorscheme cobalt2
" colorscheme seti
set background=dark
set encoding=utf-8

" Font
set guifont=Consolas:h14
set antialias

" Highlight line number of where cursor currently is
hi CursorLineNr guifg=#050505
hi CursorLine guibg=#323232

" Numbers
set number
set numberwidth=5

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Persistent undo
set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000

:nnoremap <expr> y (v:register ==# '"' ? '"+' : '') . 'y'
:nnoremap <expr> yy (v:register ==# '"' ? '"+' : '') . 'yy'
:nnoremap <expr> Y (v:register ==# '"' ? '"+' : '') . 'Y'
:xnoremap <expr> y (v:register ==# '"' ? '"+' : '') . 'y'
:xnoremap <expr> Y (v:register ==# '"' ? '"+' : '') . 'Y'

" convert hash rockets
" nmap <leader>rh :%s/\v:(\w+) \=\>/\1:/g<cr>

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_enable_highlighting=0

" cmd n, cmd p for fwd/backward in search
" map <C-n> :cn<CR>
" map <C-p> :cp<CR>

" Easy navigation between splits. Instead of ctrl-w + j. Just ctrl-j
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" YouCompleteMe Geek Config
set completeopt=longest,menu

let g:ycm_global_ycm_extra_conf                         = '$VIM/vimfiles/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf                            = 0
let g:ycm_add_preview_to_completeopt					= 0

let g:ycm_collect_identifiers_from_tags_files           = 1   " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion               = 2   " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc                                = 1
let g:ycm_seed_identifiers_with_syntax                  = 1   " 语法关键字补全
let g:ycm_complete_in_comments                          = 1   " 在注释输入中也能补全
let g:ycm_complete_in_strings                           = 0   " 在字符串输入中不能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0   " 注释和字符串中的文字也会被收入补全

let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_filetype_blacklist = {
			\ 'tagbar'    : 1,
			\ 'qf'        : 1,
			\ 'notes'     : 1,
			\ 'markdown'  : 1,
			\ 'unite'     : 1,
			\ 'text'      : 1,
			\ 'vimwiki'   : 1,
			\ 'gitcommit' : 1,
\}


nnoremap <F11> :YcmForceCompileAndDiagnostics <CR>
nnoremap <F6>  :SyntasticToggleMode <CR>

" UltiSnips Config
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger       = "<c-e>"
" let g:UltiSnipsListSnippets        = "<c-tab>"
let g:UltiSnipsJumpForwardTrigger  = "<c-f>"
let g:UltiSnipsJumpBackwardTrigger = "<c-b>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Local config
" if filereadable($HOME . "/.vimrc.local")
"   source ~/.vimrc.local
" endif


