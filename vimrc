""====================
"  Defining: <leader>
let mapleader = "," 
let maplocalleader = "," 
"====================
"Habit breaking, habit making
"this disables the arrowkeys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
"====================
"Saving !
map <Esc><Esc> :w<CR> :echom '...file saved'<CR>
nmap <c-s> :w<CR> 
vmap <c-s> <Esc><c-s>gv 
imap <c-s> <Esc><c-s> 
"setlocal spell
" activate spell-checking alternatives
nmap .s :set invspell spelllang=en<cr>

set clipboard=unnamed
set backspace=2 " make backspace work like most other apps
set encoding=utf-8
set nu
if exists('+relativenumber')
    set relativenumber
endif
colorscheme slate

set cursorline 
" toggle cursor line
nnoremap <leader>i :set cursorline!<cr>

set tw=80

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
"set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
hi NonText ctermfg=7 guifg=gray


" toggle paste mode
map <leader>v :set paste!<cr>

" edit ~/.vimrc
"map <leader>ev :e! ~/.vimrc<cr>
map <leader>ev :e! ~/dotfiles/vimrc<cr>

" edit ~/.tmux.config
"map <leader>et :e! ~/.tmux.config<cr>
map <leader>et :e! ~/dotfiles/tmux.config<cr>

" edit ~/.zshrc
"map <leader>ez :e! ~/.zshrc<cr>
map <leader>ez :e! ~/dotfiles/zshrc<cr>


" Send more characters for redraws
 set ttyfast
" Enable mouse use in all modes
 set mouse=a
" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
 set ttymouse=xterm2

"--------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" My Plugins
Plugin 'L9'
Plugin 'pthrasher/conqueterm-vim'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'Raimondi/delimitMate'
Bundle 'xolox/vim-colorscheme-switcher'
Bundle 'xolox/vim-misc'
Bundle 'altercation/vim-colors-solarized'
Plugin 'mileszs/ack.vim'
Plugin 'matchit.zip'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bling/vim-airline'
Plugin 'easymotion/vim-easymotion'
Plugin 'kien/ctrlp.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'chriskempson/base16-vim'
Bundle 'edkolev/tmuxline.vim'
Bundle 'vim-scripts/fortran.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
"Plugin 'rbonvall/snipmate-snippets-fortran95'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'gi1242/vim-tex-autoclose'
" Future Plugins
"speeddating.vim
"abolish.vim
"commentary.vim
"vim-easyclip
Plugin 'vim-scripts/AutoAlign' 
Plugin 'vim-scripts/Align' 
Plugin 'vim-scripts/Gundo' 
Plugin 'junegunn/vim-easy-align'
Plugin 'tpope/vim-fugitive'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Bundle 'edkolev/promptline.vim'
Bundle 'tpope/vim-speeddating'
Bundle 'vim-scripts/timestamp.vim'
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
"



