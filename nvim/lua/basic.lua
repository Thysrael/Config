-- 这里面的所有配置，都可以用 :help config 的方式查询到，比如 :help encodingj

-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

-- jkhl 移动时光标周围保留8行
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- 使用相对行号
vim.wo.number = true
vim.wo.relativenumber = true

-- shiftwidth 是缩进(也就是 '>>' 和 '<<' 操作的大小)的大小，设置成 4
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4

-- tabstop 是 tab 的大小
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4

-- shiftround 是对 shift 进行一个取整操作，比如说如果前面是 7 个空格，就会变成 8 个
vim.o.shiftround = true

-- 自动缩进，效果为新行会对齐旧行
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
vim.o.cindent = true
vim.bo.cindent = true
-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true

-- 搜索高亮
vim.o.hlsearch = true

-- 边输入边搜索
vim.o.incsearch = true

-- 鼠标支持，说白了就是让鼠标点击等价与进入 insert 模式
vim.o.mouse = "a"

-- 禁止创建备份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- smaller updatetime 自动写回磁盘
vim.o.updatetime = 300

-- 设置 timeoutlen 为等待键盘快捷键连击时间500毫秒，可根据需要设置
vim.o.timeoutlen = 500

-- split window 从下边和右边出现
vim.o.splitbelow = true
vim.o.splitright = true

-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"

-- 补全增强
vim.o.wildmenu = true

-- 自动保存
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
	pattern = { "*" },
	command = "silent! wall",
	nested = true,
})

-- 与系统剪切板共用
vim.api.nvim_command('set clipboard+=unnamedplus')

-- 自动切换输入法
--[[ 
逻辑是这样的：
先让 fcitx 有两种输入法：搜狗（包括中文和英文）和英文
正是因为我喜欢搜狗的快捷键，所以我只希望使用搜狗的中英文
但是这个想法是办不到的，所以我必须设置一个英文输入法
fcitx-remote -c 会关闭一个输入法 -o 会打开一个输入法 
我只要在 normal 模式下选择普通英文即可，而其他时候使用搜狗的中英文
]]
-- 离开插入模式关闭搜狗输入
vim.api.nvim_command('autocmd InsertLeave * :silent !fcitx-remote -o')
-- 进入插入模式打开搜狗输入
vim.api.nvim_command('autocmd InsertEnter * :silent !fcitx-remote -c')
-- 进入 vim 关闭搜狗输入
vim.api.nvim_command('autocmd VimEnter * :silent !fcitx-remote -o')
vim.api.nvim_command('autocmd WinEnter * :silent !fcitx-remote -o')
-- 离开 vim 打开搜狗输入
vim.api.nvim_command('autocmd VimLeave * :silent !fcitx-remote -c')
-- vim 失去焦点的时候，主要用于和其他窗口作用
vim.api.nvim_command('autocmd FocusLost * :silent !fcitx-remote -c')
-- vim 中 buffer 是打开的文件，这是位为了以防万一
vim.api.nvim_command('autocmd BufCreate * :silent !fcitx-remote -o')
vim.api.nvim_command('autocmd BufEnter * :silent !fcitx-remote -o')
vim.api.nvim_command('autocmd BufLeave * :silent !fcitx-remote -o')
