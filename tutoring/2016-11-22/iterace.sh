#!/bin/bash
# Iterování soubory.

# {.*,*} vypíše všechny normální i skryté soubory.
# Nezapomeňte, že složka je také soubor.
# Vypíše i aktuální adresář (tj. tečku) a nadřazený adresář (tj. dvě tečky).
for i in {.*,*}
do

  # Pokud je daná položka aktuální adresář nebo nadřazený adresář, pak se položka přeskočí.
  if [ "$i" = "." ] || [ "$i" = ".." ]
  then
    continue
  fi

  # Vypsání jména souboru.
  # Jméno souboru je ošetřeno proti přepínačům pomocí -- (= "konec přepínačů, následují jen argumenty").
  printf -- "$i\n"
done
