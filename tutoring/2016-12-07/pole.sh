#!/bin/bash
# Výpis kvantity každého hodnocení a následné sezaření.

awk '
{
  # Hodnota 4. sloupečku se použije jako klíč v poli a tomu se navýší hodnota.
  pole[$4]++
}

END {
  # Pro všechny hodnoty se vypíše výsledek.
  for (val in pole) {
    print val ": " pole[val]
  }
}
' 'marks.data' | sort -n -k 2 -r
