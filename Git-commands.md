---
title: Git
date: 2023-05-25 18:35:19
categories:
  - [Linux, Git]
tags: git-commands
index_img: /img/git.png
---

- `git config --global user.name "xxx"` :向 Git 提交自己身份（name）

- `git config --global user.email "xxx@xx.com"` :向 Git 提交自己身份（email）：

- `git init` :把当前文件夹变为一个 git 仓库 创建 git 仓库

- `git status` :查看当前仓库文件变化情况

- `git add` :添加修改（可使用 git add . 来添加当前仓库所有修改）

- `git diff` :本次还没有提交的更改（比较工作区与暂存区的区别）

- `git reset` :回滚，撤销提交操作

- `git commit -m "xxx"` :向 Git 提交内容： （xx 为对提交的内容进行描述）

- 让 Git 不提交某些文件/忽略某些文件：创建文件 .gitignore 并在文件中添加文件名/文件夹名 即可 （若 git 已经开始追踪某些文件 则需要 next step）

- `git rm --cached xx` :让 Git 不再追踪某个/某些文件： （xx 为文件名）

- `git branch xx` :Git 添加分支（xx 为分支名）

- `git checkout xx` :Git 切换分支（xx 为分支名）

- `git merge xx` :合并分支（xx 为分支名）

- `git branch` :列出本地分支

- `git branch -d xx` :删除分支 (xx 为分支名，-D 强制删除)

- `git remote add origin xxx` :添加远程仓库： （xxx 为远程地址）

- `git push --set-upstream` :设置本地分支追踪远程分支

- `git clone xxx` :克隆仓库（xxx 为远程地址）
