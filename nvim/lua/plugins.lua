-- 插件管理器主要有 vim-plug 和 packer.nvim 两种
-- packer.nvim 更加后起，而且更加适合 lua 和 neovim
-- :PackerSync 命令用于更新插件

-- 不知道这里的 packer 是啥
-- 似乎是 ' ~/.local/share/nvim/site/pack/packer/...' 路径
local packer = require("packer")

-- 插件的列表
-- 应用某个插件的格式是 "use 'name/repo'"
packer.startup(
	function(use)
		-- Packer 可以管理自己本身
		use 'wbthomason/packer.nvim'

		-- 插件列表...
		--------------------- colorschemes --------------------
		-- OceanicNext 
		use('mhartington/oceanic-next')
		-- tokyonight 
		use("folke/tokyonight.nvim")

		------------------------ plugins ----------------------
		-- nvim-tree 侧边栏文件树
		use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
		-- bufferline 顶部 buffer
		use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
		-- lualine 底部栏
		use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
		use("arkav/lualine-lsp-progress")
		-- telescope 模糊搜索
		use ({ 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } })
		-- telescope extensions
		-- 查询环境变量
		use ({ "LinArcX/telescope-env.nvim" })
		-- 查询项目
		use ({ "ahmedkhalf/project.nvim" })
		-- dashboard-nvim nvim 首页
		use("glepnir/dashboard-nvim")
		-- 便捷终端，可以用 'alt =' 打开一个持久的终端 --
		use("skywind3000/vim-terminal-help")
		-- tree-sitter 解析器生成器工具和增量解析库, run 表示会在更新完执行这条指令
		-- :TSInstallInfo 可以查看有哪些语言 parser, 同时看它们是否被安装
		-- :TSInstall <language_to_install> 用于安装 parser
		-- :TSUninstall <language_to_uninstall> 用于卸载 parser
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		-- Comment
		use("numToStr/Comment.nvim")
		-- nvim-autopairs
		use("windwp/nvim-autopairs")
		--------------------- LSP --------------------
		-- 这个部分没有被使用 --
		use({ "williamboman/mason.nvim" })
		use({ "williamboman/mason-lspconfig.nvim" })
		-- Lspconfig
		use({ "neovim/nvim-lspconfig" })
		-- coc --
		use ({ 'neoclide/coc.nvim', branch = 'release' })
		-- indent blank line 缩减线
		use "lukas-reineke/indent-blankline.nvim"
	end
)



