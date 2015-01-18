" Plugin autoloader
execute pathogen#infect()
execute pathogen#helptags()

filetype plugin indent on

" CtrlP for filetype
let g:ctrlp_extensions = ['filetype']
silent! nnoremap <unique> <silent> <Leader>f :CtrlPFiletype<CR>

" Autoload powerline font
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
"let g:airline_symbols.space = "\ua0"

" indentLine settings
let g:indentLine_char = '┆'
let g:indentLine_color_term = 239

" set max files for ctrlp.vim to read
let g:ctrlp_max_files = 20000

" set airline theme
let g:airline_theme = "tomorrow"

" pymode settings
let g:pymode_python = "python3"
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'pep257', 'mccabe']
let g:pymode_lint_cwindow = 1
let g:pymode_lint_ignore = "E501,W601"
" disable pymode holding
let g:pymode_folding = 0
" enable rope script
let g:pymode_rope = 1

" disable syntastic for python
let g:syntastic_ignore_files = ['\.py$']

" enable php refactoring plugin
let g:php_refactor_command = 'php ~/.vim/assets/php-refactor.phar'

set t_Co=256                      " set 256 color mode
colorscheme monokai               " set color scheme
syntax on                         " enable syntax highlighting
set number                        " show line numbers
set list                          " show invisible characters
set listchars=tab:\|\ ,trail:·    " but only show tabs and trailing whitespace
set shortmess=atI                 " shorten messages and don't show intro
set wrap                          " soft wrap long lines
set ruler                         " show current position at bottom
set mouse=a                       " try to use a mouse in the console
set textwidth=120                 " we like 120 columns
set showmatch                     " show matching brackets
set formatoptions=tcrql           " t - autowrap to textwidth
                                  " c - autowrap comments to textwidth
                                  " r - autoinsert comment leader with <Enter>
                                  " q - allow formatting of comments with :gq
                                  " l - don't format already long lines
set autoindent                    " set the cursor at same indent as line above
set smartindent                   " try to be smart about indenting (C-style)
set expandtab                     " expand <Tab>s with spaces; death to tabs!
set shiftwidth=4                  " spaces for each step of (auto)indent
set softtabstop=4                 " set virtual tab stop (compat for 8-wide tabs)
set tabstop=8                     " for proper display of files with tabs
set shiftround                    " always round indents to multiple of shiftwidth
set copyindent                    " use existing indents for new indents
set preserveindent                " save as much indent structure as possible
set timeoutlen=2000               " extend timeout length

if has("gui_running")
" GUI is running or is about to start.
" Maximize GVim window.
    set lines=66 columns=235
" remove the menu bar
    set guioptions-=m
" and remove the toolbar
    set guioptions-=T
" and enable the horizontal scrollbar
"set guioptions+=b
" and remove the vertical scrollbar
    set guioptions-=r
" no left scrollbar
    set guioptions-=L
" use console style dialogs
    set guioptions+=c
" but always show the tabline (window otherwise resizes when first showing tabline)
    set showtabline=2
" set guifont
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
endif

" get rid of vim swap files by putting them in .vim
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
