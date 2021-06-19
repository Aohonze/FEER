#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 上传仓库
git add .
git commit -m "21.06.19"
git push

# 生成静态文件
npm run build

# 进入生成的文件夹
cd docs/.vuepress/dist

# 将项目的readme文件复制
cp /Users/wutengda/Documents/GitHub/FEER/README.md /Users/wutengda/Documents/GitHub/FEER/docs/.vuepress/dist/

# 如果是发布到自定义域名
# tcb hosting:deploy ./ -e env-dbegretq


# 推送到git-pages
git init
git add .
git commit -m '21.06.18'
git remote add github https://github.com/Aohonze/Aohonze.github.io.git
git push -f github master

# 发布到coding
# git remote add coding https://e.coding.net/tyronewu/FEER.git
# git push -f coding master

# 删除GIT相关配置
rm -rf .git

# 部署到腾讯云
cloudbase hosting:deploy . -e env-dbegretq

cd -
