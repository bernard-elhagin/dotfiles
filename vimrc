" .vimrc
"
" Author: Bernard El-Hagin <bernard.elhagin@gmail.com>
" http://github.com/bernard-elhagin/configurations
"
set nocompatible

" Initialize ------------------------------------------------------------- [[[
filetype off

set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
set rtp+=$VIM/vimfiles/bundle/powerline/powerline/bindings/vim/
call vundle#begin('$VIM/vimfiles/bundle')

Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'easymotion/vim-easymotion'
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-repeat'
Plugin 'sjl/gundo.vim'
Plugin 'godlygeek/tabular'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/MatchTagAlways'
Plugin 'gregsexton/gitv'
Plugin 'mhinz/vim-startify'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/vim-peekaboo'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'airblade/vim-rooter'
Plugin 'sukima/xmledit'
Plugin 'vim-syntastic/syntastic'
Plugin 'wincent/command-t'
Plugin 'wincent/vcs-jump'
Plugin 'whiteinge/diffconflicts'
Plugin 'unblevable/quick-scope'
Plugin 'vim-scripts/CSApprox'
Plugin 'benmills/vimux'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'xolox/vim-session'
Plugin 'dyng/ctrlsf.vim'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'luochen1990/rainbow'
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'
Plugin 'prettier/vim-prettier'
Plugin 'jreybert/vimagit'

call vundle#end()

filetype plugin indent on

if filereadable('/usr/bin/python3')
  " Avoid search, speeding up start-up.
  let g:python3_host_prog='/usr/bin/python3'
endif

" Allow for per-machine overrides in ~/.vim/host/$HOSTNAME.vim and
" ~/.vim/vimrc.local.
let s:hostfile =
      \ $HOME .
      \ '/.vim/host/' .
      \ substitute(hostname(), "\\..*", '', '') .
      \ '.vim'
if filereadable(s:hostfile)
  execute 'source ' . s:hostfile
endif

let s:vimrc_local = $HOME . '/.vim/vimrc.local'
if filereadable(s:vimrc_local)
  execute 'source ' . s:vimrc_local
endif

" ]]]

