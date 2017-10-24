#!/bin/bash
# Cyklus for a while.

# Seznam hodnot.
seznam=("alfa" "beta game" "3333 aaa" 33 "nooob")

# Pro všechny položky v seznamu.
# ${seznam} by vybralo jen první položku.
for i in "${seznam[@]}"
do
  echo "$i"
done

echo
echo "----"
echo

a=1

# Dokud je proměnná a <= 9.
while [ "$a" -le 9 ]
do
  # Pokud je hodnota proměnné a rovna 7, pak položku inkrementuj (jinak by vznikl nekonečný cyklus) a přeskoč na další průchod cyklu.
  if [ "$a" -eq 7 ]
  then
    a=$(( $a + 1 ))
    continue
  fi

  echo "$a"
  a=$(( $a + 1 ))
done

echo "konec cyklu while"
