let mapleader = "\<Space>"
inoremap jk <esc>

" 高亮搜索
set hlsearch

" 折叠代码块方式
set foldmethod=syntax
" 用来关闭打开文件时候的自动折叠
set foldlevelstart=99

" 用来设置vim命令行模式下的tab候选
set wildmenu
set wildmode=full

set cursorline
set hidden
"字符匹配单词
set incsearch
set guifont=SF\ Mono
set autoindent

" 设置切换Buffer快捷键"
nnoremap <C-left> :bp<CR>
nnoremap <C-right> :bn<CR>
" 调整分割窗口大小
nnoremap <leader>rj :resize +5<cr>
nnoremap <leader>rk :resize -5<cr>
nnoremap <leader>rh :vertical resize -5<cr>
nnoremap <leader>rl :vertical resize +5<cr>
" 设置 alt 键不映射到菜单栏
set winaltkeys=no
"不换行
set nowrap
"缩进设置
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
syntax on
set noswapfile
set undofile
set backup

"插入模式下用绝对行号, 普通模式下用相对
set relativenumber number
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber number

set tags=./.tags;,.tags

" ======= 设置当文件被外部改变的时侯自动读入文件 ======= "
if exists("&autoread")
    set autoread
endif


set noswapfile
set undofile
set backup
set undodir=~/.vimcache/undodir
set backupdir=~/.vimcache/back
set backspace=indent,eol,start
set laststatus=2
