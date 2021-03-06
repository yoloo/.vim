"============================================================== 
"General
"============================================================== 
syntax on                  "打开关键字上色

set ai                     "自动缩进
set cin                    "打开C/C++风格的自动缩进
set sw=4                   "自动缩进的时候，缩进尺寸为4个空格
set ts=4                   "Tab宽度为4个字符

set nu                     "添加行号
set sm                     "显示括号配对情况

set hls                    "搜索时高亮显示被找到的文本
set is                     "搜索时在未完全输入完毕要检索的文本时就开始检索

set et                     "编辑时将所有Tab替换为空格
set smarttab               "当使用et将Tab替换为空格之后，按下一个Tab键就能插入4个空格，但要想删除这4个空格，就得按4下Backspace，很不方便。设置smarttab之后，就可以只按一下Backspace就删除4个空格了

set t_Co=256               "设置256色显示
"set colorcolumn=85         "彩色显示第85行
set cursorcolumn           "光标垂直高亮
set cursorline             "光标所在行加下划线

set encoding=utf-8

"插入模式下移动
"imap <c-j> <down>
"imap <c-k> <up>
"imap <c-l> <right>
"imap <c-h> <left>

if has("autocmd")          "记录上次退出VIM位置
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"============================================================== 
"Vundle plugin
"============================================================== 
set nocompatible           " nocompatible vi
filetype off               " required(YCM)

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
call vundle#begin()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" 1.plugin on GitHub repo
"Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'
Bundle 'vim-scripts/The-NERD-tree'
Bundle 'vim-scripts/ctrlp.vim'
Bundle 'vim-scripts/taglist.vim'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/UltiSnips'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-scripts/Markdown'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-surround'
Bundle 'Yggdroot/indentLine'
Bundle 'Raimondi/delimitMate'
Bundle 'rdnetto/YCM-Generator'
Bundle 'JamshedVesuna/vim-markdown-preview'
Bundle 'pangloss/vim-javascript'
Bundle 'vim-airline/vim-airline-themes'

" 2.Git plugin not hosted on GitHub
"Bundle 'git://git.wincent.com/command-t.git'

" 3.Git repos on your local machine (i.e. when working on your own plugin)
"Bundle 'file:///home/username/...'
"Bundle 'file:///home/gmarik/path/to/plugin'

call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
" 
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"@0:global mapleader
let mapleader="."  "leader映射为点号

"@1:vim-airline
set laststatus=2
let g:airline_detect_whitespace=1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme="molokai"

"@2:YouCompleteMe
set completeopt=longest,menu  " 关掉补全时的预览窗口
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0  "关闭每次加载.ycm_extra_conf.py配置提示
let g:ycm_show_diagnostics_ui=1  "开启ycm的syntastic
let g:ycm_complete_in_strings=1  "在字符串中也能补全
let g:ycm_complete_in_comments=1 "在注释中也能补全
let g:ycm_seed_identifiers_with_syntax=1  "语法关键字补全
let g:ycm_min_num_of_chars_for_completion=2  "从第2个字符开始补全

let g:ycm_key_invoke_completion='<c-l>'                  "全局补全触发
let g:ycm_key_list_select_completion=['<c-n>', '<Down>'] "补全选择<向下>
let g:ycm_key_list_previous_completion=['<c-p>', '<Up>'] "补全选择<向上>

nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>jk :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jl :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jj :YcmCompleter GoToDefinitionElseDeclaration<CR>

"@3:nerdtree
map <F2> :silent! NERDTreeToggle<CR> "开启/关闭nerdtree快捷键

"@4:taglist
"let Tlist_Auto_Open=1         "在启动VIM后，自动打开taglist窗口
let Tlist_Exit_OnlyWindow=1    "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window=0   "在右侧窗口中显示taglist窗口
map <F3> :silent! Tlist<CR>    "开启/关闭taglist快捷键

"@5:tagbar
map <F4> :silent! TagbarToggle<CR> "开启/关闭tagbar快捷键

"@6:nerdcommenter
".ca:切换注释方式(c/c++)
".cc:注释当前行
".cs:以"性感"的方式注释
".cA:当前行尾添加注释，并进入insert模式
".cu:取消注释
"Normal模式下，几乎所有命令前面都可以指定行数，如3.cs，注释3行
"Visual模式下执行命令，会对选中的特定区块进行注释/反注释

"@7:easymotion
"(快捷键<Leader><Leader>h，即..h)
let g:EasyMotion_smartcase = 1
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
map <Leader><leader>. <Plug>(easymotion-repeat)

"@8:tabularize
nmap <Leader>a& :Tabularize /&<CR>
vmap <Leader>a& :Tabularize /&<CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a,, :Tabularize /,\zs<CR>
vmap <Leader>a,, :Tabularize /,\zs<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

"@9:syntastic
"支持c++11
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'

"@10:surround
"Normal mode
"-----------
"ds  - delete a surrounding
"cs  - change a surrounding
"ys  - add a surrounding
"yS  - add a surrounding and place the surrounded text on a new line + indent it
"yss - add a surrounding to the whole line
"ySs - add a surrounding to the whole line, place it on a new line + indent it
"ySS - same as ySs

"Visual mode
"-----------
"s   - in visual mode, add a surrounding
"S   - in visual mode, add a surrounding but place text on new line + indent it

"Insert mode
"-----------
"<CTRL-s> - in insert mode, add a surrounding
"<CTRL-s><CTRL-s> - in insert mode, add a new line + surrounding + indent
"<CTRL-g>s - same as <CTRL-s>
"<CTRL-g>S - same as <CTRL-s><CTRL-s>

"@11.indent-line
map <leader>il :IndentLinesToggle<CR>
let g:indentLine_color_term = 239
let g:indentLine_char = '┆'

"@12.YCM-Generator
"open vim, then ':YcmGenerateConfig'

"@13.vim-themes
set background=dark        

"使用solarized
"let g:solarized_termtrans=1
"let g:solarized_contrast="normal"
"let g:solarized_visibility="normal"
"colorscheme solarized

"使用molokai
let g:molokai_original=1
colorscheme molokai
