call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'chriskempson/base16-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'wellle/targets.vim'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'dense-analysis/ale'
Plug 'elzr/vim-json'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'
call plug#end()

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

let mapleader = " "

nmap <silent> gd <Plug>(coc-definition)

nnoremap <leader>f za
nnoremap <silent> - :NERDTreeToggle<CR>
nnoremap <leader>k gt
nnoremap <leader>j gT
nnoremap <leader>s :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>gs :G<cr>

let g:ale_fix_on_save = 1
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'

let g:NERDTreeMinimalUI = v:true
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeQuitOnOpen = 1

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
syntax on

set termguicolors
set noswapfile
set nu
set relativenumber
set updatetime=300

set softtabstop=4
set shiftwidth=2
set tabstop=4
set expandtab
set smartindent

set foldmethod=indent
set foldlevel=99

set nohlsearch

set ttimeoutlen=5

set clipboard=unnamedplus

set scrolloff=10

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %F

hi StatusLine guibg=none guifg=#ffffff
hi Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000
hi LineNr guibg=none guifg=#ffffff
hi CursorLineNr guibg=none guifg=#ffffff
hi Normal guibg=NONE ctermbg=NONE
hi EndOfBuffer guifg=bg guibg=bg
hi Folded guibg=None
hi SpellBad term=reverse guibg=None
hi AleWarning guibg=None
hi AleErrorSign guibg=None
hi AleWarningSign guibg=None
hi SignColumn guibg=None
