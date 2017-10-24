#!/bin/bash
# Výpočet celkového počtu bodů studentů a jejich průměrného výsledku.

awk '
BEGIN {
  print "--- start"
  soucet = 0
}

{
  soucet += $NF
}

END {
  print "soucet je", soucet
  print "prumer je", int((86.8)+0.5)
  print "prumer je", int(soucet/NR)
  print "--- konec"
}
' 'marks.data'
