-- 接下来的配置都是为了插件服务的

-- 关闭模式显示，因为之后会有模式显示插件
vim.o.showmode = false

-- 始终有 tabline，因为之后会有 tabline 插件
vim.o.showtabline = 2

-- 当存在多个 buffer 的时候，需要有这个东西，不然会报错
vim.o.hidden = true

-- 最左侧留出一列，用于状态显示
vim.wo.signcolumn = "yes"
