syntax on
filetype plugin indent on

set guifont=Consolas:h11
set directory=~/.vim/swapfiles//

set number
set ruler
set wrap
set tabstop=4
set softtabstop=4 
set shiftwidth=4
set laststatus=2
set expandtab
set ignorecase
set smartcase
set hlsearch
set cursorline
set autoindent
set smartindent
set scrolloff=5
set guioptions-=m "remove menu bar
set guioptions-=T "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set splitbelow 
set splitright
set relativenumber
set timeoutlen=100

inoremap fd <Esc>
inoremap df <Esc>
vnoremap fd <Esc>
vnoremap df <Esc>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> gj j
nnoremap <silent> gk k
"execute commands without shift
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
nnoremap ZZ <Nop>
noremap <silent> <C-s> :nohl<CR><C-l>
noremap <C-q> :set invrelativenumber<CR>
nmap <F9> :set ignorecase! ignorecase?
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
nnoremap <Leader>r :ALEDisable<CR>:ALEEnable<CR>
vmap <Leader>c "+y<cr>
nmap <Leader>v "+p<cr>
vnoremap . :normal<Space>
nnoremap Y y$
inoremap <C-v> <C-r>+
nnoremap <C-c> <Nop>
nmap <silent> <C-m> <Plug>MarkologyToggle
" select last paste in visual mode
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

let g:syntastic_cs_checkers = ['syntastic-checkers-cs']

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | normal l | endif

" au GUIEnter * simalt ~x

augroup omnisharp_commands
    autocmd!

    " When Syntastic is available but not ALE, automatic syntax check on events
    " (TextChanged requires Vim 7.4)
    " autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>


    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <Leader>k :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>j :OmniSharpNavigateDown<CR>
augroup END

nnoremap <C-p> :CtrlP<CR>
let g:ale_linters = {
            \ 'cs': ['OmniSharp']
            \}

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

let g:OmniSharp_selector_ui = 'ctrlp'  " Use ctrlp.vim
let g:OmniSharp_timeout = 5

" inoremap <expr> <Tab> pumvisible() ? \"\<C-n>" : \"\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? \"\<C-p>" : \"\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? \"\<C-y>" : \"\<cr>"
