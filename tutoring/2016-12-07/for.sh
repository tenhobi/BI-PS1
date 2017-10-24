#!/bin/bash
# For cyklus v awk. Využití substr() funkce na odstranění nežádoucího 1. znaku.

awk '
BEGIN {
  print "--- start"
  soucet = 0
  nakoupeno = 0
  i = 0
}

{
  soucet += substr($5, 2)
}

END {
  print "celkem $" soucet

  for (i = soucet; i >= 0;i -= 500) {
    nakoupeno++
    print "nakoupeno za 500 ", nakoupeno "x"
  }

  print "--- konec"
}
' 'employee.data'
