
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
