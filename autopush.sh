# 用于 git 自动提交
# 除此脚本外，也可以写一个 alias

git add .

git commit -m "$1"

# 可以将分支换成 $2 变量用于指定分支
git push