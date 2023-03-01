#!/bin/bash

# 确保 bash 脚本安全性
set -Eeuxo pipefail

# 将分隔符暂时保存
split=$IFS

# 定义分隔符为回车
IFS=$'\n'

function recursion {

	cd $1

	# 列出当前目录下所有文件和文件夹
	local list=$(ls)

	# 循环处理 list 中的项
	for one in $list; do

		# 如果是一个目录，则进入目录下
		if [[ -d $one ]]; then

			# 递归处理
			recursion $one

		else

			# 打印当前正在处理的文件
			filename=${one%.*}

			# 如果后缀名是 .md 则执行添加语句
			if [[ "${one##*.}"x = "md"x ]]; then

				# line_number=`sed -n -e '/^##\ 正文/=' ${filename}.md | head -1`

				# offset=`expr ${line_number} + 1`

				# 删除空白行
				sed -i -e "/^[\　]\s*\$/d" ${filename}.md

				# 替换 \n 为 windows 风格 \r\n
				# sed -i -e "${offset},\$s/^/\r\n&/" ${filename}.md

			fi

		fi

	done

	cd ../
}

# 顶级文件夹处理
recursion $1

# 将分隔符定义回去
IFS=$split

# 输出完成
echo "done."