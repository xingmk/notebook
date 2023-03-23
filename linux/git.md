- `git init` :把当前文件夹变为一个git仓库 创建git仓库

- `git status` :查看当前仓库文件变化情况

- `git add` :添加修改（可使用git add . 来添加当前仓库所有修改）

- `git diff` :本次还没有提交的更改（比较工作区与暂存区的区别）

- `git reset` :回滚，撤销提交操作 

- `git config --global user.name "xxx"` :向Git提交自己身份（name）

- `git config --global user.email "xxx@xx.com"` :向Git提交自己身份（email）：

- `git commit -m "xxx"` :向Git提交内容： （xx为对提交的内容进行描述）

- 让Git不提交某些文件/忽略某些文件：创建文件 .gitignore 并在文件中添加文件名/文件夹名 即可 （若git已经开始追踪某些文件 则需要11）

- `git rm --cached xx` :让Git不再追踪某个/某些文件： （xx为文件名）
 
- `git branch xx` :Git添加分支（xx为分支名）
 
- `git checkout xx` :Git切换分支（xx为分支名）
 
- `git merge xx` :合并分支（xx为分支名）
 
- `git branch` :列出本地分支
 
- `git branch -d xx` :删除分支  (xx为分支名，-D强制删除)
 
- `git remote add origin xxx` :添加远程仓库：  （xxx为远程地址）
 
- `git push --set-upstream` :设置本地分支追踪远程分支 
 
- `git clone xxx` :克隆仓库（xxx为远程地址）
