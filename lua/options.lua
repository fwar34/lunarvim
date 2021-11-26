
-- 打开文件时恢复上一次光标所在位置
vim.cmd [[ autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \    exe "normal! g`\"" |
    \ endif ]]

-- Tab键的宽度
vim.cmd('set tabstop=4')
-- 统一缩进为4
vim.cmd('set softtabstop=4')
vim.cmd('set shiftwidth=4')
vim.cmd('set pastetoggle=<F9>')
-- 打开文件时自动尝试下面顺序的编码
-- vim.cmd('set fileencodings=utf-8,chinese,latin-1')
vim.cmd('set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1')
-- 设置当文件被改动时自动载入
vim.cmd('set autoread')
-- 终端下可以和windows共享clipboard
vim.cmd('set clipboard=unnamedplus')
-- tab使用空格代替
vim.cmd('set expandtab')
-- 使回格键（backspace）正常处理indent, eol, start等
vim.cmd('set backspace=indent,eol,start')
-- Windows 禁用 ALT 操作菜单（使得 ALT 可以用到 Vim里）
vim.cmd("set winaltkeys=no")
-- 设置分隔符可视
vim.cmd('set listchars=tab:\\|\\ ,trail:.,extends:>,precedes:<')
-- 设置显示制表符等隐藏字符
vim.cmd('set list')
-- 高亮dos的特殊符号,如^M
vim.cmd('set fileformats=unix,dos,mac')
vim.cmd('set autowrite')
-- 自动缩进
vim.cmd('set autoindent')
-- 智能的选择对起方式
vim.cmd('set smartindent')
-- C的对齐
vim.cmd('set cindent')
vim.cmd('set cinoptions=g0,(0,W4,l1,N-s,E-s,t0,j1,J1')
-- 关闭自动换行
vim.cmd('set nowrap')
-- 允许 Vim 自带脚本根据文件类型自动设置缩进等
vim.cmd('filetype plugin indent on')
-- 延迟绘制（提升性能）
vim.cmd('set lazyredraw')
-- 设置 tags：当前文件所在目录往上向根目录搜索直到碰到 .tags 文件
-- 或者 Vim 当前目录包含 .tags 文件
vim.cmd('set tags=./.tags;,.tags')
-- 如遇Unicode值大于255的文本，不必等到空格再折行
vim.cmd('set formatoptions+=m')
-- 合并两行中文时，不在中间加空格
vim.cmd('set formatoptions+=B')
-- 代码折叠默认使用缩进
vim.cmd('set fdm=indent')
-- 默认打开所有缩进
vim.cmd('set foldlevel=99')

-- vim.cmd('set wildignore=*.so,*.swp,*.zip,*.exe,.git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**,**/debian/**')
-- 文件搜索和补全时忽略下面扩展名
vim.cmd('set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class')
vim.cmd('set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib') -- stuff to ignore when tab completing
vim.cmd('set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex')
vim.cmd('set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz') -- MacOSX/Linux
vim.cmd('set wildignore+=*DS_Store*,*.ipch')
vim.cmd('set wildignore+=*.gem')
vim.cmd('set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso')
vim.cmd('set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**')
vim.cmd('set wildignore+=*/.nx/**,*.app,*.git,.git')
vim.cmd('set wildignore+=*.wav,*.mp3,*.ogg,*.pcm')
vim.cmd('set wildignore+=*.mht,*.suo,*.sdf,*.jnlp')
vim.cmd('set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf')
vim.cmd('set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc')
vim.cmd('set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps')
vim.cmd('set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu')
vim.cmd('set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc')
vim.cmd('set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android')
