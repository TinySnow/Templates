set -Eeuxo pipefail

# LANG=C sed -i -e "/^[\u4e00-\u9fa5]+/i\>\ " $1

sed -i -e "s/>\ \-\-\-\-\-/\n/g" $1

sed -i -e "s/>\ />\ 　　/g" $1