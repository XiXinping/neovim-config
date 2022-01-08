set encoding=utf-8
set number number
syntax enable
set scrolloff=8
set backspace=indent,eol,start
set cc=80
set tabstop=4
set softtabstop=4
set shiftwidth=4
set wrap
set linebreak
set expandtab
set autoindent
set fileformat=unix

noremap <leader>q :wq<cr>

call plug#begin('~/.local/share/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'rebelot/kanagawa.nvim'
Plug 'joshdick/onedark.vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'sbdchd/neoformat'
Plug 'davidhalter/jedi-vim'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'famiu/bufdelete.nvim'
call plug#end()

lua require('plugins')
lua require('code_runner').setup({})
lua require('bufferline-config')
nnoremap <C-A-R> :w<CR> :RunCode<CR>
nnoremap <C-S> :w<CR>
inoremap <C-S> <Esc>:w<CR>
nnoremap <C-Q> :q<CR>
inoremap <C-Q> <Esc>:q<CR>
nnoremap <C-]> :BufferLineCycleNext<CR>
nnoremap <C-[> :BufferLineCyclePrev<CR>
nnoremap <leader>bd <cmd>Bdelete<CR>
nnoremap nt :NERDTreeToggle<CR>
nnoremap nf :NERDTreeFocus<CR>
nnoremap <leader>nf <cmd>NERDTreeFind<CR>

noremap j h
noremap k j
noremap l k
noremap ; l

let g:tokyonight_style = "night"
colorscheme tokyonight 

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='onedark'
let g:neomake_python_enabled_makers = ['flake8']
call neomake#configure#automake('nrwi', 500)
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1
let g:jedi#completions_enabled = 0
let g:jedi#use_splits_not_buffers = "right"

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
