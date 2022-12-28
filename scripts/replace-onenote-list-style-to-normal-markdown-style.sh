set -Eeuxo pipefail

sed -i -e "s/\-\-\-\-\-//g" $1
sed -i -e "s/\-\-//g" $1

sed -i -e "s/a.\ /- /g" $1
sed -i -e "s/b.\ /- /g" $1
sed -i -e "s/c.\ /- /g" $1
sed -i -e "s/d.\ /- /g" $1
sed -i -e "s/e.\ /- /g" $1
sed -i -e "s/f.\ /- /g" $1

sed -i -e "s/iv.\ /- /g" $1
sed -i -e "s/iii.\ /- /g" $1
sed -i -e "s/ii.\ /- /g" $1
sed -i -e "s/i.\ /- /g" $1

sed -i -e "s/\ \ \ \ \ /\ \ /g" $1