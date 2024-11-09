# bin/bash.sh
# 拉取代码
version=$1
pwd
cd ../randomCheckIn/
git pull
cd ../Maple-Chan.Blog/
# 复制文件
rm -rf ./page/app/randomCheckIn/*
cp -r /home/maple/GitWorkspace/randomCheckIn/dist/* /home/maple/GitWorkspace/Maple-Chan.Blog/page/app/randomCheckIn/
# 编译博客内容
bundle exec jekyll serve -V
git add .
git commit -m "[deploy]upload $version"
