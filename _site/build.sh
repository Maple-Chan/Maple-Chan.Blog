# bin/bash.sh
# 拉取代码
version=$1

if [ "$#" -lt 1 ]; then
    echo "错误：至少需要一个参数。"
    exit 1
fi

pwd
cd ../randomCheckIn/
git pull
echo "git pull 成功..."
cd ../Maple-Chan.Blog/
# 复制文件
rm -rf ./page/app/randomCheckIn/*
cp -r /home/maple/GitWorkspace/randomCheckIn/dist/* /home/maple/GitWorkspace/Maple-Chan.Blog/page/app/randomCheckIn/
echo "dist文件复制成功..."
# 编译博客内容
bundle exec jekyll serve -V
echo "博客html文件生成成功..."
git add .
git commit -m "[deploy]upload v$version"
echo "git commit 成功..."
git push
echo "git push 成功..."
