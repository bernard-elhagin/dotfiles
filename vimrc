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
Plugin 'sjl/gundo.vim'
Plugin 'mileszs/ack.vim'
Plugin 'godlygeek/tabular'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/MatchTagAlways'
Plugin 'gregsexton/gitv'
Plugin 'mhinz/vim-startify'
Plugin 'majutsushi/tagbar'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/vim-peekaboo'
Plugin 'airblade/vim-rooter'
Plugin 'sukima/xmledit'
Plugin 'vim-syntastic/syntastic'
Plugin 'wincent/command-t'
Plugin 'whiteinge/diffconflicts'
Plugin 'unblevable/quick-scope'
Plugin 'vim-scripts/CSApprox'
Plugin 'Valloric/YouCompleteMe'
Plugin 'benmills/vimux'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'xolox/vim-session'

call vundle#end()

filetype plugin indent on

" ]]]

" Basic Options ---------------------------------------------------------- [[[
set history=3000
set encoding=utf-8
set noshowmode
set scrolloff=8
set wildmenu
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
set cdpath=C:\Git\iszkody-esb

if has('persistent_undo')
    " Save all undo files in a single location (less messy, more risky)...
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

let mapleader = ' '

map <leader>s :w<CR>

map <leader>V :tabedit $MYVIMRC<CR>

" Paste the contents of clipboard
map <C-Space> "*p

" Copy whole file to clipboard and quit Vim
map <CS-Space> gg"*yG:q!<CR>

" Rerun last shell command
map <leader>r :!<UP><CR>

" Mappings for manipulating and moving around splits
map <leader>j j
map <leader>k k
map <leader>l l
map <leader>h h
map <leader>c c
map <leader>o o
"map <leader>x x
map <C-s> +
map <C-z> -
map <leader>_ _

map <leader>q :QuickScopeToggle<CR>

" Moving up and down with centering the cursor
map <C-J> jzz
map <C-K> kzz

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

map <leader>b :Buffers<CR>

" ]]]

" Folding ---------------------------------------------------------------- [[[
set foldlevelstart=9999
set foldmethod=marker
set foldmarker=[[[,]]]

" Space to toggle folds.
nnoremap <leader>z za
vnoremap <leader>z za

" Make zO recursively open whatever fold we're in, even if it's partially open.
nnoremap zO zczO

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

let g:airline_theme='papercolor'

colorscheme mopkai

hi Visual ctermbg=blue
hi xmlTagName ctermfg=198 cterm=bold
hi xmlTag ctermfg=198 cterm=bold
hi MatchParen ctermfg=yellow cterm=bold
hi StartifyFile ctermfg=cyan
hi StartifyPath ctermfg=blue

"hi PreProc ctermfg=cyan
"hi MatchParen ctermbg=bg ctermfg=yellow cterm=bold
"hi xmlTagName ctermfg=22
"hi xmlTag ctermfg=22
"hi xmlString ctermfg=yellow
"hi Type ctermfg=111
"hi String ctermfg=13
"hi xmlEndTag ctermfg=4
"hi xmlTag ctermfg=cyan
"hi xmlTagName ctermfg=cyan
"hi Comment ctermfg=4
"hi xmlString ctermfg=13

" Override some of the color settings of PaperColor
" hi String guifg=hotpink
" hi XmlString guifg=hotpink
" hi MatchParen guibg=bg guifg=red gui=bold
" hi Folded guibg=#204a87 guifg=#d3d7cf gui=none
" hi Search gui=none guifg=black guibg=#55aaff
" hi CtrlPMatch guifg=red

" Override some of the color settings of PaperColor
"hi String guifg=#ff8888
"hi XmlString guifg=#ff8888
"hi Folded guibg=#204a87 guifg=#d3d7cf gui=none
"hi Search gui=none guifg=black guibg=#55aaff
"hi CtrlPMatch guifg=red

" set guifont=Hack:h9:cANSI:qDRAFT
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

map <leader>xs :call XSLTransform()<CR>

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

"packadd! matchit

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

set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.settings,*.esb_diagram,*\\*sandbox\\*,*.classpath,*\\.meta\\*

command! -bang -nargs=* FindInRepo call fzf#run({ 'sink': 'e', 'source': 'git ls-files' })

map <leader>ff :Files<CR>
map <leader>fg :GFiles<CR>
map <leader>fr :FindInRepo<CR>
map <leader>fa :Ag<CR>
map <leader>fc :Commits<CR>
map <leader>fb :BCommits<CR>
map <leader>fh :History<CR>

imap <c-l> <plug>(fzf-complete-line)

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" ]]]
" Startify [[[

let g:startify_header=''
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

function! HiInterestingWord(n) " [[[
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
endfunction " ]]]

" Mappings [[[
nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>
" ]]]
" Default Highlights [[[
hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195
" ]]]
" ]]]

"]]]
