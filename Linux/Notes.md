# Linux 下的文件

| / 下的文件 | 含义           |
| :---:      | :---:          |
| <++>       | <++>           |
| bin        | 可执行文件     |
| boot       | 系统阅读并启动 |
| dev        | 硬件           |
| etc        | 系统配置文件   |
| home       | 家目录         |
| mnt        | U盘，硬盘显示  |
| proc       | 所有进程       |
| root       | 管理员         |
| srv        | 服务文件       |
| sys        | 系统文件夹     |
| tmp        | 临时文件       |
| usr        | 装载软件       |
| var        | 程序的缓存     |

# Manjaro package management

## install
`sudo pacman -S <package>`

## fresh
```sh
sudo pacman -Sy 
sudo pacman -Syy 
sudo pacmam -Su
sudo pacman -Syu
sudo pacman -Syyu 
```
## search 
```sh
sudo pacman -Ss <package>
sudo pacman -Qs 
sudo pacman -Q | wc -l 
sudo pacman -Qe | wc -l 
sudo pacman -Qeq | wc -l 

sudo pacman -Qdt  
sudo pacman -Qdtq  
```
## delete
```sh
sudo pacman -R <package>
sudo pacman -Rs <package>
sudo pacman -Rns <package>

### 删除孤包
sudo pacman -R $(pacman -Qdtq)

### 删除未安装或旧版本的包文件缓存也会将安装着的包文件缓存一并删除
sudo pacman -Scc
```

# Debian package management

## Install
`sudo apt install package-name`

## fresh
`sudo apt update && sudo apt upgrade`

## delete
`sudo apt purge pkg-name`


## search

```sh
apt search string
aptitude search string
apt-cache search string
apt-file search file-path
```

## Other
```sh
sudo aptitude
apt-mark showmanual | cat
```
# About Files

## Makefile
[Cs6](https://cs6.swfu.edu.cn/~wx672/lecture_notes/linux/c/c_dev.html)
## xlsx -> csv
`xlsx2csv input.xlsx > output.csv`

## doc -> pdf
`pdf myfile.doc`

## html  
`zcat gittutorial.7.gz | groff -mandoc -Thtml `

## tar && gzip

1. open tar :`tar xvf `
2. make tar :`tar cvf`

1. `gizp filename`        -->  gzip  
2. `gzip -d filename.gz`  -->  open gzip

## extract/open a tgz (tar.gz) file:    

`tar xvfz filename.tar.gz`

## create a new archive with compression 
> 存档 with 压缩

`tar zcf new_file.tgz  File1 File2 ....`

## Make a file like word 
> by the steps 

```
1. less file.pdf > file.md
2. vim file.md 
3. pandoc file.md
4. pandoc file.md > file.html

```

## pdf
### separate a new one from the pdf:  
`pdftk  pdffile.pdf cat page  output othername.pdf`

### unite some pdf to one pdf:
`pdftk  pdffile.pdf  uitepdf cat output all.pdf`    


# git && gitee

## help
`man gittutorial`

## config
```
git config --global user.name "xmk"
git config --global user.email "xingmk.@gmail.com"
```

## add
```
1. git add <file>
2. git commit -m ""     
3. git pusll origin master
4. git push origin master 
```

## delete
```
1. git rm <file>
2. git commit -m "file"
3. git push 
```

## update
```
1. git add <file>
2. git commit -m "explation"
3. git pull
4. git push
```

## clone
 `git clone https://example`  
 
 
## create a git repositories
```
1. mkdir install
2. cd install
3. git init 
4. touch readme.md
5. git add readme.md
6. git commit -m "first commit"
7. git remote add origin git@gitee.com:bestxmk/install.git
8. git push -u origin "master"
```

##  if you have a repositories
```
1. cd existing_git_repo
2. git remote add origin git@gitee.com:bestxmk/install.git
3. git push -u origin "master"
```
 

# To write a program

> About Py
```sh
vim hello.py

python3 hello
or  
chmod +x hello.py
./hello.py 
```

## gcc
gcc -o file file.c   
gcc source.c -wall executable


#  Some tools
## 制作二维码:
`curl qrenco.de/内容`

## tutor of the command
the tutor of the order:  `curl cheat.sh/command`  
the tutor of the order:  `cht.sh order`

## how to recording
1. start recording (`ttyrec`)
2. start my script.
 
## sound
pulsemixer

## Networking
nmtui

## image processing (imagemagick)
 
## asciiart 
> 做图
[asciiflow.io](https://asciiflow.com/#/)


 curl https://voice.baidu.com/act/newpneumonia/newpneumonia/?from=osari_pc_3 | grep '<script>require.config' > data    


