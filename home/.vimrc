set t_Co=256
syntax on
"set nu
set nocompatible
set numberwidth=7
set enc=utf-8

set wildmenu
set nonumber
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
set incsearch

set hlsearch "high-light search
"The cursor jumps to the paired one if showmatch is turned on,
"this really bothers me.
"set showmatch

"colorscheme ir_black
let g:molokai_original=1
colorscheme molokai

filetype plugin on
set ofu=syntaxcomplete#Complete
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete

function! GetStatusEx()
    let str = ''
    let str = str . '[\n:' . &fileformat . ']'
    if has('multi_byte') && &fileencoding != ''
        let str = str . '[enc:' . &fileencoding . ']'
    else
        let str = str . '[enc:default(utf-8)]'
    endif
    return str
endfunction

"ステータスバーの表示
set statusline=%<%f%h\ %y%m%r\ %{GetStatusEx()}\ %{fugitive#statusline()}%=%b\ 0x%B\ \ \ %l,%c%V\ %P

" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=1
" コマンドをステータス行に表示
set showcmd

"Key mapping for insert mode
inoremap <C-F> <C-O>l
inoremap <C-B> <C-O>h

"command-line の編集
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <C-A> <Home>
cnoremap <C-E> <End>

"全置換マップ
vnoremap <C-S> y:%s/<C-R>"//gc<Left><Left><Left>
nnoremap <C-S> :%s/<C-R><C-W>//gc<Left><Left><Left>

"LookupFile
nmap <unique> <silent> <C-S-R> <Plug>LookupFile

"Toggle list mode on/off
noremap <silent> <F10> :set list!<CR>
set listchars=eol:$,tab:>-,trail:.,extends:>,precedes:<,nbsp:_
highlight SpecialKey term=standout ctermbg=yellow guibg=yellow
highlight RedundantSpaces term=standout ctermbg=Grey guibg=#ffddcc
call matchadd('RedundantSpaces', '\(\s\+$\| \+\ze\t\|\t\zs \+\)\(\%#\)\@!')
"End of list mode settings

"Toggle line number on/off
noremap <silent> <F9> :set number!<CR>

"Toggle highlight search
noremap <silent> <F12> :set hlsearch!<CR>

"Toggle NERD tree
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=30
noremap <silent> <F2> :NERDTreeToggle<CR>

" QUICKFIX WINDOW
" @see http://c9s.blogspot.com/2007/10/vim-quickfix-windows.html
command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
    if exists("g:qfix_win") && a:forced == 0
        botright cclose
        unlet g:qfix_win
    else
        botright copen 10
        let g:qfix_win = bufnr("$")
    endif
endfunction
"nnoremap <leader>q :QFix<CR>

" close quickfix window.
"nmap <F4> :cclose<CR>
nmap <silent> <F4> :QFix<CR>
" next quickfix line.
"map <F8> :cn<CR>
" prev quickfix line.
"map <F7> :cp<CR>
" compile c/cpp code.
autocmd FileType cpp,c nmap <F5> :setlocal makeprg=make<CR>:make<CR> :copen<CR> <C-W>10_
"autocmd FileType javascript nmap <F5> :make<CR>
if exists("JsonLint")
    autocmd FileType javascript nmap <F6> :call JsonLint()<CR>
endif
"autocmd FileType html,xhtml,css nmap <F5> :make<CR><CR>:copen<CR>
"autocmd FileType cpp,c nmape <F10> :!g++ -o %:r.exe %<CR><CR>
" @see http://easwy.com/blog/archives/advanced-vim-skills-quickfix-mode/
"      http://blog.zdnet.com.cn/html/30/422230-2881199.html
"autocmd FileType cpp nmap <F5> :w<CR>:setlocal makeprg=g++\ -Wall\ -o\ %:r.exe\ %<CR>:make<CR><CR>:cw<CR>
"autocmd FileType c nmap <F5> :w<CR>:setlocal makeprg=gcc\ -Wall\ -o\ %:r.exe\ %<CR>:make<CR><CR>:cw<CR>
" @see http://csstidy.sourceforge.net/
autocmd FileType css nmap <F5> :!csstidy %:p --preserve_css=false --remove_bslash=false --compress_color=true --lowercase_s=false --timestamp=false --optimise_shorthands=0 --remove_last_\;=true --sort_selectors=false --merge_selectors=0 --compress_font-weight=false --allow_html_in_template=false --silent=true --case_properties=0 --template=default %:p:r.min.%:p:e<CR><CR>
" run current code.
"autocmd FileType cpp,c nmap <F5> :!%:r.exe
"autocmd FileType xhtml,html nmap <F5> :call Save2Temp()<CR><CR>:!start "E:\Mozilla Firefox\firefox.exe" -P debug %<CR>
"autocmd FileType xhtml,html nmap <F5> :call Save2Temp()<CR><CR>:!start "RunDll32.exe shell32.dll,ShellExec_RunDLL %:p<CR>
"autocmd FileType dosbatch nmap <F5> :!%<CR><CR>

set tags+=./.tags
"Taglist, aka. Tlist
let g:Tlist_Use_Right_Window=1
let g:Tlist_Use_Horiz_Window=0
let g:Tlist_WinWidth=30
nnoremap <silent> <F3> :TlistToggle<CR>
