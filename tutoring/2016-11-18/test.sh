#!/bin/bash
# Práce s příkazem test.

# Existuje soubor "./echo"?
test -f ./echo
echo $?

# Příkaz "test" lze zapsat i pomocí [ ].
[ -f ./echo ]
echo $?

# Pokud existuje soubor, vypiš 3x "yay", nebo vypiš "nope".
if [ -f ./echo ]
then
  echo "yay"
  echo "yay"
  echo "yay"
else
  echo "nope"
fi

# Vše lze zapsat i do řádku pomocí oddělovače příkazů ";".
if [ -f ./echo ]; then echo "yay"; echo "yay"; echo "yay"; else echo "nope"; fi
