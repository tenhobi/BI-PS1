# ne 
#A=$(cat aa.txt | head)

# ano
#cat aa.txt | head > prvni.tmp

# ne
a="alfa"
echo "$abeta"

# ano
a="alfa"
echo "${a}beta"

echo "$@"

for i in "$@"
do
  if [ "$i" == "3" ]
  then
    continue
  fi

  printf -- "$i\n"
done  

cat /etc/passwd | awk '
BEGIN {
  FS=":";
  OFS=" ";
}
{ 
  if (NF > 6) {
    print $(NF-1),$1,$3
  }
}
'             
