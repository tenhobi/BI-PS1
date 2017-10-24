#!/bin/bash
# Vypsání studentů s dobrými výsledky a označení excelentních studentů.

awk '
BEGIN {
  print "--- start"
}

# 1. možnost zápisu podmínky.
{
  if ($NF > 85) {
    print $0
  }
}

# 2. možnost zápisu podmínky.
$NF >= 90 {
  print "!!!", $2
}

END {
  print "--- konec"
}
' 'marks.data'
