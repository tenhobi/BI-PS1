#!/bin/bash
# Příkaz grep a jeho přepínače.

# Vypsání všech řádků, kde se nachází písmeno a.
cat './palindrom.data' | grep --color=auto 'a'

echo
echo '==='
echo

# Vypsání všech řádků, kde se nachází čtyřznaké palindromy.
# --color=auto nám obarví shodu (vhodné alespoň na testování)
# -E značí extended syntaxi, kde můžeme využít výhod skupin
# -i značí, že nezáleží na velikosti znaků
cat './palindrom.data' | grep --color=auto -E -i '([[:alpha:]])([[:alpha:]])\2\1'
