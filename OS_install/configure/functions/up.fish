function up --wraps='sudo pacman -Syyu' --description 'alias up sudo pacman -Syyu'
  sudo pacman -Syyu $argv; 
end
