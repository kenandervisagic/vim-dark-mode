alias e1="XDG_CONFIG_HOME=/nvim/.conf_cpp1 nvim"
alias n1="XDG_CONFIG_HOME=/nvim/.conf_cpp3 nvim"
export PATH=/opt1/bin:$PATH
GIT_PS1_DESCRIBE_STYLE="contains"
GIT_PS1_SHOWCOLORHINTS="y"
GIT_PS1_SHOWDIRTYSTATE="y"
GIT_PS1_SHOWSTASHSTATE="y"
GIT_PS1_SHOWUNTRACKEDFILES="y"
GIT_PS1_SHOWUPSTREAM="verbose name git"
PROMPT_COMMAND='__git_ps1 "╭─ \w" "\n╰$(if test $? = 0;then echo "\$";else echo "\[\e[31m\]\$\[\e[0m\]";fi) " " ⎇  %s"'
cp -u /nvim/.ycm_extra_conf.py $HOME/.ycm_extra_conf.py 
cp -u /opt1/.tmux.conf $HOME/.tmux.conf
#cp -u /opt1/.inputrc $HOME/.inputrc

fix_kbd() {
  if [ "$XDG_SESSION_TYPE" == "wayland" ]; then
    gsettings set org.gnome.desktop.input-sources sources "[('xkb','us'),('xkb','ba')]"
    gsettings set org.gnome.desktop.input-sources xkb-options "['grp:alt_shift_toggle,caps:swapescape']"
    echo "wayland"
    return
  fi
  [ "$XDG_SESSION_TYPE" == "x11" ] && setxkbmap -layout "us,ba" -option "grp:alt_shift_toggle,caps:swapescape,keypad:pointerkeys" && echo "x11" && return
  sudo echo "cli swap escape caps"
  sudo dumpkeys | sed 's/CtrlL_Lock/Escape/' | sudo loadkeys
}


open_cloonix_pcap() {
  PCAP=$(find /opt1/cloonix_data -name "*.pcap" | fzy)
  wireshark-gtk -k -i <(tail -f -c +0 "$PCAP" )
}

inject() {
  stty_orig=`stty -g`
  stty -echo
  perl -e 'ioctl(STDIN, 0x5412, $_) for split "", join " ", @ARGV' "$@"
  stty $stty_orig
}

search_history() {
  hline=$(cat ~/.bash_history | sort | uniq | fzy)
  inject $hline
}



export PATH=$HOME/program1/bin:$HOME/.local/bin:$PATH
export TERM=xterm-256color
alias vi=vis
alias v=vis
bind -m vi-insert "\C-l":clear-screen
bind -x '"\C-r": search_history'


