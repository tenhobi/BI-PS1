#!/bin/bash
# Práce s příkazem seq.

# Expanze lze používat jak s čísly, tak i se znaky.
echo "soubor"{1..10}{a..z}

# Exanze lze oddělovat čárkou (lze vytvořit seznam různých hodnot - tj. čísla i písmena) i vnořovat do sebe.
echo "soubor"{a,3}{a..c}
echo "soubor"{{1..5},{a..e}}{a..c}

a=5

# Do expanze nelze dosazovat proměnná.
echo "soubor"{1..$a}{a..z}

# Pokud chceme vytvářet řadu podle proměnných (např. podle argumentů skriptu), lze využít příkaz seq.
for i in $(seq $1 $2)
do
  echo "soubor${i}"
done
