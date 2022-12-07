let mapleader = "\<Space>"
inoremap jk <esc>

" 打开文件时跳转到上次编辑位置
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" 在终端中禁用鼠标
set mouse=

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

" 水平分屏默认新的窗口在下面
set splitbelow


if has("gui_running")
    set guioptions-=m " 隐藏菜单栏
    set guioptions-=T " 隐藏工具栏
    set guioptions-=L " 隐藏左侧滚动条
    set guioptions-=r " 隐藏右侧滚动条
    set guioptions-=b " 隐藏底部滚动条
    set guioptions-=e
endif

set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1


"Plug插件管理器的设置
call plug#begin('~/.vim/plugged')
" 简单状态栏
Plug 'itchyny/lightline.vim'
" 快速注释插件
Plug 'scrooloose/nerdcommenter'
" lsp 支持
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 模糊搜索插件
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
" 显示行尾的红色,并进行消除
Plug 'ntpeters/vim-better-whitespace'
" git support
Plug 'tpope/vim-fugitive'
" 图标
Plug 'ryanoasis/vim-devicons'
" 提示快捷键
Plug 'liuchengxu/vim-which-key'
" bufferline
Plug 'mengelbrecht/lightline-bufferline'
" code dark plus
Plug 'dunstontc/vim-vscode-theme'
" nvim treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" 文件自动与server同步插件
Plug 'kenn7/vim-arsync'
" tags 浏览插件
Plug 'liuchengxu/vista.vim'
" vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


" vscode 默认的黑色主题
Plug 'tomasiser/vim-code-dark'
" onedark 主题
Plug 'joshdick/onedark.vim'
" 原版的solarized配色
Plug 'altercation/vim-colors-solarized'
" 不需要终端主题的solarized配色
Plug 'overcache/NeoSolarized'
" molokai 主题
Plug 'tomasr/molokai'
" Yggdroot/duoduo
Plug 'Yggdroot/duoduo'
" morhetz/gruvbox
Plug 'morhetz/gruvbox'
" dracula/vim
Plug 'dracula/vim'
call plug#end()

let g:solarized_termcolors=16
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
if has("gui_running")
    colorscheme  solarized
    set background=dark
    set ambiwidth=double
else
    colorscheme codedark
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
if has("nvim")
    set undodir=~/.nvimcache/undodir
    set backupdir=~/.nvimcache/back
else
    set undodir=~/.vimcache/undodir
    set backupdir=~/.vimcache/back
endif
set laststatus=2  "永远显示状态栏

"插入模式下用绝对行号, 普通模式下用相对
set relativenumber number
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber number

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
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1):
            \ <SID>check_back_space() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <CR> to confirm completion, use:
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>vgd :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <leader>hgd :call CocAction('jumpDefinition', 'split')<CR>
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>vgi :call CocAction('jumpImplementation', 'vsplit')<CR>
nmap <leader>hgi :call CocAction('jumpImplementation', 'split')<CR>
nmap <leader>gr <Plug>(coc-references)
" Show commands.
nnoremap <silent><nowait> <space>coc  :<C-u>CocList commands<cr>
" coc List
nnoremap <silent><nowait> <space>col  :<C-u>CocList<cr>

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
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

autocmd CursorHold * silent call CocActionAsync('highlight')
" 打开markdown预览
nmap <leader>mp :CocCommand markdown-preview-enhanced.openPreview<CR>
" go 保存时候自动格式化
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
autocmd BufWritePre *.go :call CocAction('format')
" coc git
autocmd User CocGitStatusChange {command}

" coc yank
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" Show all diagnostics.
nnoremap <silent><nowait> <space>dia  :<C-u>CocList diagnostics<cr>
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)


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


let g:Lf_RgConfig = [
        \ "--max-columns=180",
        \ "--glob=!.git/*",
        \ "--hidden"
    \ ]

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

" which key
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
" By default timeoutlen is 1000 ms
set timeoutlen=500

" vim-devicons
autocmd FileType nerdtree setlocal nolist
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '

" todo comment highlight
augroup vimrc_todo
    au!
    au Syntax * syn match MyTodo /\v<(FIXME|NOTE|TODO|OPTIMIZE|XXX):/
                \ containedin=.*Comment,vimCommentTitle
augroup END
hi def link MyTodo Todo

