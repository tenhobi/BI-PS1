#!/bin/bash
# Výpočet průměrného počtu znaků v záznamech.

awk '
BEGIN {
  print "--- start"
  soucet = 0
}

{
  soucet += length($0)
}

END {
  print "soucet je", soucet

  # Vypsání průměru (jako desetinné číslo).
  print "prumer je", soucet/NR

  # Zaokrouhlení čísla na správnou stranu.
  print "prumer je", int((soucet/NR)+0.5)
  print "--- konec"
}
' 'marks.data'
