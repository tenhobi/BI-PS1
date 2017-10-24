#!/bin/bash
# Opakování cyklů a ošetření položek názvem podobným přepínači.

for i in "-n" "bbb"
do
  # Ochrana pomocí --, tj. "konec přepínačů, dále budou jen a pouze argumenty".
  printf -- "$i\n"
done
