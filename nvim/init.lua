-- 加载的是 ~/.config/nvim/lua/basic 中的内容
-- 也就是一般加载项目根目录下 lua 文件夹中的内容

-- basic 是基本的配置
require('basic')

-- keybind 是快捷键映射
require('keybind')

-- enhance 是为了配合插件进行的配置
require('enhance')

-- plugins 是插件管理文件
require('plugins')

-- colorscheme 是主题配置文件
require('colorscheme')

-- 插件配置
require("plugin-config.nvim-tree")
require("plugin-config.bufferline")
require("plugin-config.lualine")
require("plugin-config.telescope")
require("plugin-config.dashboard")
require("plugin-config.project")
require("plugin-config.nvim-treesitter")
require("plugin-config.nvim-autopairs")
require("plugin-config.comment")
require("plugin-config.coc")
-- 内置LSP
-- require("lsp-setup")

