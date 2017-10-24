#!/bin/bash

# FS ... oddělovač sloupců na vstupu
# NR ... počet záznamů
# NF ... počet sloupců
# OFS ... oddělovač sloupců na výpisu

# $1, $2 atp. ... sloupec
# $NF ... poslední sloupec
# $(NF-1) ... předposlední sloupec

# length() ... počet znaků
# -F":" ... nastavení FS ( shodné s BEGIN { FS=":"} )
# substr(string, od [, do]) ... výřez z řetězce
# int() ... zaokrouhlení

# Používá se ve stylu:
# awk 'podminka {prikazy}' soubor
# - pokud se jako podminka nic nepoužije, provedou se příkazy na všechny řádky
# - speciální BEGIN {} - provede se vždy před spuštěním awk
# - speciální END {} - provede se vždy po spuštění awk
# - pokud se jako podmínka použije /pattern/ - lze využívat regulární výrazy
# - jako podmínka jdou používat logické výrazy, porovnávání atp.
