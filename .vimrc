"vimrc begin
"Author Caiqiang Yu <ycqiangboy@gmail.com>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle and Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'flazz/vim-colorschemes'
Plugin 'shawncplus/phpcomplete.vim'


" vim-scripts repos
Plugin 'taglist.vim'

" non github repos



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
filetype plugin indent on
set incsearch " 开启实时搜索功能
set hlsearch " 高亮度搜寻
set ruler " 打开状态栏标尺
set showcmd " 显示正在输入的命令
set csto=0
set showmatch " 高亮显示匹配的括号
set guifont=Courier\ New:h10 " 设置字体
set nu " 设置行数
set t_Co=256 " 设置256色
set ff=unix " 这个文件就以 Unix 格式存盘
set tabstop=4 shiftwidth=4 softtabstop=4  expandtab " Tab键的宽度，统一缩进为4，用空格代替制表符


" vimrc文件修改之后自动加载
autocmd! bufwritepost .vimrc source %


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => F2-F12快捷键
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 去空行
nnoremap <F2> :g/^\s*$/d<CR>
nmap <F3> <Esc>:append<CR>var_dump($<c-r>=expand("<cword>")<CR>);exit;<CR>.<CR>:w<CR>
" 是否显示行号切换, 方便复制
nmap <F4> :set nonumber!<CR>:set foldcolumn=0<CR>
nmap <F5> :tabnew<CR>
nmap <F7> <Esc>:append <CR>error_log(print_r($<c-r>=expand("<cword>")<CR>,true)."\n", 3, '/tmp/myerror.log');<CR>.<CR>:w<CR>
nmap <F9> :TagbarToggle<CR>
nmap <F10> :Tlist<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Learder键映射
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "

nmap <leader>t :NERDTree<CR>
nmap <leader>w :w!<CR>
nmap <leader>q :qa<CR>

" 执行当前php文件
nmap <leader>r :!php %<CR>
nmap <leader>u :!phpunit %<CR>

" 取消高亮
nmap <leader><CR> :nohl<CR>

"对齐格式
nmap <leader>= gg=G<ESC>

" 删除所有的行尾的空格
nmap <leader>v :%s/\s\+$//<CR>:let @/=''<CR>

" 切换tab
nmap <C-m> :tabnext<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => flazz/vim-colorschemes 主题配色
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme molokai
colorscheme desertEx
" colorscheme solarized


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => phpcomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:phpcomplete_relax_static_constraint = 1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => TagList
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置ctags命令的位置
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
" 设置为1时，taglist窗口横向显示。默认纵向显示
let Tlist_Exit_OnlyWindow = 1
" 设置taglist窗口的高度
let Tlist_WinHeight = 100
" 设置taglist窗口的宽度
let Tlist_WinWidth = 40
" 设置Tlist_Show_One_File为1则只显示当前文件的taglist，缺省显示多个文件中的tag
let Tlist_Show_One_File = 1
" taglish默认按tag在文件中出现的顺序进行排序，设置为"name"，taglist将以tag名字进行排序
let Tlist_Sort_Type = "name"
" 设置为1时，如果taglist是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow = 1
" 设置为1时，taglist窗口出现在右侧，缺省显示在左侧
let Tlist_Use_Right_Window = 1
" 如果想在启动VIM后自动打开taglist窗口，该参数设置为1
" let Tlist_Auto_Open = 1
" 如果想在选择了tag后自动关闭taglist窗口，该参数设置为1
let Tlist_Close_On_Select = 1
" 设置为1时，打开taglist光标保留在taglist窗口
let Tlist_GainFocus_On_ToggleOpen = 1
" taglist始终解析文件中的tag
let Tlist_Process_File_Always = 1
let Tist_php_settings =  'php;c:class;i:interface;d:constant;f:function'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 使用这个选项来指定ctags可执行文件的位置
let g:tagbar_ctags_bin = '/usr/bin/ctags'
" tagbar窗口宽度，默认40
let g:tagbar_width = 30
" 如果想在选择了tag后自动关闭taglist窗口
let g:tagbar_autoclose = 1
" 打开vim是自动打开
let g:tagbar_autofocus = 1
