#!/usr/bin/env bash

set -Eexuo pipefail

if [[ $1 ]]; then
	
	# 删除所有空行，和由空格组成的空行
	sed -i -e "/^[\ ]*$/d" $1

	# 所有行行首增加两个全角空格，代表缩进
	sed -i -e "s/^/\　\　/g" $1

	# 在所有行行尾增加一个空行
	sed -i -e "s/$/\n/g" $1

	# 替换所有 以两个全角空格缩进开头，以 ] 结尾的行
	# 替换为 ---（分割线）
	# 也即去掉 Telegram 复制粘贴消息留下的 name 和 timestamp
	sed -i -e "s/^\　\　.*\]$/\-\-\-/g" $1

	# 在所有行行首增加 >  的引用标识
	sed -i -e "s/^/>\ /g" $1

	# 因前一步操作会使 --- 分割线也加上引用表示，所以此处替换回去
	sed -i -e "s/^>\ \-\-\-/\-\-\-/g" $1

	# 补上标题
	sed -i -e "1c #\ $1\n" $1 && sed -i -e "1s/\.md//" $1

	# 废弃（Deprecated）
	# for (( i = 0; i < `sed -n -e '/^\-\-\-/p' $1 | wc -l`; i++ )); do
	# 	upper_split_line_number=`sed -n -e '/^\-\-\-/=' $1 | head -1`
	# 	lower_split_line_number=`sed -n -e '/^\-\-\-/=' $1 | head -2 | tail -1`
	# 	sed -i -e "${upper_split_line_number},${lower_split_line_number}s/^/> /" $1
	# done
fi