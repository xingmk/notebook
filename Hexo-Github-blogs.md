---
title: Hexo Build Blogs
date: 2023-05-26 17:23:25
categories:
  - [Hexo]
tags: hexo-github
index_img: /img/hexo_github.png
---

# Prepare

1. 需要一个 `Github` 账号 如果没有可在 [官网](https://github.com) 申请
2. 需要安装 `Git` [git 下载](https://git-scm.com/downloads)
3. 需要安装 `Nodejs` [nodejs 下载](https://nodejs.org/en/download)

# Create repositories

在 GitHub 中创建仓库  
名字必须是: `Github的用户名.github.io`

## 演示

在新创建的仓库中 `create a new file`
文件名字必须为： `index.html`

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>test</title>
  </head>
  <body>
    <h1>xmk的个人主页</h1>
    <h1>Hello ~</h1>
  </body>
</html>
```

在浏览器中打开 `https://<用户名>.github.io`

# 安装 Hexo

[官网](https://hexo.io/zh-cn/)

- 安装：

```sh
npm install -g hexo-cli
```

- 创建一个项目`hexo-blog`

```sh
hexo init hexo-blog
cd hexo-blog
npm install

```

- 本地启动

```sh
hexo g
hexo server
```

浏览器访问 `http://localhost:4000`

# 更换主题：Fluid

[Fluid 官网](https://github.com/fluid-dev/hexo-theme-fluid)

安装

```sh
npm install --save hexo-theme-fluid
```

更换主题

```yaml
theme: fluid # 指定主题
language: zh-CN # 指定语言，会影响主题显示的语言，按需修改
```

本地启动

```sh
hexo g -d
hexo s
```

浏览器访问 `http://localhost:4000`

# 部署 Github

安装 hexo-deployer-git

```sh
npm install hexo-deployer-git --save
```

修改根目录下的 `_config.yml` ，配置 `GitHub` 相关信息

```yaml
deploy:
  type: git
  repo: https://github.com/username/username.github.io.git
  branch: main
  token: .....
```

其中 `token ` 为 `GitHub ` 的 `Personal access tokens` ，获取方式如下图
![token](/img/token.png)

部署到 Github

```sh
hexo g -d
```

浏览器访问 `https://username.github.io`
