#!/usr/bin/env bash

set -Eeuxo pipefail

# 将分隔符暂时保存
split=$IFS

# 定义分隔符为回车
IFS=$'\n'

function logic {

	# 打印当前正在处理的文件
	filename=${1%.*}

	# 如果后缀名是 .md 则执行添加语句
	if [[ "${1##*.}"x = "md"x ]]; then
		sed -i -r -e "4i\    \- \[${filename}\]\(学习\/花语\/${filename}\.md\)" $2
	fi

}

function recursion {

	cd $1

	# 列出当前目录下所有文件和文件夹
	local list=$(ls)

	# 循环处理 list 中的项
	for one in $list; do
		# 如果是一个目录，则进入目录下，否则执行逻辑函数
		if [[ -d $one ]]; then
			recursion $one
		else
			logic $one $2
		fi
	done

	cd ../
}

# 顶级文件夹处理
recursion $1 $2

# 将分隔符定义回去
IFS=$split

# 输出完成
echo "done."