#!/bin/bash

cat /etc/passwd | awk '
BEGIN {
  FS=":";
  OFS=" ";
}
{ 
  if (NF > 6) {
    print $(NF-1),$1,$3
  }
}
'             
