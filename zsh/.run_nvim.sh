# 这个脚本用于在一个新的终端里启动 neovim
konsole --hide-menubar --hide-tabbar -e zsh -c "nvim $1" &>/dev/null& 