"----  NEERDTree configs ----
"
let g:NERDTreeDirArrows=0
autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" """"""""" Syntastic config """""""""
" toggle syntastic
 nmap <leader>s :SyntasticToggleMode<cr>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"let g:syntastic_debug = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"FORTRAN
"let g:syntastic_fortran_compiler = 'gfortran'
let g:syntastic_fortran_compiler = 'ifort'
let g:syntastic_fortran_remove_include_errors = 0
"let g:syntastic_fortran_compiler_options=
"let g:syntastic_fortran_include_dirs = ['../Release']
let g:syntastic_fortran_config_file = '.my_custom_include_file_for_syntastic'
" C++
"let g:syntastic_cpp_compiler = 'icpc'
let g:syntastic_cpp_compiler = 'gcc'
let g:syntastic_cpp_remove_include_errors = 0
let g:syntastic_cpp_config_file = '.my_custom_include_file_for_syntastic'

"PYTHON
let g:syntastic_python_checkers = ['flake8']
"LATEX
 
"------latex --------
"let g:syntastic_tex_checkers = ['chktex']
let g:syntastic_tex_checkers = ['']
let g:LatexBox_quickfix = 3
let g:LatexBox_show_warnings = 0
let g:LatexBox_latexmk_options = "-pdflatex='pdflatex -synctex=1 \%O \%S'"
let g:LatexBox_latexmk_async = 0
"let g:LatexBox_viewer = 'mupdf-x11'
let g:LatexBox_viewer = '/Applications/Skim.app/Contents/MacOS/Skim'
"let g:Tex_DefaultTargetFormat = 'pdf'
"let g:Tex_CompileRule_pdf = 'latexmk -bibtex -r latexmrc ipmc $*'
"this Maps does not work
"map <leader>r :w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline <C-r>=line('.')<CR> %<CR>
"map <leader>r :w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline %<C-r>=line('.')<CR> %<CR>
let g:LatexBox_Folding = 0

imap <buffer> [[     \begin{

imap <buffer> ]]     <Plug>LatexCloseCurEnv

imap <buffer> [[     \begin{
imap <buffer> ]]     <Plug>LatexCloseCurEnv
"nmap <buffer> <F5>   <Plug>LatexChangeEnv " I'm using F5 for GUNDO 
"vmap <buffer> <F7>   <Plug>LatexWrapSelection
"vmap <buffer> <S-F7> <Plug>LatexEnvWrapSelection
imap <buffer> ((     \eqref{

"How to type this ?
"map  <silent> <buffer> ¶ :call LatexBox_JumpToNextBraces(0)<CR>
"map  <silent> <buffer> § :call LatexBox_JumpToNextBraces(1)<CR>
"imap <silent> <buffer> ¶ <C-R>=LatexBox_JumpToNextBraces(0)<CR>
"imap <silent> <buffer> § <C-R>=LatexBox_JumpToNextBraces(1)<CR>



"-----Fortran.vim -----
let fortran_free_source = 1
let fortran_have_tabs = 1
let fortran_fold_conditionals=1
""""""  CTAGS """"""""
let g:tagbar_ctags_bin='/Users/efrain/Programs/ctags/bin/ctags'  " Proper Ctags locations
let g:tagbar_width=35                          " Default is 40, seems too wide
"noremap <silent> <Leader>y :TagbarToggle       " Display panel with y (or ,y)
noremap <silent> <Leader>b :TagbarToggle<CR>       " Display panel with b (or ,b)

"-----Color Solarized -----
syntax enable
"if has('gui_running')
""       	set background=light
""    else
""	 set background=dark
"endif
"set background=dark
"set background=light
"let g:solarized_termtrans = 1
"let g:solarized_termcolors=256
"let g:solarized_termcolors=16
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
"colorscheme solarized
"

" ---PowerLine ----- DEPRECATED !!
"set guifont=Ubuntu\ Mono\ derivative\ Powerline
let g:Powerline_symbols = 'fancy'
"set fillchars+=stl:\ ,stlnc:\   
set encoding=utf-8
set t_Co=256
"set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

" --- CtrlP ----
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.mod,*.o 
"----indent-guides----

set ts=4 sw=4 et
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 2

"----- Air-line-----
" airline options
"let g:airline_section_b = '%{getcwd()}'
"let g:airline_section_c = '%t'
"set laststatus=2
let g:airline_powerline_fonts=1
"let g:airline_left_sep=''
"let g:airline_right_sep=''
"let g:airline_theme='base16'
"let g:airline#extensions#tabline#enabled = 1

"--- 
" toggle Limelight
nmap <leader>f :Limelight!!<cr>
"nmap <leader>f :Limelight!<cr>
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
"----- GOYO--------
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" writing style
"nmap <leader>w :setf textile<cr> :Goyo<cr>
nmap <leader>w :Goyo<cr>

""---- base 16 color----
"set background=dark
"colorscheme base16-default
"let base16colorspace=256

" ---Tmux Line------
" custom preset with shell commands
"let g:tmuxline_preset = {
      "\'a'    : '#S',
      "\'c'    : ['#(whoami)', '#(uptime  | cut -d " " -f 1,2,3)'],
      "\'win'  : ['#I', '#W'],
      "\'cwin' : ['#I', '#W', '#F'],
      "\'x'    : '#(date)',
      "\'y'    : ['%R', '%a', '%Y'],
      "\'z'    : '#H'}

 let g:tmuxline_preset = {
      \'a'    : '#S',
      \'c'    : ['#(whoami)'],
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'y'    : ['%R', '%a', '%Y'],
      \'z'    : '#H'}    
"" configure which stock theme should be used by |:Tmuxline| >
"let g:tmuxline_preset = 'nightly_fox'

"" fine-tune the separators >
let g:tmuxline_powerline_separators = 0
let g:tmuxline_separators = {
      \ 'left' : '',
      \ 'left_alt': '|',
      \ 'right' : '',
      \ 'right_alt' : '/',
      \ 'space' : ' '}

"--- GUNDO ----
nnoremap <F5> :GundoToggle<CR>
"let g:gundo_width          = 60
"let g:gundo_preview_height = 40
let g:gundo_right          = 1


"-----easymotion--------


"----Easy Align ----
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


">>>>>>>>> MY MAPINGS <<<<<<<<<<<
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
inoremap <leader>j <Esc>:m .+1<CR>==gi
inoremap <leader>k <Esc>:m .-2<CR>==gi
vnoremap <leader>j :m '>+1<CR>gv=gv
vnoremap <leader>k :m '<-2<CR>gv=gv

"--Markdown to HTML
nmap <leader>md :%!/usr/local/bin/markdown --html4tags <cr>

"---Vim Markdown -------
"
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_no_default_key_mappings=1
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1

"---- promptline -----
"https://github.com/edkolev/promptline.vim
"let g:promptline_preset
"let g:promptline_preset = {
      "\'a'    : [ '\h' ],
      "\'b'    : [ '\u' ],
      "\'c'    : [ '\W' ]}
"let g:promptline_preset = {
      "\'a'    : [ '%m' ],
      "\'b'    : [ '%n' ],
      "\'c'    : [ '%d' ]}
let g:promptline_preset = {
        \'a'    : [ promptline#slices#user() ],
        \'b'    : [ promptline#slices#cwd({'dir_lim':2}) ],
        \'c'    : [ promptline#slices#vcs_branch(), promptline#slices#git_status() ],
        \'warn' : [ promptline#slices#last_exit_code() ],
        \'z'    : [ '%T' ]}
        "\'warn' : [ promptline#slices#last_exit_code(), promptline#slices#battery() ],
        "\'z'    : [ promptline#slices#host({'only_if_ssh':1})]}
        "\'z'    : [ promptline#slices#host()]}
        "\'z'    : [ '$(hostname)']}
