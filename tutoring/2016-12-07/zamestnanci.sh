#!/bin/bash
# Zaměstnanci s platem nad $6000.

awk '
BEGIN {
  print "--- start"
  soucet = 0
}

{
  # Vynechání 1. znaku 5. sloupce, tj. znaku $.
  # $6000 -> 6000
  if (substr($5, 2) >= 6000) {
    print $0
    soucet++
  }
}

END {
  print "celkem ", soucet
  print "--- konec"
}
' 'employee.data'
