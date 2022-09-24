function clean --wraps='sudo pacman -Scc && sudo pacman -R perl-io-tty' --wraps='sudo pacman -Scc && sudo pacman -R  && sudo journalctl --vacuum-size-50M' --description 'alias clean sudo pacman -Scc && sudo pacman -R  && sudo journalctl --vacuum-size-50M'
  sudo pacman -Scc && sudo pacman -R  && sudo journalctl --vacuum-size-50M $argv; 
end