" Basic Options ---------------------------------------------------------- [[[
set history=3000
set encoding=utf-8
set noshowmode
set scrolloff=8
set wildmenu
set wildmode=list:full
set ruler
set cmdheight=2
set backspace=2
set incsearch
set magic
set showmatch
set noerrorbells
set novisualbell
set t_vb=
set lazyredraw
set ignorecase
set hls
set smartcase
set number
set relativenumber
set gdefault
set nobackup
set noswapfile
set dir=c:\tmp,c:\temp,.
set autoread
set ffs=unix,dos
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set ai
set si
set nowrap
set laststatus=2
set path+=.,~/Devel/Projects/**
set suffixesadd+=.xml
set listchars=tab:▸\ ,eol:¬
set noswapfile
set autochdir
set synmaxcol=200
set fdc=4 " fold gutter

set fillchars=diff:∙               " BULLET OPERATOR (U+2219, UTF-8: E2 88 99)
set fillchars+=fold:·              " MIDDLE DOT (U+00B7, UTF-8: C2 B7)
set fillchars+=vert:┃              " BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)

set list                              " show whitespace
set listchars=nbsp:⦸                  " CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
set listchars+=tab:▷-                 " WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7)
                                      " + BOX DRAWINGS HEAVY TRIPLE DASH HORIZONTAL (U+2505, UTF-8: E2 94 85)
set listchars+=extends:»              " RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
set listchars+=precedes:«             " LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
set listchars+=trail:•                " BULLET (U+2022, UTF-8: E2 80 A2)

if has('termguicolors')
    set termguicolors
endif

if has('persistent_undo')
    " Save all undo files in a single location (less messy, more risky)...
    "
    " First, create undo folder if it doesn't exist.
    if !isdirectory($HOME . '/tmp/.VIM_UNDO_FILES')
        call mkdir($HOME . '/tmp/.VIM_UNDO_FILES', "p")
    endif

    set undodir=$HOME/tmp/.VIM_UNDO_FILES

    " Save a lot of back-history...
    set undolevels=5000

    " Actually switch on persistent undo
    set undofile
endif

" Goto last location in non-empty files
autocmd BufReadPost *  if line("'\"") > 1 && line("'\"") <= line("$")
                   \|     exe "normal! g`\""
                   \|  endif

" Name tmux window with currently edited filename
" autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%:t"))

syntax enable

" ]]]

" Mappings --------------------------------------------------------------- [[[

imap jk <ESC>

let mapleader=' '
let maplocalleader='\\'

nnoremap <leader>s :w<CR>

nnoremap <leader>V :tabedit $MYVIMRC<CR>

" Paste the contents of clipboard
nnoremap <C-Space> "*p

" Copy whole file to clipboard and quit Vim
nnoremap <CS-Space> gg"*yG:q!<CR>

" Rerun last shell command
nnoremap <leader>r :!<UP><CR>

" Show the path of current file.
nnoremap <leader>p :echo expand('%')<CR>

" Mappings for manipulating and moving around splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>h <C-w>h
nnoremap <leader>x <C-w>c
nnoremap <leader>o <C-w>o
nnoremap <C-s> <C-w>+
nnoremap <C-z> <C-w>-
nnoremap <leader>_ <C-w>_

nnoremap <leader>q :QuickScopeToggle<CR>

" Moving up and down with centering the cursor
nnoremap <C-J> jzz
nnoremap <C-K> kzz

" Set CWD to current file's PWD
map <F12> :cd %:h<CR>

" Switch to previous buffer
map <F2> :b#<CR>

imap <C-Space> 

" Tab configuration
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

map <F7> :tabprev<CR>

" Fold all, unfold all
map <leader>; :call Fold()<CR>

function! Fold()
    let foldlvl = eval("&foldlevel")
    if(foldlvl==0)
        set foldlevel=9999
    else
        set foldlevel=0
    endif
endfunction

map 0 ^

" Toggle hls and matching with the <leader>N utility
map <CR> :set hls!<CR>
map <BS> :call clearmatches()<CR>

" Show what highlight group symbol/word under cursor belongs to
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" .  synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" .  synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

" Find all lines with word under cursor and give option to jump to one of the
" lines
" map <leader>f [I:let nr=input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Format XML file with xmllint.exe
nnoremap =x :exe ":silent %!xmllint --format --recover - 2>/dev/null"<CR>:set filetype=xml<CR>

" Easier movement to start and end of line
noremap H ^
noremap L $
vnoremap L g_

nnoremap / /\v
vnoremap / /\v

"nnoremap ' `
"nnoremap ` '

imap {{ {}<ESC>O

nnoremap ZQ ZZ
nnoremap ZZ ZQ

nmap <tab> :bn<CR>
nmap <s-tab> :bp<CR>
map <leader>b :Buffers<CR>

nnoremap <silent> <Up>    :cprevious<CR>
nnoremap <silent> <Down>  :cnext<CR>
nnoremap <silent> <Left>  :cpfile<CR>
nnoremap <silent> <Right> :cnfile<CR>

nnoremap <silent> <S-Up>    :lprevious<CR>
nnoremap <silent> <S-Down>  :lnext<CR>
nnoremap <silent> <S-Left>  :lpfile<CR>
nnoremap <silent> <S-Right> :lnfile<CR>

" Avoid unintentional switch to Ex mode.
nnoremap Q <nop>

noremap Y y$

cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Remove all irrelevant lines from a bash file
" (or any file that uses # as a start of comment).
nnoremap <leader>Q :g/^#\\|\(^$\)/d<CR>

" ]]]

" Folding ---------------------------------------------------------------- [[[
set foldlevelstart=9999
set foldmethod=marker
set foldmarker=[[[,]]]

" Space to toggle folds.
nnoremap <leader>z za
vnoremap <leader>z za

" Make zO recursively open whatever fold we're in, even if it's partially open.
"nnoremap zO zczO

" 1. Close all folds.
" 2. Open just the folds containing the current line.
" 3. Move the line to a little bit (15 lines) above the center of the screen.
" 4. Pulse the cursor line.
"
"nnoremap <leader>z mzzMzvzz15<c-e>`z

"function! MyFoldText() " [[[
"    let line = getline(v:foldstart)
"
"    let nucolwidth = &fdc + &number * &numberwidth
"    let windowwidth = winwidth(0) - nucolwidth - 3
"    let foldedlinecount = v:foldend - v:foldstart
"
"    " expand tabs into spaces
"    let onetab = strpart('          ', 0, &tabstop)
"    let line = substitute(line, '\t', onetab, 'g')
"
"    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
"    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
"    return line . '...' . repeat(" ",fillcharcount) . foldedlinecount . '...' . ' '
"endfunction " ]]]

"set foldtext=MyFoldText()

" ]]]

" GUI -------------------------------------------------------------------- [[[

" Change cursor shape/color depending on mode
if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal and rxvt up to version 9.21
endif

if &term =~ "xterm\\|rxvt"
  " solid underscore
  let &t_SI .= "\<Esc>[5 q"
  " solid block
  let &t_EI .= "\<Esc>[2 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif

let g:airline_theme='papercolor'

"colorscheme mopkai
"colorscheme badwolf
colorscheme github

hi QuickScopeSecondary cterm=none ctermfg=red
hi QuickScopePrimary cterm=underline,bold
hi MatchParen ctermbg=white guibg=white guifg=red gui=underline cterm=bold

set guifont=Source_Code_Pro:h10:cANSI:qDRAFT

set guioptions=egrLt
set guioptions-=T
set guioptions-=m

" Map Alt-x (ø) to toggle max window size
map ø :call MaximizeToggle()<CR>

function! MaximizeToggle()
    let size = eval("&columns")
    if(size > 250)
        simalt ~P
    else
        simalt ~s
    endif
endfunction

winpos 729 3

set lines=70
set columns=172

" Resize font with Control-Up and Control-Down
if has("gui_running")
    if  has("gui_running") && (has("win32") || has("win64"))
        nnoremap <C-Up> :silent let &guifont=substitute(&guifont, ':h\zs\d\+', '\=submatch(0)+1', '')<CR>
        nnoremap <C-Down> :silent let &guifont=substitute(&guifont, ':h\zs\d\+', '\=submatch(0)-1', '')<CR>
    endif
endif

" ]]]

" Filetype Settings ------------------------------------------------------ [[[

" Diff [[[

" This is from https://github.com/sgeb/vim-diff-fold/

function! DiffFoldLevel()
    let l:line=getline(v:lnum)

    if l:line =~# '^\(diff\|Index\)'     " file
        return '>1'
    elseif l:line =~# '^\(@@\|\d\)'  " hunk
        return '>2'
    elseif l:line =~# '^\*\*\* \d\+,\d\+ \*\*\*\*$' " context: file1
        return '>2'
    elseif l:line =~# '^--- \d\+,\d\+ ----$'     " context: file2
        return '>2'
    else
        return '='
    endif
endfunction

augroup ft_diff
    au!

    autocmd FileType diff setlocal foldmethod=expr
    autocmd FileType diff setlocal foldexpr=DiffFoldLevel()
augroup END

"]]]
" XML[[[

let g:xml_syntax_folding=1
au BufEnter,BufCreate *.xml,*.wsdl,*.xslt,*.xsl set filetype=xml
au FileType xml setlocal foldmethod=syntax

"]]]
" XSLT[[[

function! XSLTransform()
    execute "chdir %:h"

    let l:base_name = expand("%:r")
    let l:xml_name  = expand(l:base_name) . ".xml"
    let l:xsl_name  = expand(l:base_name) . ".xslt"
    let l:html_name = expand(l:base_name) . ".html"

    execute "!start Transform -o:" . expand(l:html_name) . " " . expand(l:xml_name) . " " . expand(l:xsl_name)
    execute "tabedit " . expand(l:html_name)

endfunction

"map <leader>xs :call XSLTransform()<CR>

"]]]
" Log [[[

"au BufEnter *.log syntax off

"]]]

"]]]

" Plugin Settings -------------------------------------------------------- [[[

" UltiSnips [[[

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:SuperTabDefaultCompletionType = 'context'

let g:UltiSnipsSnippetsDir="~/.vim/vimfiles/bundle/vim-snippets/mySnips"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mySnips"]

let g:airline_powerline_fonts = 1

"]]]
" Fugitive [[[

nnoremap <leader>gs :silent Gstatus<CR>
nnoremap <leader>gp :silent Gpull<CR>
nnoremap <leader>gd :silent Gdiff<cr>
nnoremap <leader>gw :silent Gwrite<cr>
nnoremap <leader>gb :silent Gblame<cr>
nnoremap <leader>gc :silent Gcommit<cr>
nnoremap <leader>gl :silent Shell git gl -18<cr>:wincmd \|<cr>

let g:gitgutter_map_keys = 0

"]]]
" Matchit [[[

if has('packages')
    packadd! matchit
else
    source $VIMRUNTIME/macros/matchit.vim
endif

"]]]
" Syntastic [[[

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"]]]
" Gundo [[[

map <F5> :GundoToggle<CR>

"]]]
" NERDTree [[[

map <F4> :NERDTree<CR>
map <C-F4> :NERDTreeToggle<CR>

"call NERDTreeAddKeyMap({ [[[
"	   \ 'key': 'w',
"	   \ 'callback': 'NERDTreeToggleWidth',
"	   \ 'quickhelpText': 'Toggle window width' })
"
"function! NERDTreeToggleWidth()
"	let l:maxi = 0
"	for l:z in range(1, line("$"))
"		let l:aktlen = len(getline(l:z))
"		if l:aktlen > l:maxi
"			let l:maxi = l:aktlen
"		endif
"	endfor
"	exe "vertical resize " . (l:maxi == winwidth(".") ? g:NERDTreeWinSize : l:maxi)
"endfunction ]]]

"]]]
" FZF [[[

set wildignore+=*\\tmp\\*,*.sw?,*.zip,*.settings,*.esb_diagram,*\\*sandbox\\*,*.classpath,*\\.meta\\*
set wildignore+=.git,*.orig
set wildignore+=*.exe,*.o,*.obj,*.dll,*.manifest
set wildignore+=*.jpg,*.jpeg,*.bmp,*.gif,*.png

command! -bang -nargs=* FindInRepo call fzf#run({ 'sink': 'e', 'source': 'git ls-files' })

map <leader>ff :Files<CR>
map <leader>fg :GFiles<CR>
map <leader>fr :FindInRepo<CR>
map <leader>fa :Rg<CR>
map <leader>fc :Commits<CR>
map <leader>fb :BCommits<CR>
map <leader>fh :History<CR>

imap <c-l> <plug>(fzf-complete-line)

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" ]]]
" Startify [[[

"let g:startify_header=''
let g:startify_custom_header=''

" ]]]
" Vimux [[[

let g:VimuxOrientation="h"
let g:VimuxHeight="35"

map <leader>vm :VimuxRunCommand("makeSzkody.sh")<CR>
map <leader>vc :VimuxCloseRunner<CR>
map <leader>vr :VimuxRunLastCommand<CR>
map <leader>vi :VimuxInterruptRunner<CR>

" ]]]
" Command-T [[[

map <leader>t :CommandTHelp<CR>

" ]]]
" Vim-Session [[[

let g:session_autosave='no'
let g:session_autoload='no'

" ]]]
" vim-peekaboo [[[

" Make register list wider than default
let g:peekaboo_window='vert bo 75new'

" Wait 1 second before showing registers
let g:peekaboo_delay=1000

" ]]]
" vim-rainbow [[[

let g:rainbow_active=1

" ]]]
" incsearch [[[

let g:incsearch#auto_nohlsearch=1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)

" ]]]

"]]]

" Utilities -------------------------------------------------------------- [[[

" Highlight Word [[[
"
" This mini-plugin provides a few mappings for highlighting words temporarily.
"
" Sometimes you're looking at a hairy piece of code and would like a certain
" word or two to stand out temporarily.  You can search for it, but that only
" gives you one color of highlighting.  Now you can use <leader>N where N is
" a number from 1-6 to highlight the current word in a specific color.

function! HiInterestingWord(n)
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
endfunction

nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

" ]]]

"]]]