" coc multi line support
nmap <silent> <leader><C-m> <Plug>(coc-cursors-position)
nmap <silent> <C-n> <Plug>(coc-cursors-word)
xmap <silent> <C-n> <Plug>(coc-cursors-range)

" light line
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! CocCurrentSymbolsLine()
    return get(b:, 'coc_symbol_line', '')
endfunction

function! LightlineTruncatedFileName()
    let l:filePath = expand('%:~:.')
    if winwidth(0) > 100
        return l:filePath
    else
        return pathshorten(l:filePath)
    endif
endfunction

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction
" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'gitbranch', 'filename', 'modified'] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction',
      \   'gitbranch': 'FugitiveHead',
      \   'currentSymbolsLine': 'CocCurrentSymbolsLine',
      \   'filename': 'LightlineTruncatedFileName',
      \   'method': 'NearestMethodOrFunction'
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }
autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
set showtabline=2
let g:lightline#bufferline#show_number=3
let g:lightline#bufferline#ordinal_separator=":"
let g:lightline#bufferline#enable_devicons=1

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

nmap <Leader>d1 <Plug>lightline#bufferline#delete(1)
nmap <Leader>d2 <Plug>lightline#bufferline#delete(2)
nmap <Leader>d3 <Plug>lightline#bufferline#delete(3)
nmap <Leader>d4 <Plug>lightline#bufferline#delete(4)
nmap <Leader>d5 <Plug>lightline#bufferline#delete(5)
nmap <Leader>d6 <Plug>lightline#bufferline#delete(6)
nmap <Leader>d7 <Plug>lightline#bufferline#delete(7)
nmap <Leader>d8 <Plug>lightline#bufferline#delete(8)
nmap <Leader>d9 <Plug>lightline#bufferline#delete(9)
nmap <Leader>d0 <Plug>lightline#bufferline#delete(10)

" coc explorer
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/coc',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'tab:$': {
\     'position': 'tab:$',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }

" Use preset argument to open it
nmap <space>eb <Cmd>CocCommand explorer --preset buffer<CR>
nmap <space>es <Cmd>CocCommand explorer --preset simplify<CR>

" List all presets
nmap <space>el <Cmd>CocList explPresets<CR>

let g:python_host_skip_check=1
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_skip_check=1
let g:python3_host_prog = '/usr/bin/python3'

let g:vim_vue_plugin_config = {
      \'syntax': {
      \   'template': ['html'],
      \   'script': ['javascript', 'typescript'],
      \   'style': ['css'],
      \},
      \'full_syntax': [],
      \'initial_indent': [],
      \'attribute': 0,
      \'keyword': 0,
      \'foldexpr': 0,
      \'debug': 0,
      \}


" 为nvim开启treesitter功能
if has('nvim')
    lua require('plugin-config/nvim-treesitter')
endif

let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]


" strip whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
let g:better_whitespace_filetypes_blacklist=['diff', 'git', 'gitcommit', 'unite', 'qf', 'help', 'markdown', 'fugitive']

" vista
" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works for the kind renderer, not the tree renderer.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

" tab 快捷操作
" 新建一个tab
nmap <leader>ta :tabnew %<CR>
" 切换到下一个tab
nmap <leader>tn :tabn<CR>
" 切换到上一个tab
nmap <leader>tp :tabp<CR>
" 列出所有tab
nmap <leader>tl :tabs<CR>
" 关闭当前tab
nmap <leader>tc :tabclose<CR>

" 终端快捷操作
" 垂直分屏创建一个终端 new-terminal-(vertical)split
nmap <leader>ntv :vsp<CR>:terminal<CR>
" 水平分屏创建一个终端 new-terminal-(horizontal)split
nmap <leader>nth :sp<CR>:terminal<CR>
" 当前窗口新建终端 new-terminal-current: ntc
nmap <leader>ntc :terminal<CR>

" vim-go
let g:go_gopls_enabled = 0
" 禁用vim-go的快捷键映射
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_textobj_enabled = 0
" 禁用自动格式化,使用coc-go提供的能力
let g:go_fmt_autosave = 0
" 禁用自动import,使用coc-go提供的能力
let g:go_imports_autosave = 0
" vim-go 高亮
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1

" 调整maxmempattern
set maxmempattern=2000
