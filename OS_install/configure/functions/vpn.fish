function vpn --wraps='cd ~/VPN;sudo ./clash -d .' --description 'alias vpn cd ~/VPN;sudo ./clash -d .'
  cd ~/VPN;sudo ./clash -d . $argv; 
end
