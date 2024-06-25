syntax enable

if !has('gui_running')
    set t_Co=256
endif

filetype plugin indent on

set listchars=space:·,tab:→_,trail:·
set list

set t_u7=
"set ambw=double
set nowrap
set encoding=UTF-8
set mouse=a
set updatetime=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tab options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set expandtab
" set shiftwidth=8
set tabstop=8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the numbering
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set relativenumber

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" miscellaneous
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
set signcolumn=yes
set termguicolors
set colorcolumn=80,120
set backspace=indent,eol,start
set cursorline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" search options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch
set hlsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" status/tab line options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set showtabline=2
set noshowmode

setlocal conceallevel=2
set concealcursor=nciv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocomplete settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt=menuone,noinsert,noselect,preview
set pumheight=5

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <C-A>     :TagbarToggle   <CR>
nnoremap <silent> <CR>      :nohlsearch     <CR><CR>
nnoremap <silent> <leader>f :NERDTreeToggle <CR>
nnoremap <silent> <C-]>     :Lexplore!      <CR>

nnoremap <silent> gd :call CocAction('jumpDefinition')     <CR>
nnoremap <silent> gD :CocDiagnostics                       <CR>
nnoremap <silent> ge :call CocAction('diagnosticList')     <CR>
nnoremap <silent> gf :FZF                                  <CR>
nnoremap <silent> gF :FormatCode                           <CR>
nnoremap <silent> gh :call CocAction('doHover')            <CR>
nnoremap <silent> gi :CocCommand document.toggleInlayHint  <CR>
nnoremap <silent> gn :call CocAction('diagnosticNext')     <CR>
nnoremap <silent> gp :call CocAction('diagnosticPrevious') <CR>
nnoremap <silent> gr :call CocAction('jumpReferences')     <CR>
nnoremap <silent> gs :CocList -I symbols                   <CR>
nnoremap <F2>     :CocCommand document.renameCurrentWord   <CR>

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr><Tab>   coc#pum#visible() ? coc#pum#next(1) :       "\<Tab>"
inoremap <silent><expr><S-Tab> coc#pum#visible() ? coc#pum#prev(1) :       "\<C-h>"
inoremap <silent><expr><CR>    coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set the <leader> key
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\\"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" netrw options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_preview = 1
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 15

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-cpp-enhanced-highlight options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_hightlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rainbow-parentheses options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow#max_level = 32
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctags options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctags_statusline = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" minimap options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:minimap_width = 15
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline#bufferline#show_number = 1
let g:ligthline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed = '[No Name]'

let g:lightline = {
            \ 'colorscheme': 'everforest',
            \ 'active': {
            \     'left': [
            \         ['mode', 'paste'],
            \         ['gitbranch', 'readonly', 'filename', 'modified']
            \     ],
            \     'right': [
            \         ['linter_errors', 'linter_warnings', 'linter_ok'],
            \         ['lineinfo'],
            \         ['current_function', 'fileformat', 'fileencoding', 'filetype', 'percent']
            \     ]
            \ },
            \ 'tabline': {
            \     'left': [ ['buffers'] ],
            \     'right': [ ]
            \ },
            \ 'component': {
            \     'lineinfo': ' %3l:%-2v',
            \ },
            \ 'component_expand': {
            \     'buffers': 'lightline#bufferline#buffers',
            \     'linter_checking': 'lightline#coc#checking',
            \     'linter_infos': 'lightline#coc#infos',
            \     'linter_warnings': 'lightline#coc#warnings',
            \     'linter_errors': 'lightline#coc#errors',
            \     'linter_ok': 'lightline#coc#ok',
            \ },
            \ 'component_type': {
            \     'buffers': 'tabsel',
            \     'linter_checking': 'right',
            \     'linter_infos': 'right',
            \     'linter_warnings': 'warning',
            \     'linter_errors': 'error',
            \     'linter_ok': 'right',
            \ },
            \ 'component_function': {
            \     'gitbranch': 'FugitiveHead',
            \     'readonly': 'LightlineReadonly',
            \     'fugitive': 'LightlineFugitive',
            \     'current_function': 'TagbarCurrentFunction'
            \ },
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' }
            \ }

