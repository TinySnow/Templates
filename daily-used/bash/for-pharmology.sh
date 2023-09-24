#!/usr/bin/bash

set -Eexuo pipefail

export LANG=zh_CN.UTF-8

# 删除中文之间的空格，需要重复多次

sed -i -E 's|([^ -~]+)\s+([^ -~]+)|\1\2|g' $1

sed -i -E 's|([^ -~]+)\s+([^ -~]+)|\1\2|g' $1

sed -i -E 's|([^ -~]+)\s+([^ -~]+)|\1\2|g' $1

sed -i -E 's|([^ -~]+)\s+([^ -~]+)|\1\2|g' $1

sed -i -E 's|([^ -~]+)\s+([^ -~]+)|\1\2|g' $1

sed -i -E 's|([^ -~]+)\s+([^ -~]+)|\1\2|g' $1

sed -i -E 's|([^ -~]+)\s+([^ -~]+)|\1\2|g' $1


# 设定二级标题

sed -i -E 's|^[^ -~]+、|## |g' $1

# 转换类似 `( 一)` 的半角括号为全角括号

sed -i -E 's|\(([^!-~]+)\)|（\1）|g' $1

# 设定三级标题

sed -i -E 's|^（[^!-~]{1,3}）|### |g' $1

# 一级无序列表

sed -i -E 's|^[0-9]+\. |- |g' $1


sed -i -E 's|^\([ 0-9]+\) |  - |g' $1


sed -i -E 's|^[0-9]+\) |    - |g' $1


sed -i -E 's|([^ -~]+)\s+([^ -~]+)|\1\2|g' $1

sed -i -E 's|([^ -~]+)\s+([^ -~]+)|\1\2|g' $1

sed -i -E 's|([^ -~]+)\s+([^ -~]+)|\1\2|g' $1

sed -i -E 's|([^ -~]+)\s+([^ -~]+)|\1\2|g' $1

input=$1

touch "$1.tmp"

output="$1.tmp"

echo -ne "\n" >> $1

prev_line=""
while IFS= read -r line; do
    # 判断行首字符是否为 -, # 或空格
    if [[ ! $line =~ (^\-|^\#|^\ ) ]]; then
        # 判断上一行是否为空，如果不为空则拼接到上一行
        if [[ -n $prev_line ]]; then
            prev_line="$prev_line$line"
        else
            prev_line=$line
        fi
    else
        # 上一行不为空时，将其写入输出文件
        if [[ -n $prev_line ]]; then
            echo "$prev_line" >> $output
        fi
        # 当前行作为下一行的起始行
        prev_line=$line
    fi
done < "$input"

# 将最后一行写入输出文件
if [[ -n $prev_line ]]; then
    echo "$prev_line" >> $output
fi

cat $output > $1

rm -rf $output

# 段末加空行

sed -i -E 's|$|\n|g' $1

# 转换类似 `( 一)` 的半角括号为全角括号

sed -i -E 's|\(([^!-~]+)\)|（\1）|g' $1

# 删除中文之间的空格，需要重复多次

sed -i -E 's|([^ -~]+)\s+([^ -~]+)|\1\2|g' $1

sed -i -E 's|([^ -~]+)\s+([^ -~]+)|\1\2|g' $1

sed -i -E 's|([^ -~]+)\s+([^ -~]+)|\1\2|g' $1