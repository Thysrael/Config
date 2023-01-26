--  进行快捷键的配置
--  配置方式一般是 vim.api.nvim_set_keymap('模式', '按键', '映射为', 'options')

-- 这里主要是利用 lua 语法方便之后的书写
local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = {noremap = true, silent = true }

-- 设置前缀键为空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 将 i 映射为 n
map("n", "i", "a", opt)

-- 选中全部文本
map("n", "<C-a>", "ggVG", opt)

-- 窗口管理功能
-- 取消 s 默认功能
map("n", "s", "", opt)

-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)

-- 关闭当前
map("n", "sc", "<C-w>c", opt)

-- 关闭其他
map("n", "so", "<C-w>o", opt)

-- Ctrl + hjkl  窗口之间跳转
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)

-- 左右比例控制
map("n", "<A-Left>", ":vertical resize +2<CR>", opt)
map("n", "<A-Right>", ":vertical resize -2<CR>", opt)
map("n", "s,", ":vertical resize -20<CR>", opt)
map("n", "s.", ":vertical resize +20<CR>", opt)

-- 上下比例
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
map("n", "<A-Down>", ":resize -2<CR>", opt)
map("n", "<A-Up>", ":resize +2<CR>", opt)

-- 等比例
map("n", "s=", "<C-w>=", opt)

-- Terminal相关
-- space + t 在底部打开终端
-- 现在注释掉了，是因为安装了插件后，可以使用 'Alt' + '=' 的方式打开终端
map("n", "<leader>t", ":terminal<CR>", opt)

-- space + vt 在侧边打开终端
map("n", "<leader>vt", ":vsp | terminal<CR>", opt)

-- 按 Esc 可以在终端模式下退回 normal
map("t", "<Esc>", "<C-\\><C-n>", opt)

-- 终端模式切换窗口
map("t", "<C-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<C-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<C-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<C-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- visual 模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- 上下滚动浏览
-- alt j / alt + k  只移动 4 行，默认移动半屏
map("n", "<A-j>", "4j", opt)
map("n", "<A-k>", "4k", opt)

-- bufferline
-- 左右 Tab 切换
map("n", "<leader>h", ":BufferLineCyclePrev<CR>", opt)
map("n", "<Tab>", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
map("n", "<leader>c", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- Telescope
-- 查找文件
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)

-- 插件快捷键
local pluginKeys = {}

-- nvim-tree
-- alt + m 键打开关闭tree
map("n", "<C-m>", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  -- 分屏打开文件
  { key = "v", action = "vsplit" },
  { key = "h", action = "split" },
  -- 显示隐藏文件
  { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
  { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
  -- 文件操作
  { key = "<F5>", action = "refresh" },
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "s", action = "system_open" },
}

-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
  i = {
    -- 上下移动
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<Down>"] = "move_selection_next",
    ["<Up>"] = "move_selection_previous",
    -- 历史记录
    ["<C-n>"] = "cycle_history_next",
    ["<C-N>"] = "cycle_history_prev",
    -- 关闭窗口
    ["<C-c>"] = "close",
    -- 预览窗口上下滚动
    ["<C-p>"] = "preview_scrolling_up",
    ["<C-u>"] = "preview_scrolling_down",
  },
}

pluginKeys.comment = {
  -- Normal 模式快捷键
  toggler = {
    line = "gcc", -- 行注释
    block = "gbc", -- 块注释
  },
  -- Visual 模式
  opleader = {
    line = "gc",
    bock = "gb",
  },
}

return pluginKeys