let g:lightline#coc#indicator_warnings = "W: "
let g:lightline#coc#indicator_errors = "E: "
let g:lightline#coc#indicator_info = "I: "
let g:lightline#coc#indicator_hints = "H: "
let g:lightline#coc#indicator_ok = "✓"

function! LightlineReadonly()
    return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
    if exists('*fugitive#head')
        let branch = fugitive#head()
        return branch !=# '' ? ''.branch : ''
    endif
    return ''
endfunction

function! TagbarCurrentFunction()
    return tagbar#currenttag("%s", "", "f")
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LSP settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_default_semantic_highlight_groups = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" slime options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:slime_target = "tmux"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimtex options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'
let localleader = ','
let g:vimtex_compiler_latexmk = {
      \ 'options' : [
      \   '-shell-escape' ,
      \   '-verbose' ,
      \   '-file-line-error',
      \   '-synctex=1' ,
      \   '-interaction=nonstopmode' ,
      \ ],
      \}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_width = max([20, winwidth(0) / 6])
let g:NERDTreeShowHidden = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'

if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

source ~/.vim/autoload/plug.vim

call plug#begin('~/.vim/plugged')

" Miscellaneous
Plug 'vim-scripts/a.vim', {'for': ['cpp', 'c']}
Plug 'universal-ctags/ctags'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jpalardy/vim-slime', {'for': ['scheme']}
Plug 'tpope/vim-fugitive'
Plug 'lervag/vimtex', {'for': ['tex']}

" Vim layout
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'

" Clang-format
Plug 'google/vim-codefmt'
Plug 'google/vim-maktaba'
Plug 'google/vim-glaive'

" Editing help
Plug 'wfxr/minimap.vim'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'ddollar/nerdcommenter'
Plug 'psliwka/vim-smoothie'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
"Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Colors and themes
Plug 'sainnhe/everforest'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'ap/vim-css-color'
Plug 'shirk/vim-gas', {'for': ['s', 'asm']}
Plug 'habamax/vim-rst', {'for': ['rst']}

" Lightline
Plug 'itchyny/lightline.vim'
Plug 'josa42/vim-lightline-coc'
Plug 'mengelbrecht/lightline-bufferline'

" LSP and autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme everforest

highlight clear Comment
highlight link Comment Ignore

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LLVM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LLVM Makefiles can have names such as Makefile.rules or TEST.nightly.Makefile,
" so it's important to categorize them as such.
augroup filetype
    au! BufRead,BufNewFile *Makefile* set filetype=make
augroup END

" In Makefiles, don't expand tabs to spaces, since we need the actual tabs
autocmd FileType make set noexpandtab

" Useful macros for cleaning up code to conform to LLVM coding guidelines

" Delete trailing whitespace and tabs at the end of each line
command! DeleteTrailingWs :%s/\s\+$//

" Convert all tab characters to two spaces
command! Untab :%s/\t/  /g

" Enable syntax highlighting for LLVM files. To use, copy
" utils/vim/syntax/llvm.vim to ~/.vim/syntax .
augroup filetype
    au! BufRead,BufNewFile *.ll     set filetype=llvm
augroup END

" Enable syntax highlighting for tablegen files. To use, copy
" utils/vim/syntax/tablegen.vim to ~/.vim/syntax .
augroup filetype
    au! BufRead,BufNewFile *.td     set filetype=tablegen
augroup END

" Enable syntax highlighting for reStructuredText files. To use, copy
" rest.vim (http://www.vim.org/scripts/script.php?script_id=973)
" to ~/.vim/syntax .
augroup filetype
    au! BufRead,BufNewFile *.rst     set filetype=rest
augroup END

augroup filetype
    au! BufRead,BufNewFile *.inc     set filetype=c
    au! BufRead,BufNewFile *.def     set filetype=c
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocmd
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd vimenter * RainbowParentheses
autocmd vimenter * filetype detect
autocmd vimenter *.ll set filetype=llvm
autocmd vimenter CMakeLists.txt syntax enable
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

autocmd CursorHold * silent call CocActionAsync('highlight')

autocmd StdinReadPre * let s:std_in=1
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

