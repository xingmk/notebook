# Notes: **Install Manjaro**   

## Author：*xmk*   
<!-- TOC Redcarpet -->

+ [概括:](#概括)
    * [需要准备的东西](#需要准备的东西)
    * [开始安装](#开始安装)
    * [更换到国内的镜像源](#更换到国内的镜像源)
    * [进行一些配置](#进行一些配置)
        - [选择一个好用的编辑器,可以安装neovim or code](#选择一个好用的编辑器-可以安装neovim-or-code)
        - [添加pacman高亮](#添加pacman高亮)
        - [Shell: fish](#shell-fish)
        - [在终端设置快捷方式](#在终端设置快捷方式)
        - [WM: i3](#wm-i3)
        - [terminal:alacritty](#terminal-alacritty)
        - [修改i3的其他配置](#修改i3的其他配置)
        - [修改一些键位](#修改一些键位)
        - [美化一下终端](#美化一下终端)
        - [中文输入法的安装配置](#中文输入法的安装配置)
        - [推荐一些好用的app](#推荐一些好用的app)
        - [MySQL的安装与配置](#mysql的安装与配置)
                * [初始化MySQL](#初始化mysql)
                * [开机启动MySQL服务](#开机启动mysql服务)
                * [使用MySQL修改密码](#使用mysql修改密码)
                * [可为MySQL设置启动快捷键](#可为mysql设置启动快捷键)
    * [后续添加的一些东西](#后续添加的一些东西)

<!-- /TOC -->

>  shell: fish  
>  WM: i3wm  
>  terminal: alacritty

# 概括:

1. 需要准备的东西 
2. 开始安装 Manjaro Linux
3. 更换到国内的镜像源 
4. 进行一些安装与配置   
  (shell:fish WM:i3 Terminal: alacritty) 
5. 美化一下终端
6. 对键位进行一些修改
7. 中文输入法的安装配置
8. 推荐一些好用的app
9. MySQL的安装与配置
10. 后续添加的一些东西 

## 需要准备的东西

 1. 在[Manjaro官网](https://manjaro.org/get-manjaro/)下载iso镜像
> 可下载gnome版本

 2. 制作启动盘 (即将镜像刻入事先准备好的U盘中)
> Windows：可选择 [Rufus](https://rufus.ie/zh/) 进行刻入   
> linux: 可选择 [dd](https://www.runoob.com/linux/linux-comm-dd.html)  

 3. 在电脑的UEFI中找到Secure boot并关闭
> 每个电脑进入UEFI的方式有异,需要自己上网搜索

## 开始安装

1. 从U盘启动系统 
2. 连上wife或插上网线
3. 跟着桌面的安装窗口开始安装
4. 安装结束后reboot
 
## 更换到国内的镜像源

**首先执行:**
 
`   sudo vi /etc/pacman.conf `

> 加上以下内容：
 
```
【archlinuxcn】
 SigLevel = Never
 Server = https: //mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
```

> 保存并退出  
> 后在终端中执行
   
```
 sudo pacman-mirrors -c China
 sudo pacman -Syyu
 reboot
```

## 进行一些配置 

### 选择一个好用的编辑器,可以安装neovim or code  

>因为我选择的是nvim所以接下来都是nvim编辑   
>并且我建议你使用vim or neovim 
>(虽然code适合新入手 但nvim真的很好用)
>如果你是code 把nvim替换成code就行

`sudo pacman -S vim`

> or

`sudo pacman -S code`

### 添加pacman高亮
   
` sudo vim /etc/pacman.conf`    
> *大约在36行左右将color的注释删去*
    
### Shell: fish 
> 如果不喜欢fish的话 这一步可以省略

1. 安装fish
` sudo pacman -S fish`

2. 切换shell-->fish
` chsh -s /usr/bin/fish`  

3. 安装fish插件
` curl -L https://get.oh-my.fish | fish`   
4. 你可以使用fish_config修改主题或者命令提示符   
` fish_config`
 
> 你也能使用 omf install XXX 进行下载安装）   
> 具体主题类型可以在网上搜索

###  在终端设置快捷方式
> **以将c-->clear为例子**

1. c 映射为 clear    
`alias c clear`   
 
2. 将c函数保存  
` funcsave c` 
   
> **help可以查看更多有关shell:fish 的用法**`$:help`   

### WM: i3

1. 安装 i3WM  
`sudo pacman -S i3` 
        
2. 进入i3WM
>  1. 在gnome界面中注销用户，
>  2. 在登陆界面右下脚有个设置符号点击并选择i3并登陆
>  3. 可根据自己喜好选择win or alt 哪一个键位作为super建. 
>  4. 若选择之后后悔了也可以在后面的要讲的i3配置文件中更改。

3. 进入 i3后

 `$mod+enter ` --> start a terminal   
 `$mod+q `     --> close a terminal

4. 字体调节
 
` $: vim ~/.Xresources`   
> 输入   

   ` Xft.dpi: 180 `  
   
> 重启之后即可        

Or

`Ctrl + shfit + =` --> 增大字体   
`ctrl + -`         --> 减小字体



### terminal:alacritty

1. 安装:
` sudo pacman -S alacritty`    

2. 修改开启的默认terminal   
` vim ~/.config/i3/config`   
        
> 在 #start a terminal 下    
> 将 exec 后更改为 alacritty    
> 即:   

`  bindsym $mod+Return exec alacritty`    
    
> 保存并推出   
> 且需要

` super+shift+c` --> 重新加载配置文件   
 `super+shift+r` -->   重新启动i3
 

3. 更改alacritty字体大小

> 首先将alacritty的配置文件转移到config中      

` cp /usr/share/docalacritty/example/alacritty.yml ~/.config/alacritty`

> 其次编辑alacritty的配置文件      

  `vim ~/.config/alacritty/alacritty.yml` 

> 将 point size 修改      

 **size：10.0**  
 
 
### 修改i3的其他配置

> 所有i3配置都在.config目录的i3中

 ` vim ~/.config/i3/config`      

> 可以按照自己的习惯来  
> 详细的i3使用方法


    [i3官网](https://i3wm.org/)

        
### 修改一些键位

1. 首先安装xorg:  
 
`sudo pacman -S xorg`
    
2. 导出键位位置文件

`xmodmap -pke > ~/.xmodmap`

3. 编辑 *~/.xmodmap* 文件即可


###  美化一下终端

1. #### 可以在i3/config中加入

 new_window lpixel （关闭窗口的蓝色边框）   
 gaps inner 10      (增加窗口边框）        
                
   
2. #### 使用 variety 添加壁纸

` sudo pacman -S variety`  

3. #### 更换透明terminal

> 在alacritty/alacritty.yml中进行更改

` vim .config/alacritty/alacritty.yml`
` background_opacity= 0.8`      

4. #### 下载picom渲染器

` sudo pacman -S picom`

> 还有更多美化方法请自行在网上查找

### 中文输入法的安装配置

1. 如果你有fcitx 请先执行

    ` sudo pacman -Rsc fcitx`      
        
2. 下载 fcitx5 

     `  sudo pacman -S fcitx5-im fcitx5-chinese-addons fcitx5-pinyin-zhwiki`
      
3. 配置环境变量
```

   vim ~/.pam_environment

   GTK_IM_MODULE DEFAULT=fcitx
   QT_IM_MODULE  DEFAULT=fcitx
   XMODIFIERS    DEFAULT=\@im=fcitx
   SDL_IM_MODULE DEFAULT=fcitx
```

### 推荐一些好用的app
> 具体功能 自行上网查找
```sh
1. dmenu 
        
 sudo pacman -S dmenu 

2. yay 
        
 sudo pacman -S yay

3. 网易云
        
 sudo pacman -S netease-cloud-music
        
4. wechat 

 yay -s deepin-wine-wechat 

5. Pycharm

 yay -S pycharm
   
6. 有道词典

 yay -S youdao-dict

7. Chromium

 sudo pacman -S chromium
 
8. Google-chrome

 yay -S google-chrome
 
```

### MySQL的安装与配置

1. #### 安装

 ` sudo pacman -S mysql`   

2. #### 配置
    
##### 初始化MySQL

    `mysqld --initalize --user=mysql --basedir=/usr --datadir=/var/lib/mysql` 

##### 开机启动MySQL服务

```
 systemctl enable mysqld.service
 systemctl daemon-reload
 systemctl start mysqld.service
```
##### 使用MySQL修改密码
    
  `mysql -u root -p 'password'`   
  `AlTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'NEW_PASSWORD'`   

##### 可为MySQL设置启动快捷键

eg:
```
     $:alias ms "mysql -u root -p'password'
     $:funcsave ms
```

> 之后当你输入ms就可以快速打开mysql
     
     
## 后续添加的一些东西
     
     
