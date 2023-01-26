-- https://github.com/windwp/nvim-autopairs
local status, autopairs = pcall(require, "nvim-autopairs")
if not status then
  vim.notify("没有找到 nvim-autopairs")
  return
end
autopairs.setup({
  check_ts = true,
  ts_config = {
    lua = { "string" }, -- it will not add a pair on that treesitter node
    javascript = { "template_string" },
    java = false, -- don't check treesitter on java
  },
})
