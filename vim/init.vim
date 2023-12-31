:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set expandtab
:set hlsearch
:set autowriteall

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'nvim-tree/nvim-web-devicons' " Developer Icons for Nvim
Plug 'voldikss/vim-floaterm' " Vim Terminal
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/kevinoid/vim-jsonc' " JSON configuration form coc
Plug 'brooth/far.vim' " Find and Replace
Plug 'junegunn/fzf.vim' " Fuzzy File Search
Plug 'junegunn/fzf' " Fuzzy File Search
Plug 'https://github.com/airblade/vim-gitgutter' " Git Gutter
Plug 'dense-analysis/ale' " Linter
Plug 'sheerun/vim-polyglot' " Syntax Highlighting
Plug 'windwp/nvim-autopairs' " Auto Close Brackets + Quotes
Plug 'puremourning/vimspector' " Interactive Debugger
Plug 'Pocco81/auto-save.nvim' " Auto save
Plug 'nvim-telescope/telescope.nvim' " File Searching
Plug 'https://github.com/folke/todo-comments.nvim' " Todo List
Plug 'nvim-lua/plenary.nvim' " Extra Lua Functionality
Plug 'nvim-treesitter/nvim-treesitter' " TreeSitter Plugin for Vim
Plug 'https://github.com/klen/nvim-test' " Test Runner
Plug 'sindrets/diffview.nvim' " Git Diff View
Plug 'Civitasv/cmake-tools.nvim' " CMake Tools

set encoding=UTF-8

call plug#end()

lua << EOF
require("nvim-autopairs").setup {}
require("auto-save").setup {}
require("todo-comments").setup {}
require("nvim-test").setup {}
EOF

" Toggle relative line number
nmap <C-L><C-L> :set invrelativenumber<CR>

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" NerdTree setup

" NerdTree Symbols
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" NerdTree Keyboard Shortcuts
nnoremap <C-y> :NERDTreeToggle<CR>

" Tagbar setup

" Tagbar Options
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1

" Tagbar Symbols
let g:tagbar_iconchars = ["+", "~"]

" Coc.vim Setup

" Go to definition shortcuts
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Coc.vim root patterns
autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json']

" Make <CR> (return key) to accept selected completion item or notify coc.nvim to format
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<TAB>"

" Far.vim setup

" Far.vim Keyboard Shortcuts
nmap <C-f> :Farf<CR>
nmap <C-r> :Farr<CR>

" Far.vim Options
let g:far#highlight_match = 1

" Fzf Setup

" Fzf Keyboard Shortcuts
nmap <C-p> :Telescope find_files<CR>
nnoremap <C-x><C-t> <cmd>TodoTelescope<CR>

" Floaterm Setup

" Floaterm Keyboard Shortcuts
let g:floaterm_keymap_kill = '<F8>'
let g:floaterm_keymap_new    = '<F9>'
let g:floaterm_keymap_prev   = '<F10>'
let g:floaterm_keymap_next   = '<F11>'
let g:floaterm_keymap_toggle = '<F12>'

" Colour Scheme
:colorscheme space-vim-dark 

" Vimspector Setup

" Vimspector Keyboard Shortcuts
nmap <F2> <Plug>VimspectorStepOver  
nmap <F3> <Plug>VimspectorStepInto 
nmap <F4> <Plug>VimspectorStepOut 
nmap <F5> <Plug>VimspectorContinue
nmap <C-F5> <Plug>VimspectorRestart
nmap <F6> <Plug>VimspectorToggleBreakpoint

" Diffview Setup

"Diffview Keyboard Shortcuts
nmap <F7> :DiffviewOpen<CR>
nmap <C-F7> :DiffviewClose<CR>
