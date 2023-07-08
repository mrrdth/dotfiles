set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
if isdirectory(expand('$HOME/.vim/bundle/Vundle.vim'))
  call vundle#begin()
  " Required
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'gmarik/vundle'
  " Install plugins that come from github.  Once Vundle is installed, these can be
  " installed with :PluginInstall
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'vim-scripts/netrw.vim'
  Plugin 'tpope/vim-sensible'
  Plugin 'octol/vim-cpp-enhanced-highlight'
  " Provide many default snippets for a variety of snippets.
  " Uncomment and :PluginInstall to enable
  Plugin 'honza/vim-snippets'
  Plugin 'epeli/slimux'
  Plugin 'ctrlp.vim'
  Plugin 'FelikZ/ctrlp-py-matcher'
  Plugin 'vim-airline/vim-airline'
  Plugin 'Chiel92/vim-autoformat'
  call vundle#end()
else
  echomsg 'Vundle is not installed. You can install Vundle from'
      \ 'https://github.com/VundleVim/Vundle.vim'
endif
set directory^=$HOME/.vim/swap//
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set ignorecase
execute pathogen#infect()
filetype plugin indent on
"===================="
" Some basic options "
"===================="
" Enable syntax highlighting
syntax enable
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
" Automatically change the working path to the path of the current file
autocmd BufNewFile,BufEnter * silent! lcd %:p:h

" Show line numbers
set number

" use » to mark Tabs and ° to mark trailing whitespace. This is a
" non-obtrusive way to mark these special characters.
set list listchars=tab:»\ ,trail:°
 " Vim splits

" Navigation (J, K, L, H)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" 80 char width
highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
match OverLength /\%>80v.\+/

" Split opening
set splitbelow
set splitright

" Highlight the search term when you search for it.
set hlsearch

" By default, it looks up man pages for the word under the cursor, which isn't
" very useful, so we map it to something else.
nnoremap <s-k> <CR>

" Explicitly set the Leader to comma. You can use '\' (the default),
" or anything else (some people like ';').
let mapleader=','

" Wrap autocmds inside an augroup to protect against reloading this script.
" For more details, see:
" http://learnvimscriptthehardway.stevelosh.com/chapters/14.html
augroup autoformat
  autocmd!
  " Autoformat BUILD files on write.
  autocmd FileType bzl AutoFormatBuffer buildifier
  " Autoformat go files on write.
  autocmd FileType go AutoFormatBuffer gofmt
  " Autoformat proto files on write.
  autocmd FileType proto AutoFormatBuffer clang-format
  " Autoformat c and c++ files on write.
  autocmd FileType c,cpp AutoFormatBuffer clang-format
  autocmd FileType py AutoFormatBuffer clang-format
augroup END

" Keymapping for moving lines up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Remove keymapping for arrow keys for trial by fire.
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Slimux
map <Leader>s :SlimuxREPLSendLine<CR>
vmap <Leader>s :SlimuxREPLSendSelection<CR>
map <Leader>a :SlimuxShellLast<CR>
map <Leader>k :SlimuxSendKeysLast<CR>

let g:slimux_select_from_current_window = 1
" Make Ctrl-P tractable
set grepprg=ag\ --nogroup\ --nocolor
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden --ignore .git --ignore .svn --ignore .hg --ignore .DS_Store --ignore "**/*.pyc" --ignore out --ignore out_chromeos --ignore out_crgoma --ignore out_crosgoma --ignore .git5_specs --ignore review -g ""'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_by_filename = 1
let g:ctrlp_lazy_update = 250
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 0


" Vim Airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>; :bnext<CR>

" Move to the previous buffer
nmap <leader>l :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bs :ls<CR>
