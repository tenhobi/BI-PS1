#!/bin/bash
# Nahrazování pomocí sed.

# Nahrazení písmena o za znak tečky (.).
echo 'skoda 1 auto 2 oko 3 noha 4 ceskoslovensko 69' | sed 's/o/./'

# Pokud chceme nahradit všechny výskyty, použijeme "přepínač" g.
echo 'skoda 1 auto 2 oko 3 noha 4 ceskoslovensko 69' | sed 's/o/./g'

# Nahrazení všech alfabetických znaků (vyznačených množinou a až z, A až Z) tečkou.
echo 'škoda 1 auto 2 oko 3 noha 4 československo 69' | sed 's/[a-zA-Z]/./g'

# Pokud bychom měli jazyk systému nastavený na jazyk (např. angličtinu), který nepodporuje speciální znaky jiného jazyka např. 'č' atp., je vhodné použít "meta množiny" alpha, kde je větší pravděpodobnost, že se speciální znaky také vyberou.
echo 'škoda 1 auto 2 oko 3 noha 4 československo 69' | sed 's/[[:alpha:]]/./g'

# Nahrazení malých znaků velkými a vice versa.
# [[:lower:]] je meta množina vybírající jen malé znaky abecedy.
# [[:upper:]] je meta množina vybírající jen velké znaky abecedy.
# \U\1 převede hodnotu proměnné 1 (obsah z první skupiny) na velké znaky.
# \L\2 převede hodnotu proměnné 2 (obsah z druhé skupiny) na malé znaky.
echo "Ajdf  99 sdf FDSfssSSSsDg GGg" | sed -E 's/([[:lower:]])|([[:upper:]])/\U\1\L\2/g'

# Přepínač -i přijímá navíc argument souboru, do kterého se také nazpět uloží výstup.
# Nahradíme všechny výskyty slova voda za slovo pivo.
sed -i 's/voda/pivo/g' './replace.data'

echo "je mi 123" | sed -E 's/([[:digit:]]+)/\1 let/'
