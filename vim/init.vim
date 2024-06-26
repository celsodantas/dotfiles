" vim: set sw=2 ft=vim ts=2 sts=2 et:

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " Gbrowse
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'benmills/vimux' " allows vim to open a tmux panel and run commands on it (useful for tests)

Plug 'easymotion/vim-easymotion'

Plug 'jlanzarotta/bufexplorer' " buffer explorer (giving this a try)

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
map <leader>t :NERDTreeToggle<CR>
map <leader>T :NERDTreeFind<CR>

" UI
Plug 'drewtempelmeyer/palenight.vim'
Plug 'itchyny/lightline.vim'

Plug 'bogado/file-line' " allows opening a file and jumping to a line with format:  filename:89

Plug 'ervandew/supertab'

call plug#end()

"
" PERSONAL Vim configs
"
let g:VimuxHeight = "40"
let g:VimuxOrientation = "h"

let mapleader = ','

" Toggle paste
set pastetoggle=<F2>

set colorcolumn=120             " adds a line at the column to mark max line
set encoding=utf-8

set autoread | au CursorHold * checktime " auto reloads the file when changed

autocmd StdinReadPre * let s:std_in=1

syntax enable
set tabstop=2

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set iskeyword-=.                " '.' is an end of word designator
set iskeyword-=#                " '#' is an end of word designator
set iskeyword+=_
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
		  \,sm:block-blinkwait175-blinkoff150-blinkon175

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Go to last buffer that exists. Just like spacemacs
noremap <Space><Tab> :b#<CR>

" default to tree
let g:netrw_liststyle=3

" disabling record mode - I never use this shit anyway
map q <Nop>

" ================ Search Settings  =================

set incsearch        "Find the next match as we type the search
set hlsearch         "Hilight searches by default
set viminfo='100,f1  "Save up to 100 marks, enable capital marks

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb
set nowritebackup

" Store temporary files in a central spot
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp


" =============== COPY Support ======================
" Allow yank to copy to Mac's clipboard

" commeting out as this doesnt seems to be working
" vmap '' :w ! pbcopy<CR><CR>

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim-tmp/backups > /dev/null 2>&1
set undodir=~/.vim-tmp/backups
set undofile

" === file browser configs
" Do not set netrw as the alternate buffer (#b)! Used also by vim vinegar.
let g:netrw_altfile = 1

" === VimuxConfig ====

let g:VimuxOrientation = "h"
let g:VimuxHeight = "40"

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" Disable new commented line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
filetype plugin indent on

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.rbi

"""""""""""""""""""""""""""""""
" => AUTOCOMPLETION
"""""""""""""""""""""""""""""""
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" =========== NERDTree ===============================

" " sync open file with NERDTree
" " " Check if NERDTree is open or active
" function! IsNERDTreeOpen()
"   return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
" endfunction

" " Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" " file, and we're not in vimdiff
" function! SyncTree()
"   if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
"     NERDTreeFind
"     wincmd p
"   endif
" endfunction

" " Highlight currently open buffer in NERDTree
" autocmd BufEnter * call SyncTree()

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margin
set sidescrolloff=15
set sidescroll=1

" ================ Split ============================
" Open new split panes to right and bottom, which feels more natural than Vim’s default:
set splitbelow
set splitright

" ================  Mouse  ==========================

" mouse support
set mouse=a

"set ttymouse=xterm2 " allows click and drag of mouse inside tmux  -- disabling bc of neovim

" ================ Copy Clipboard ===================

set clipboard=unnamed

" ================ Colors  ==========================

set cursorline

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
let g:palenight_terminal_italics=1
let g:lightline = {
      \ 'colorscheme': 'palenight',
      \'component_function': {
        \'filename': 'LightlineFilename',
      \}
   \}
colorscheme palenight
highlight Comment cterm=italic

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

" =============== Make Vim faster ==================
" Make vim fast.
set synmaxcol=300
set ttyfast
"set ttyscroll=3 -- disabling bc of neovim
" set lazyredraw  -- tmp disable as it was cuasing the cursor to be slow as fuck

" ================ Loading Externals ================

" Fuzzyfinder  https://github.com/junegunn/fzf
set rtp+=~/.fzf

" The Silver Searcher
if executable('rg')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " let g:ctrlp_user_command = 'rg --files --smart-case %s'

  " " ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0

  " set grepprg=rg\ --vimgrep\ --no-heading
  " set grepformat=%f:%l:%c:%m,%f:%l:%m

  nmap <Leader>\ :Rg
endif

" setting ctags path
set tags=tags

let g:easytags_async = 1

"""""""""
" Cursor
""""""""""

if !has('nvim')
	if exists('$TMUX')
		let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
		let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
	else
		let &t_SI = "\<Esc>]50;CursorShape=1\x7"
		let &t_EI = "\<Esc>]50;CursorShape=0\x7"
	endif
