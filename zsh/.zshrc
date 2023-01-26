# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
 source /usr/share/zsh/manjaro-zsh-prompt
fi

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

alias ll="ls -al"
alias time="/usr/bin/time"

# git 
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gcl="git clone"
alias gl="git log --graph --pretty=oneline"

# CompComp
alias clangs="clang -S -emit-llvm"
alias llcarm="llc -march=arm"
alias agcc="armv7l-linux-gnueabihf-gcc -march=armv7ve"

# neovim
alias vim="nvim"
alias qim="~/.run_nvim.sh"

# vivado
alias vivado="cd /home/thysrael/learn/sem5/IEArch/.vivadoLog/ && vivado"
source /etc/profile.d/rvm.sh
# source /tools/Xilinx/Vitis/2019.2/settings64.sh
source /tools/Xilinx/Vivado/2019.2/settings64.sh 

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
