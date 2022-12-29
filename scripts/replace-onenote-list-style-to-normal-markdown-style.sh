set -Eeuxo pipefail

sed -i -e "s/\-\-\-\-\-//g" $1
sed -i -e "s/\-\-//g" $1

sed -i -e "s/[a-z][\.+]\ /- /g" $1
sed -i -e "s/[a-z][)+]\ /- /g" $1

sed -i -e "s/[0-9][\.+]\ /- /g" $1
sed -i -e "s/[0-9][)+]\ /- /g" $1

sed -i -e "s/iv.\ /- /g" $1
sed -i -e "s/v.\ /- /g" $1
sed -i -e "s/vi.\ /- /g" $1
sed -i -e "s/vii.\ /- /g" $1
sed -i -e "s/iii.\ /- /g" $1
sed -i -e "s/ii.\ /- /g" $1
sed -i -e "s/i.\ /- /g" $1

sed -i -e "s/\ \ \ \ \ \ \ /\ \ /g" $1
sed -i -e "s/\ \ \ \ \ /\ \ /g" $1