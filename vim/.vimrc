syntax on
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
execute pathogen#infect()
let g:airline_powerline_fonts = 1
set background=dark
colorscheme monokai
let g:airline_theme="luna"
set number
let mapleader=","
map <C-n> :NERDTreeToggle<CR>
set cursorline cursorcolumn " Highlight current line and column
set backupdir=~/.vim/backup
if exists("&undodir")
    set undodir=~/.vim/undo
endif
set noerrorbells
set ttyfast   " Optimize for fast terminal connections
" history settings {{{
set history=1000
set undolevels=1000
" }}}
set colorcolumn=80
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

" buffer diffs indication {{{
" Convenient command to see the difference between the current buffer and
" the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif
""" }}}

" search settings {{{
set hlsearch   " Highlight searches
noremap <silent><Leader>/ :nohls<CR> "remove highlight with ,/
set incsearch  " Highlight dynamically as pattern is typed
set showmatch
set ignorecase   " Ignore case of searches
set smartcase
set matchtime=5
map N Nzz
map n nzz
" }}}

" Highlight trailing whitespace in vim on non empty lines, but not while {{{
" typing in insert mode!
highlight ExtraWhitespace ctermbg=red guibg=brown
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\S\zs\s\+$/
au InsertEnter * match ExtraWhitespace /\S\zs\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\S\zs\s\+$/
" }}}

" restore cursor position to where it was before {{{
augroup JumpCursorOnEdit
    au!
    autocmd BufReadPost *
                \ if expand("<afile>:p:h") !=? $TEMP |
                \   if line("'\"") > 1 && line("'\"") <= line("$") |
                \     let JumpCursorOnEdit_foo = line("'\"") |
                \     let b:doopenfold = 1 |
                \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
                \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
                \        let b:doopenfold = 2 |
                \     endif |
                \     exe JumpCursorOnEdit_foo |
                \   endif |
                \ endif
    " Need to postpone using "zv" until after reading the modelines.
    autocmd BufWinEnter *
                \ if exists("b:doopenfold") |
                \   exe "normal zv" |
                \   if(b:doopenfold > 1) |
                \       exe  "+".1 |
                \   endif |
                \   unlet b:doopenfold |
                \ endif
augroup END
" }}}

" save a file as root (,W) {{{
noremap <leader>W :w !sudo tee % > /dev/null<CR>
" }}}

" syntastic configuration {{{
let g:syntastic_check_on_open=1   "syntax checks when buffers are first loaded
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_auto_jump=1   "cursor jump to the first detected error
" }}}

