#!/bin/bash
# Využití FS a OFS proměnných, výpis dat z /etc/passwd.

awk '
BEGIN {
  FS=":";
  OFS="..."
}

{
  print NF, $1, $NF
}
' '/etc/passwd'
