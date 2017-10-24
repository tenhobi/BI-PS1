#!/bin/bash
# Vytvoření složek se jmény dle argumentů.

# Pro všechny položky v seznamu argumentů...
for i in "$@"
do
  echo "${i}"

  # Je již složka vytvořena?
  if [ -d "${i}" ]
  then
    # Přeskočí na další položku v seznamu.
    # Vs. break - ukončil by celý cyklus.
    continue
  fi

  echo "Vytvarim slozku \"${i}\"."
  mkdir "${i}"
done
