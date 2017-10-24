#!/bin/bash
# Počet záznamů.

awk '
BEGIN {
  FS = ":"
  OFS = " "
  pocitadlo = 0

  # Na počátku je NR nulové - neprošly se žádný záznamy.
  print NR
}

{
  pocitadlo++
}

END {
  print "pocitadlo je", pocitadlo

  # Na konci je NR nastaveno na počet záznamů - počet projití záznamů.
  # S pocitadlo se shoduje jen proto, že aplikujeme kód na všechny záznamy, bez podmínky.
  print NR
}
' '/etc/passwd'
