#!/bin/bash
# Práce s argumenty, s počtem argumentů.
# Pokud skritpu zadáme nějaké argumenty, původní obsah se přepíše novými argumenty.

# Pokud skript není spuštěn s argumenty, ukončí se skript.
# $# je speciální proměnná obsahující počet argumentů.
if [ ! "$#" -ge 1 ]
then
  exit 0
fi

# Vyprázdnění souboru.
# > nahradí celý obsah souboru.
printf -- "" > ./vystup

printf -- "$@\n"

# Každý argument se vypíše na samostatný řádek.
for i in "$@"
do
  # >> přidá obsah na konec souboru.
  # -- znamená, že už se očekávají pouze argumenty, tzn. ne přepínače. (Pokud by byl argument například "-n", skript se nechoval správně.)
  printf -- "${i}\n" >> ./vystup
done
