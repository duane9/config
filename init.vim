" brew install fzf fd nvim ripgrep bat pyright pylint flake8
" Put this file in ~/.config/nvim/init.vim
" Install vim-plug
" pip3 install pynvim
" nvim
" :PlugInstall

" ========================================
" Plugins
" ========================================

call plug#begin('~/.config/nvim/plugged')

" Linters and autocomplete
Plug 'github/copilot.vim'
Plug 'davidhalter/jedi-vim', {'dir': '~/.config/nvim/plugged/jedi-vim', 'do': 'git submodule update --init --recursive'}
Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier'
Plug 'alvan/vim-closetag'
" Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-endwise'

" Everything else
Plug 'wellle/context.vim'
Plug 'ruanyl/vim-gh-line'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'duane9/nvim-rg'
Plug 'duane9/jellybeans.vim'
Plug 'alec-gibson/nvim-tetris'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'embear/vim-foldsearch'
Plug 'roblillack/vim-bufferlist'
Plug 'osyo-manga/vim-anzu/'
Plug 'ervandew/supertab'
Plug 'leafOfTree/vim-matchtag'
Plug 'ap/vim-css-color'
" Plug 'airblade/vim-gitgutter'
Plug 'plasticboy/vim-markdown'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'pocco81/auto-save.nvim'

call plug#end()

" ========================================
" Settings
" ========================================

filetype plugin on
filetype indent on
syntax on

let g:python3_host_prog = '/usr/bin/python3'

au BufNewFile,BufRead *.html set filetype=htmldjango

" Color scheme settings
colorscheme jellybeans
set background=dark
set conceallevel=0

set mouse=i

" We're using auto-save, so turn off swap files
set noswapfile

" Quickfix reflector
let g:qf_modifiable = 0
map <leader>qt :let g:qf_modifiable = 1<CR>:ASToggle<CR>
map <leader>noqt :let g:qf_modifiable = 0<CR>:ASToggle<CR>

" Don't automatically close quotation marks
let g:AutoClosePairs_del = "\" '"

" nvim-rg
let g:rg_command = 'rg --smart-case --vimgrep'

" context.vim
let g:context_enabled = 0

" copilot
imap <silent><script><expr> <C-f> copilot#Accept('\<CR>')
let g:copilot_no_tab_map = v:true
" ALT-]
inoremap ‘ <Plug>(copilot-next)
" ALT-[
inoremap “ <Plug>(copilot-previous)
" ALT-\
inoremap « <Plug>(copilot-suggest)

" jedi-vim
let g:jedi#popup_on_dot = 0

" ale linter
let g:ale_linters = {'javascript': ['eslint'], 'python': ['flake8', 'pylint', 'pyright']}
let g:ale_python_flake8_options = '--max-line-length=120'
let g:ale_virtualtext_cursor = 'disabled'
let g:ale_sign_column_always = 1
let g:ale_use_neovim_diagnostics_api = 1
let g:ale_enabled = 0

" bufferlist colors
hi BufferSelected term=reverse ctermfg=black ctermbg=white cterm=bold
hi BufferNormal term=NONE ctermfg=white ctermbg=black cterm=NONE

" Change leader from default \ to ,
let mapleader = ','

" Markdown settings
" set tw=64
au BufRead,BufNewFile *.md setlocal conceallevel=2
let g:vim_markdown_folding_disabled = 1

" Statusline
set statusline +=\ %F  " Full path to file
set statusline +=%=%-14.(%l,%c%V%)  " Line, column-virtual column
set statusline +=%m
hi StatusLine ctermbg=gray ctermfg=black

" Reformat an X.509 certificate
map <leader>ce :s/\v(.{64})/\1\r/g<CR>

" Super tab scroll from top
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType =  "<c-n>"

" Autocomplete
setlocal omnifunc=syntaxcomplete#Complete
set dict+=~/.config/nvim/dict.txt
set complete+=k

" Set tabs
set expandtab  " Expands tabs to spaces
set sw=4 ts=4 sts=4
:command Tab2 set expandtab sw=2 ts=2 sts=2
:command Tab4 set expandtab sw=4 ts=4 sts=4
:command TabTab set noet ci pi sts=0 sw=4 ts=4
map <leader>2 :Tab2<CR>
map <leader>4 :Tab4<CR>
map <leader>tt :TabTab<CR>

" Misc commands
map <leader>t :tabe<CR>
map <leader>bg :Git blame<CR>
map <leader>w :w<CR>

" Spellcheck for code
map <leader>sp :syn off<CR>:set spell<CR>
map <leader>spx :syn on<CR>:set nospell<CR>

map <leader>ff :FZF<CR>
command! -nargs=? -complete=file -nargs=? Rr call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
map <leader>rr :Rr <C-R><C-W><CR>

" Show filename at bottom
set modeline
set ls=2

" Show column number in status bar
set ruler

" Get rid of pipes in split dividers
:set fillchars+=vert:\ 

" Turn off split with documentation in complete
:set completeopt-=preview

" Show line numbers
set nu

" Start searching for term as it's typed
set ignorecase
set smartcase
set incsearch

" Turn off annoying beeps and replace with flash on the screen
set vb t_vb=

" Highlight all matches of a search
set hlsearch

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc

" Set word wrap to break and word boundaries
set wrap linebreak nolist

" Spell check
set nospell

" Show end-of-line characters
set list

" Blinking cursor
set guicursor=a:blinkon100
"set guicursor=

" Set up development environment
map <leader>st <leader>vs<leader>ba<Esc><Esc><leader>hs<leader>hs
map <leader>gen <leader>vs<leader>ba 

" Terminal mode
map <leader>ba :terminal<CR>:set nonu<CR>:set nospell<CR>:setlocal statusline=%=%-14.(%l,%c%V%)<CR><Esc><Esc>

" Get out of terminal
tnoremap <Esc><Esc> <C-\><C-n>

" Foldsearch for class and def
map <leader>fc :Fp class\\|  def\\|^def<CR>

" Buffers and splits
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
map <leader>bu :call BufferList()<CR>
map <leader>bl :call BufferList()<CR>
map <leader>x <C-j>:q<CR>
map <leader>q <C-k>:q<CR>
map <leader>mx <C-W>_
map <leader>eq <C-W>=
map <leader>hs :split<CR><leader>ba<Esc><Esc>
map <leader>new :split<CR><C-J>:enew<CR>
map <leader>vs :vsplit<CR>
map <leader>lo :lopen<CR>
set hidden
set wmh=0
set notbs  " gets rid of error message about tags not being sorted

" Copy to regular clipboard
map <leader>c "+y<CR>

" Paste form regular clipboard
map <leader>p "+p<CR>

" Open URL under cursor in browser
map <leader>gx :!/usr/bin/open <cWORD><CR>

" ========================================
" Lua settings
" ========================================

lua << EOF
    require("auto-save").setup()
EOF
