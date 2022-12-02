# **Install Manjaro** 
> Author: Xingmk

## PREPARE
1. Download manjaro.ios file   
Address: [manjaro.ios](https://manjaro.org/download/) 

2. Make U-disk   
Tool:[Rufus](https://rufus.ie/zh/)   
 
3. Go to ur UEFI and close these chooses    
- **Secure boot**  
- QuickBoot/FastBoot


## INSTALL 
1. Start OS from U-disk
2. Connect WIFE
3. Start Installing
4. Reboot
 
### Question:
- #### Maybe your wife cann't work
 
1. Connect the wire-net  
`sudo pacman -S yay`  
2. Check your wireless network card model and download the corresponding driver  
`yay -S ...` 

> eg: if your wireless network card is rtl18821ce  
> `yay -S rtl18821ce-dkms-git` 
3. Check your linux kernel and download the corresponding headers   
`sudo pacman -S linux000-headers` 
 
>eg: if your linux kernel is 4.19   
>`sudo pacman -S linux419-headers` 

4. Restart driver  
`sudo modprobe network-card-model` 
> eg: 8821ce  
> `sudo modprobe 8821ce` 

## CHANGE THE MIRRORS TO CHINA 
**FIRST:**  
`sudo nano /etc/pacman.conf `  
or   
`sudo vi /etc/pacman.conf` 
 
**ADD THESE CODES IN IT**  
```
【archlinuxcn】
 SigLevel = Never
 Server = https: //mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
```
> Keep and exit  

**EXECUTE** 
```sh
1. sudo pacman-mirrors -c China
2. sudo pacman -Syyu
3. reboot
```

## DO SOME CONFIG
### Install a nice editor
> Neovim:  
 `sudo pacman -S neovim`  
 VScode:  
 `sudo pacman -S code` 
>

### Add pacman hight light
   
> Delete the color commit    
`sudo vim /etc/pacman.conf`    
    

### Shell: fish 

1. Install fish:  
`sudo pacman -S fish`

2. Change shell to fish:  
`chsh -s /usr/bin/fish`  

3. Install fish extension:  
`curl -L https://get.oh-my.fish | fish`   

4. U can change theme by this command:  
`fish_config`
 

### WM: i3
1. Install i3WM:  
`sudo pacman -S i3` 
        
2. Go to i3WM:
>  1. Log out your account 
> 2. In the lower right foot landing interface has a setting symbol click and select the i3 and landed

   
### terminal:alacritty

1. Install:  
`sudo pacman -S alacritty`    

2. Set default terminal:   
`vim ~/.config/i3/config`   

**change**:  
`bindsym $mod+Return exec alacritty`    
**next**:  
`super+shift+c` -->  reload i3-config   
`super+shift+r` -->  restart i3  
`super+shift+e` -->  exit i3   
 
### Configure them
1. Add alacritty config file:  
`cp /usr/share/docalacritty/example/alacritty.yml ~/.config/alacritty`

2. Do some change:  
`vim ~/.config/alacritty/alacritty.yml` 

3. **size：10.0**  
 
4. Modify the i3-config  
`vim ~/.config/i3/config`      

### Modify keyboard
> For me:   
> Swapped CapsLock and Control_L
1. Install firstly xorg:  
`sudo pacman -S xorg`
    
2. The export file:  
`xmodmap -pke > ~/.xmodmap`

3. Edit it:  
`~/.xmodmap` 


### Beautify the terminal

1. Add some in `i3-config`  
```
new_window lpixel    
gaps inner 10       
```
2. ` variety ` (Add wallpaper)  
`sudo pacman -S variety`  
 
3. ` picom` (Display wallpaper)   
`sudo pacman -S feh`  
`sudo pacman -S picom`

### The installation of the Chinese input method configuration
1. If you have fcitx  
` sudo pacman -Rsc fcitx`      
        
2. Download fcitx5   
` sudo pacman -S fcitx5-im fcitx5-chinese-addons fcitx5-pinyin-zhwiki`
      
3. Configure the environment variables  
`vim ~/.pam_environment`  
```
   GTK_IM_MODULE DEFAULT=fcitx
   QT_IM_MODULE  DEFAULT=fcitx
   XMODIFIERS    DEFAULT=\@im=fcitx
   SDL_IM_MODULE DEFAULT=fcitx
```


## Other useful app
```sh
1. dmenu 
 sudo pacman -S dmenu 

2. yay yarn nodejs ccls 
 sudo pacman -S yay yarn nodejs ccls

3. music
 sudo pacman -S netease-cloud-music
   
4. chromium
 sudo pacman -S chromium

5. zoxide
 fisher install jethrokuan/z 
```

## MySQL
**Install**    
`sudo pacman -S mysql`   

### Initialize MySQL
`mysqld --initalize --user=mysql --basedir=/usr --datadir=/var/lib/mysql` 

### Auto start MySQL service
```
systemctl enable mysqld.service
systemctl daemon-reload
systemctl start mysqld.service
```

### Change the password
`mysql -u root -p 'password'`   
`AlTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'NEW_PASSWORD'`   


sudo pacman -S sof-firmware

curl cip.cc
