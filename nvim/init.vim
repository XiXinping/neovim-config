set encoding=utf-8
set number relativenumber
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
set termguicolors
set clipboard+=unnamedplus

call plug#begin('~/.local/share/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
"Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'ghifarit53/tokyonight-vim'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'sbdchd/neoformat'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'famiu/bufdelete.nvim'
Plug 'stevearc/vim-arduino'
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
Plug 'sainnhe/gruvbox-material'
Plug 'rust-lang/rust.vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'liuchengxu/vista.vim'
Plug 'Shougo/context_filetype.vim'
Plug 'evanleck/vim-svelte'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

lua require('plugins')
lua require('code_runner').setup({
      \  filetype = {
      \    java = {
      \      "cd $dir &&",
      \      "javac $fileName &&",
      \      "java $fileNameWithoutExt"
      \    },
      \    python = "python3 $fileName",
      \    typescript = "deno run",
      \    rust = {
      \      "cd $dir &&",
      \      "cargo run --quiet",
      \    },
      \    nasm = {
      \     "nasm -f elf64 -o $fileNameWithoutExt.o $fileName &&",
      \     "ld $fileNameWithoutExt.o -o $fileNameWithoutExt &&",
      \     "./$fileNameWithoutExt",
      \    }
      \  },
      \})
lua require('bufferline-config')
nnoremap <leader>q <cmd>q<CR>
nnoremap <leader>r <cmd>w<CR> <cmd>RunCode<CR>
nnoremap <leader>m <cmd>make<CR>
nnoremap <leader>s <cmd>w<CR>
nnoremap <C-Q> :q<CR>
inoremap <C-Q> <Esc>:q<CR>
nnoremap <leader>] :bnext<CR>
nnoremap <leader>[ :bprev<CR>
nnoremap <leader>bd <cmd>Bdelete<CR>
nnoremap <leader>br i<C-C><C-C>
nnoremap nt :NERDTreeToggle<CR>
nnoremap nf :NERDTreeFocus<CR>
nnoremap <leader>nf <cmd>NERDTreeFind<CR>
nnoremap <C-A-v> <cmd>ArduinoVerify<CR>
nnoremap <C-A-u> <cmd>ArduinoUpload<CR>
nnoremap <C-A-x> <cmd>ArduinoSerial<CR>
nnoremap <C-A-b> <cmd>ArduinoChooseBoard<CR>
nnoremap <C-A-p> <cmd>ArduinoChooseProgrammer<CR>
nnoremap <leader>ga <cmd>Git add<CR>
nnoremap <leader>gc <cmd>Git commit<CR>
nnoremap <leader>gf <cmd>Git fetch<CR>
nnoremap <leader>ad <cmd>ALEGoToDefinition<CR>
nnoremap <leader>ai <cmd>ALEGoToImplementation<CR>
nnoremap <leader>at <cmd>ALEGoToTypeDefinition<CR>
nnoremap <leader>ff <cmd>Telescope find_files<CR>

noremap j h
noremap k j
noremap l k
noremap ; l

"Colorschemes"
let g:tokyonight_style = "night"
let g:gruvbox_material_background = "hard"
let g:onedark_color_overrides = {
\ "background": {"gui": "#1e2127", "cterm": "235", "cterm16": "0" }
\ }"
colorscheme gruvbox-material
"colorscheme tokyonight

let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='gruvbox_material'

let g:neomake_python_enabled_makers = ['flake8']
call neomake#configure#automake('nrwi', 500)

let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1

let g:python_highlight_all = 1

"ALE config"
let g:ale_linters = {
\ 'python': ['flake8'],
\ 'c': ['cc'],
\ 'js': ['eslint']
\}
let g:ale_fixers = {
\ '*': [],
\ 'python': ['black'],
\ 'c': ['clang-format'],
\ 'html': ['prettier'],
\ 'css': ['prettier'],
\ 'javascript': ['prettier']
\}
let g:ale_fix_on_save = 1
let g:ale_rust_rls_toolchain = 'stable'
let g:ale_linters.rust = ['cargo', 'rls', 'clippy']
let g:ale_fixers.rust = ['rustfmt']
let g:ale_linters.js = ['eslint']
let g:ale_python_black_options = "--line-length 79"

"NERDTree config"
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


"vim-rustfmt config"
let g:rustfmt_on_save = 1

"vim-svelte config"
let g:svelte_preprocessors = ['typescript']
if !exists('g:context_filetype#same_filetypes')
  let g:context_filetype#filetypes = {}
endif

let g:context_filetype#filetypes.svelte =
\ [
\   {'filetype' : 'javascript', 'start' : '<script>', 'end' : '</script>'},
\   {
\     'filetype': 'typescript',
\     'start': '<script\%( [^>]*\)\? \%(ts\|lang="\%(ts\|typescript\)"\)\%( [^>]*\)\?>',
\     'end': '',
\   },
\   {'filetype' : 'css', 'start' : '<style \?.*>', 'end' : '</style>'},
\ ]

let g:ft = ''

"NERDCommenter config"
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCustomDelimiters = { 'html': { 'left': '' } }

" Align comment delimiters to the left instead of following code indentation
let g:NERDDefaultAlign = 'left'

fu! NERDCommenter_before()
  if (&ft == 'html') || (&ft == 'svelte')
    let g:ft = &ft
    let cfts = context_filetype#get_filetypes()
    if len(cfts) > 0
      if cfts[0] == 'svelte'
        let cft = 'html'
      elseif cfts[0] == 'scss'
        let cft = 'css'
      else
        let cft = cfts[0]
      endif
      exe 'setf ' . cft
    endif
  endif
endfu

fu! NERDCommenter_after()
  if (g:ft == 'html') || (g:ft == 'svelte')
    exec 'setf ' . g:ft
    let g:ft = ''
  endif
endfu

autocmd FileType rust set cc=100
autocmd BufNew,BufRead *.asm set ft=nasm
let g:ale_nasm_nasm_options = '-f elf64'