endif

"""""""""""
" Keymaps
"""""""""""

" disabling Ex mode. Bc this shit is useless
map q: <Nop>
nnoremap Q <nop>

" allow pressing ctrl+w n to go into Normal mode when in the vim terminal
tnoremap <C-W>n <C-\><C-n>

" nmap <c-t> :NERDTreeToggle<CR>

" this along side enabling iTerm to send +c (Esc+ c) allows mac's cmd+c to copy things
" see https://github.com/neovim/neovim/issues/5052#issuecomment-232083842
vnoremap <M-c> "+y

nnoremap <leader>hh :noh<CR>

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" allows to zoom current buffer (occupy all screen
" use ctrl+w = to revert expansion
noremap Zz <c-w>_ \| <c-w>\|

"map to bufexplorer
nnoremap <leader>b :Buffers<cr>

let g:bufExplorerDisableDefaultKeyMapping = 1
let g:bufExplorerShowNoName = 1
nnoremap <leader>l :ToggleBufExplorer<cr>

nnoremap <leader>p :Files<Cr>

" move to beginning/end of line
nnoremap B ^
nnoremap E $
map 0 ^

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TAB MAPPING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
nnoremap tn :tabnew<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

"""""""""""""""""""""

" move vertically by visual line
" These two allow us to move around lines visually. So if there's a very long line that gets visually wrapped to two lines, j won't skip over the "fake" part of the visual line in favor of the next "real" line.
nnoremap j gj
nnoremap k gk

vmap > >gv
vmap < <gv
vmap <Tab> >gv
vmap <S-Tab> <gv

" triggers the find with the word unde the cursor
nnoremap <Leader>f :/\<<C-r><C-w>\>/

nnoremap <leader>s :call SearchProject()<CR>
vnoremap <leader>s :call SearchProjectVisual()<CR>

nnoremap <leader>r :call FileSearchAndReplace()<CR>

function! Escape(toescape)
    return escape(a:toescape, '\\/.*$^~[]<>{}')
endfunction


" copy current file path
nnoremap <Leader>cf :let @+ = expand("%")<CR>

" Add text to the command line.
" Don't ask me why it's like this, it's just is.
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" Returns the word under cursor.
function! GetWordUnderCursor()
    let isOnKeyword = matchstr(getline('.'), '\%'.col('.').'c.') =~# '\k'
    if isOnKeyword
        return expand("<cword>")
    else
        return ""
    endif
endfunction


" Use Rg with word under cursor
function! SearchProject()
    call CmdLine("Rg " . GetWordUnderCursor())
endfunction

function! Escape(toescape)
    return escape(a:toescape, '\\/.*$^~[]<>{}')
endfunction

" Search the project for the visual selection
function! SearchProjectVisual()
    call CmdLine("Rg " . Escape(VisualSelection()))
endfunction

" Wrapper over rg_to_qf
function! RgToQF(query)
  call setqflist(map(systemlist('rg --column '.a:query), 's:rg_to_qf(v:val)'))
endfunction

" Search and replace the word under cursor in the current buffer
function! FileSearchAndReplace()
    call inputsave()
    let wordToReplace = input("Replace: ", GetWordUnderCursor())
    let replacement = input("Replace \"" . wordToReplace . "\" with: ")
    execute ":%s/" . wordToReplace . "/" . replacement . "/gc"
    call inputrestore()
endfunction

" Returns the visual selection
function! VisualSelection()
    try
        let a_save = @a
        silent normal! gv"ay
        return @a
    finally
        let @a = a_save
    endtry
endfunction

"""""""""""""""""""""""""""
" => EasyMotion
"""""""""""""""""""""""""""
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

map <Leader>; <Plug>(easymotion-overwin-f2)

"""""""""""""""""""""""""""""""
" => FUGITIVE
"""""""""""""""""""""""""""""""
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
nnoremap <silent> <leader>gi :Git add -p %<CR>
" Auto clean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
" Navigate to the current git object
autocmd FileType git nnoremap <buffer> <leader>gb :Gbrowse<cr>
" Navigate to current commit hash under the cursor inside the blame window
autocmd FileType fugitiveblame nnoremap <buffer> <leader>gb :execute ":Gbrowse " . expand("<cword>")<cr>

" FZF config
let $FZF_DEFAULT_COMMAND = 'rg --ignore-case --files'
let $FZF_DEFAULT_OPTS = "
      \ --color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C
      \ --color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B
      \ -i --preview 'bat -n --color=always {}'"

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --ignore-case --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Global line completion (not just open buffers. ripgrep required.)
inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
  \ 'prefix': '^.*$',
  \ 'source': 'rg -n ^ --color always',
  \ 'options': '--ansi --delimiter : --nth 3..',
  \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

" :FormatJSON command is available to format pretty format JSON content
com! FormatJSON %!python -m json.tool
