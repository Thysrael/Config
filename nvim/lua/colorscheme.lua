-- 主题配置文件

-- 选定的主题
local colorscheme = "tokyonight"
-- OceanicNext
-- tokyonight
-- 将主题设置为 colorscheme
-- lua 中 '..' 表示字符串拼接
-- pcall 用于判断命令状态，status_ok 表示成功设置主题
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

-- 如果没有成功，那么就报错
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " 没有找到！")
	return
end
