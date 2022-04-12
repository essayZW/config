let mapleader = "\<Space>"
inoremap jk <esc>

" Uncomment the following to have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" 高亮搜索
set hlsearch
" 终端真彩色
set termguicolors


" 折叠代码块方式
set foldmethod=syntax
" 用来关闭打开文件时候的自动折叠
set foldlevelstart=99

" 用来设置vim命令行模式下的tab候选
set wildmenu
set wildmode=full


if has("gui_running")
    set guioptions-=m " 隐藏菜单栏
    set guioptions-=T " 隐藏工具栏
    set guioptions-=L " 隐藏左侧滚动条
    set guioptions-=r " 隐藏右侧滚动条
    set guioptions-=b " 隐藏底部滚动条
    set showtabline=0 " 隐藏Tab栏
endif

set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1

"startify插件与nerd插件冲突的设置
autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif

"Plug插件管理器的设置
call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Yggdroot/LeaderF'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Chiel92/vim-autoformat'
Plug 'tomasiser/vim-code-dark'
Plug 'editorconfig/editorconfig-vim'
" git support
Plug 'tpope/vim-fugitive'
Plug 'altercation/vim-colors-solarized'
Plug 'overcache/NeoSolarized'
Plug 'tomasr/molokai'
Plug 'buoto/gotests-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
if has("nvim")
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-lua/plenary.nvim'
    Plug 'folke/todo-comments.nvim'
endif
Plug 'puremourning/vimspector'
Plug 'liuchengxu/vim-which-key'
Plug 'joshdick/onedark.vim'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

let g:solarized_termcolors=256

if has("gui_running")
    colorscheme  solarized
    set background=dark
    set ambiwidth=double
else
    colorscheme NeoSolarized
    set background=dark
endif

"设置光标所在行的高亮
set cursorline
set hidden
"字符匹配单词
set incsearch
set guifont=SF\ Mono
set autoindent

" 设置切换Buffer快捷键"
nnoremap <C-left> :bp<CR>
nnoremap <C-right> :bn<CR>
" 正常模式下 alt+j,k,h,l 调整分割窗口大小
nnoremap <M-j> :resize +5<cr>
nnoremap <M-k> :resize -5<cr>
nnoremap <M-h> :vertical resize -5<cr>
nnoremap <M-l> :vertical resize +5<cr>
"" Vim 的默认寄存器和系统剪贴板共享
"set clipboard+=unnamed
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
if has("nvim")
    set undodir=~/.nvimcache/undodir
    set backupdir=~/.nvimcache/back
else
    set undodir=~/.vimcache/undodir
    set backupdir=~/.vimcache/back
endif
if has("gui_running")
    let g:airline_theme="solarized"
else
    let g:airline_theme="solarized"
endif
set laststatus=2  "永远显示状态栏


"这个是安装字体后 必须设置此项"
let g:airline_powerline_fonts = 1

"打开tabline功能,方便查看Buffer和切换
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
let NERDTreeShowHidden=1
"开启/关闭nerdtree快捷键
map wm :NERDTreeToggle<CR>
"let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
"打开vim时如果没有文件自动打开NERDTree
autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
            \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
"设置树的显示图标
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeIgnore = ['\.pyc$']  " 过滤所有.pyc文件不显示
let g:NERDTreeShowLineNumbers=1  " 是否显示行号
let g:NERDTreeHidden=0
"Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


"""设置tagbar的窗口显示的位置,为左边
"let g:tagbar_right=0
""打开文件自动 打开tagbar
""autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
"""映射tagbar的快捷键
map <F8> :TagbarToggle<CR>
""map <C-t> :TagbarToggle<CR>

let g:tagbar_width=20


"插入模式下用绝对行号, 普通模式下用相对
set relativenumber number
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber number

"关于startify插件的设置

" 起始页显示的列表长度
let g:startify_files_number = 20

" 是否自动加载目录下的Session.vim, 很好用
let g:startify_session_autoload = 1

" 过滤列表，支持正则表达式
let g:startify_skiplist = [
            \ '\.vimgolf',
            \ '^/tmp',
            \ '/project/.*/documentation',
            \ ]

set tags=./.tags;,.tags


" ======= 设置当文件被外部改变的时侯自动读入文件 ======= "
if exists("&autoread")
    set autoread
endif


" COC相关设置
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    " set signcolumn=number
else
    set signcolumn=yes
endif
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() :
            \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>coa :CocAction<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" 打开markdown预览
nmap <leader>mp :CocCommand markdown-preview-enhanced.openPreview<CR>
autocmd CursorHold * silent call CocActionAsync('highlight')
" go 保存时候自动格式化
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
autocmd BufWritePre *.go :call CocAction('format')
" coc git
autocmd User CocGitStatusChange {command}

let g:airline_section_b = "%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}"
" coc yank
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>


" vim-go
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
let g:go_gopls_enabled = 0
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1

" LeadefF
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
" let g:Lf_WindowPosition = 'popup'
" let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }



" 调出目录下全文件模糊搜索
noremap <leader>rg :<C-U><C-R>=printf("Leaderf rg")<CR><CR>
noremap <leader>lrg :<C-U><C-R>=printf("Leaderf! rg --recall")<CR><CR>
" 搜索目录文件
noremap <leader>lff :<C-U><C-R>=printf("Leaderf file --no-ignore %s", "")<CR><CR>
" 搜索打开的buffer
noremap <leader>lfb :<C-U><C-R>=printf("Leaderf buffer")<CR><CR>
" 搜索当前文件中的行
noremap <leader>lfl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
" 搜索所有打开的buffer中的行
noremap <leader>lfla :<C-U><C-R>=printf("Leaderf line %s --all", "")<CR><CR>
" 搜索当前文件中的函数
noremap <leader>lfu :<C-U><C-R>=printf("Leaderf function")<CR><CR>
" 搜索所有打开文件中的函数
noremap <leader>lfua :<C-U><C-R>=printf("Leaderf function --all")<CR><CR>
" search visually selected text literally
xnoremap <leader>lfrgf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR><CR>
noremap <leader>lfrgo :<C-U>Leaderf! rg --recall<CR>
let g:Lf_WildIgnore={'file':['*.vcproj', '*.vcxproj'],'dir':['node_modules']}
" Show icons, icons are shown by default
let g:Lf_ShowDevIcons = 1
" For GUI vim, the icon font can be specify like this, for example
let g:Lf_DevIconsFont = "DroidSansMono Nerd Font Mono"
" If needs
" should use `Leaderf gtags --update` first
let g:Lf_Ctags ="/usr/local/bin/exctags"
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>lfgr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>lfgd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>lfgo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>lfgn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>lfgp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>


function! s:DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" 注释的时候自动加个空格
let g:NERDSpaceDelims=1

" 解决signcolumn颜色问题
autocmd ColorScheme * highlight! link SignColumn LineNr
highlight! link SignColumn LineNr

if has('nvim')
    lua require('plugin-config/nvim-treesitter')
    lua require('plugin-config/todo-comments')
endif

" vimspector
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

" which key
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
" By default timeoutlen is 1000 ms
set timeoutlen=500

" vim-devicons
autocmd FileType nerdtree setlocal nolist
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
