# **Install Manjaro**   
> Author:

## PREPARE
1. [Manjaro官网](https://manjaro.org/get-manjaro/) download .ios 

2. Make U-disk 
> Windows： [Rufus](https://rufus.ie/zh/)   
> linux: [dd](https://www.runoob.com/linux/linux-comm-dd.html)  

3. Close Secure boot in UEFI

## INSTALL 
1. Start OS from U-disk
2. Connect wife
3. Start Installing
4. Reboot
 
## CHANGE THE MIRRORS TO CHINA 
**FIRST:**
`sudo vi /etc/pacman.conf `
 
**ADD** 
```
【archlinuxcn】
 SigLevel = Never
 Server = https: //mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
```
> keep and exit  
   
**EXECUTE** 
```
- sudo pacman-mirrors -c China
- sudo pacman -Syyu
- reboot
```

## DO SOME CONFIG
### Install a nice editor

`sudo pacman -S vim`

### Add pacman hight light
   
` sudo vim /etc/pacman.conf`    
> Delete the color commit
    
### Shell: fish 
> Can be omitted

1. Install fish:  
` sudo pacman -S fish`

2. Change shell to fish:  
` chsh -s /usr/bin/fish`  

3. Install fish extension:  
` curl -L https://get.oh-my.fish | fish`   

4.U can use this command to change theme:  
`fish_config`
 
> **help** Learn more skills about shell:fish `$:help`   
> You can also install theme by omf    

### WM: i3
1. Install i3WM:  
`sudo pacman -S i3` 
        
2. Go to i3WM:
>  1. Log out your account 
> 2. In the lower right foot landing interface has a setting symbol click and select the i3 and landed

1. Adjust the font:  
`vim ~/.Xresources`   
`Xft.dpi: 180 `  
   
### terminal:alacritty

1. Install:  
` sudo pacman -S alacritty`    

2. 修改开启的默认terminal   
` vim ~/.config/i3/config`   

**change**:  
`bindsym $mod+Return exec alacritty`    
    
**next**:  
` super+shift+c` -->  reload i3-config   
` super+shift+r` -->  restarti3
 

1. Add alacritty-config:  
` cp /usr/share/docalacritty/example/alacritty.yml ~/.config/alacritty`

2. Do some change:  
` vim ~/.config/alacritty/alacritty.yml` 

3. **size：10.0**  
 
### Modify the i3-config
` vim ~/.config/i3/config`      

### Modify keyboard
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
` sudo pacman -S variety`  
 
3. ` picom` (Display wallpaper)   
` sudo pacman -S picom`

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
