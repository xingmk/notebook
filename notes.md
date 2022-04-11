



创建 git 仓库:

mkdir install
cd install
git init 
touch README.md
git add README.md
git commit -m "first commit"
git remote add origin git@gitee.com:bestxmk/install.git
git push -u origin "master"

已有仓库?

cd existing_git_repo
git remote add origin git@gitee.com:bestxmk/install.git
git push -u origin "master"




# Manjaro package management

## install
sudo pacman -S <package>

## fresh
<!--fresh  -->
sudo pacman -Sy 
sudo pacman -Syy 
 sudo pacmam -Su
<!--force fresh-->
 sudo pacman -Syu
    sudo pacman -Syyu

<!--search -->
sudo pacman -Ss <package>

sudo pacman -Qs 

<!--checkout apps-->
sudo pacman -Q | wc -l 
sudo pacman -Qe | wc -l 
sudo pacman -Qeq | wc -l 

sudo pacman -Qdt  
sudo pacman -Qdtq  

<!--delete-->
sudo pacman -R <package>
sudo pacman -Rs <package>
  sudo pacman -Rns <package>

sudo pacman -R $(pacman -Qdtq)

# Debian package management
 
```sh
sudo apt update && sudo apt upgrade
sudo apt install package-name
sudo apt purge pkg-name
sudo aptitude

apt-mark showmanual | cat
apt search string
aptitude search string
apt-cache search string
apt-file search file-path
```
输出thml
 zcat gittutorial.7.gz | groff -mandoc -Thtml

#markdown

1.markdown-cheatsheet
2.markdown-table-mode
3.markdown-preview.nvim
4.markdown-vimwiki
5.markdown-visual

#vim

vimtutor

# git && gitee

man gittutorial

## Config
 git config --global user.email "xingmk.@gmail.com"
 git config --global user.name "bestxmk"
 git push 
 
## Add
1. git add <file>
2. git commit -m ""
%% 3. git pusll origin master
3. git push origin master 

## Delete
1. git rm <file>
2. git commit -m "file"
3. git push 

## Update
1. git add <file>
2. git commit -m "explation"
3. git pull
4. git push

## Clone
1. git clone https://example
 
## Rename 
1. git remote rename origin <name>
      name: origin-->name
 
# gcc

gcc -o file file.c
gcc source.c -Wall executable

# Makefile

https://cs6.swfu.edu.cn/~wx672/lecture_notes/linux/c/c_dev.html

# Misc configuration

## sound

pulsemixer

## Networking

nmtui

## keynav

~/.keynavrc

## image processing (imagemagick)

convert, identify

## terminal operations (tmux)

- close a bash : Ctrl-d
- in tmux: `ctrl-a n` or  `ctrl-a 1234`

## Window operations (stumpwm)

change big window : super N/P
 

# VPN:

1. ~/.local/clash/

```sh
scp -rp ~/.local/clash  baijingzhe@192.168.219.112:.local/
scp ~/.config/qutebrowser/config.py  baijingzhe@192.168.219.112:.config/qutebrowser/
scp ~/.local/bin/clash.sh  baijingzhe@192.168.219.112:.local/bin/
```

2.  `clash.sh`

3. restart qutebrowser : Ctrl-Shift-r

# File format conversion

## xlsx -> csv

`xlsx2csv input.xlsx > output.csv`

## doc -> pdf

`pdf myfile.doc`

# asciiart

- (asciiflow.io)(https://asciiflow.com/#/)

sync  优先拷

watch the mp4:   mpv videoname 

the tutor of the order:  curl cheat.sh/command
the tutor of the order:  cht.sh order

ypv webside   :direct open the web

## tar && gzip
tar xvf :  解包
tar cvf :  打包

压缩 ： gizp filename
解压 :  gzip -d filename.gz

extract a tgz (tar.gz) file:
打开压缩包：tar xvfz filename.tar.gz

# create a new archive with compression
tar zcf hw4.tgz hw4


make二维码:
 curl qrenco.de/内容

make a pdf file in qutebrwser:
 print -f (path) name.pdf

separate a new one from the pdf:  
pdftk  pdffile.pdf cat page  output othername.pdf
unite some pdf to one pdf:
pdftk  pdffile.pdf  uitepdf cat output all.pdf
qiv 查看图片
cht.sh 命令  see the command
ctrl a [  复制
ctrl a ]  粘贴 {bash中}
web中 复制选择中按 y 后在web中 ctrl v  就可粘贴

make a file like word :

less file.pdf > file.md
vim file.md 
pandoc file.md
pandoc file.md > file.html

 curl https://voice.baidu.com/act/newpneumonia/newpneumonia/?from=osari_pc_3 | grep '<script>require.config' > data   :the homework of dai 
 
# to write a python program

```sh
vim hello.py

chmod +x hello.py

./hello.py
```
record flash

ttyrec

# HOW TO RECORDING

   1. close all the terminal windows
   2. open a new terminal without tmux
   3. start recording (`ttyrec`)
   4. start tmux
   5. start my script.


