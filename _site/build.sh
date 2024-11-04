# bin/bash.sh
# 复制文件
rm -rf ./page/app/randomCheckIn/*
cp -r /home/maple/GitWorkspace/randomCheckIn/dist/* /home/maple/GitWorkspace/Maple-Chan.Blog/page/app/randomCheckIn/
# 编译博客内容
bundle exec jekyll serve -V
