# Notes

#  **Install Manjaro**   

##  Author：*xmk*   

>  shell: fish  
>  WM: i3wm  
>  terminal: alacritty

# 概括:

1. 准备
2. 安装
2. 换源
3. 配置
4. 美化
5. 修改键位
6. fcitx5 中文输入法安装配置
7. MySQL
8. app推荐
9. 后续

## 准备

 1. 在[Manjaro官网](https://manjaro.org/get-manjaro/)下载iso镜像
> 可下载gnome版本

 2. 制作启动盘 (即将镜像刻入事先准备好的U盘中)
 
> Windows：可选择 [Rufus](https://rufus.ie/zh/) 进行刻入   
> linux: 可选择 [dd](https://www.runoob.com/linux/linux-comm-dd.html)  
 3. 在电脑的UEFI中找到Secure boot并关闭
 
> 每个电脑进入UEFI的方式有异,需要自己上网搜索

## 安装

1. 从U盘启动系统 
 
3. 连上wife或插上网线
 
5. Install，安装结束后reboot

## 换源

**首先**
 
` sudo vi /etc/pacman.conf `

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

## 配置

### 选择编辑器,可以安装vim or code  

>我选择的是vim所以接下来都是vim编辑   
>并且我建议你使用vim or neovim  

`sudo pacman -S vim`

> or

`sudo pacman -S code`

### 添加pacman高亮
   
` sudo vim /etc/pacman.conf`    
> *大约在36行左右将color的注释删去*
    
### fish

```
 sudo pacman -S fish
 chsh -s /usr/bin/fish  
 curl -L https://get.oh-my.fish | fish
 fish_config
      
> 你可以使用fish_config修改主题或者命令提示符

Or    

> 你也能使用 omf install XXX 进行下载安装）
```

###  设置终端快捷键

```
> c 映射为 clear   
 alias c clear   
 
 >将c函数保存  
 funcsave c 
   
```
#### 如果你想了解更多有关 shell:fish 的用法

`$:help`   

###  i3
    
`sudo pacman -S i3` 
        
#### 进入i3WM

>    在gnome界面中注销用户，在登陆界面右下脚有个设置符号从次选择i3并登陆
>    可根据自己喜好选择win or alt 哪一个键位作为super建。若选择之后后悔了
>    也可在后面的配置文件中更改。


### 进入 i3后

#### i3设置前

 `$mod+enter ` --> start a terminal   
 `$mod+q `    --> close a terminal

#### 字体调节

      你可以：

     $: vim ~/.Xresources
     Xft.dpi: 180 (可根据实际情况调节）
        
     reboot    

Or

     Ctrl+shfit+= —> 增大字体
     ctrl+ - —> 减小字体



#### 使用alacritty

     sudo pacman -S alacritty
     vim ~/.config/i3/config
        
        修改开启的默认terminal
        
##### 在 #start a terminal 下
      将 exec 后更改为 alacritty
  即

     bindsym $mod+Return exec alacritty 
    
    保存并推出
    且需要

     super+shift+c 重新加载配置文件
     super+shift+r 重新启动i3

##### 更改alacritty字体大小

     cp /usr/share/docalacritty/example/alacritty.yml ~/.config/alacritty
     vim ~/.config/alacritty/alacritty.yml

      将 point size 修改 
        size：10.0

#### 更改更多i3配置

     所有i3配置都在.config目录的i3中

     vim ~/.config/i3/config      
   
       (You can make it like what you like   
        and you can add something what you like）

#### 详细的i3使用方法

    [i3WM](https://i3wm.org/)

        
### 修改键位






### 界面美化

#### 你可以在i3/config中加入

      new_window lpixel （关闭窗口的蓝色边框）
      gaps inner 10  (增加窗口边框）        
                
            （更多美化方法请自行查找）
   
#### variety 更换桌面壁纸

      sudo pacman -S variety

#### 更换透明terminal

1. 在alacritty/alacritty.yml中进行更改

       background_opacity= 0.8 

2. 下载picom渲染器

       sudo pacman -S picom

### 配置中文输入法 fcitx

1. 如果你有fcitx 请先执行

       sudo pacman -Rsc fcitx
        
2. 下载 fcitx5 

       sudo pacman -S fcitx5im fcitx5-Chinese-addons fcitx5-pinyin-zhwiki
      
3. 配置环境变量

       vim ~/.pam_environment

       GTK_IM_MODULE DEFAULT=fcitx
       QT_IM_MODULE  DEFAULT=fcitx
       XMODIFIERS    DEFAULT=\@im=fcitx
       SDL_IM_MODULE DEFAULT=fcitx


### MySQL的安装与配置

#### 安装

     sudo pacman -S mysql

#### 配置
    
##### 初始化MySQL

     mysqld --initalize --user=mysql --basedir=/usr --datadir=/var/lib/mysql

##### 开机启动MySQL服务

```
 systemctl enable mysqld.service
 systemctl daemon-reload
 systemctl start mysqld.service
```
##### 使用MySQL修改密码
    
     mysql -u root -p '密码'
     AlTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'NEW_PASSWORD'

##### 可为MySQL设置启动快捷键

eg:

     $:alias ms "mysql -u root -p'password'
     $:funcsave ms

     之后当你输入ms就可以快速打开mysql

### Other useful things
```
1. dmenu 
        
 sudo pacman -S dmenu 

2. yay 
        
 sudo pacman -S yay

3. 网易云
        
 sudo pacman -S netease-cloud-music
        
4. 微信

 yay -S deepin-wine-wechat 

5. Pycharm

 yay -S pycharm
   
6. 有道词典

 yay -S youdao-dict

7. Chromium

 sudo pacman -S chromium-
```

