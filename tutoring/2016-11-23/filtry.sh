#!/bin/bash
# Jednoduché filtry a práce s nimi.

# Vypsání 3. řádku souboru.
# Nejdříve pomocí head vybereme první 3 řádky, následně z našeho výběru vybereme poslední.
cat /etc/passwd | head -3 | tail -1

# Každý řádek souboru si rozložíme podle dvojtečky (:) a vybereme jen 1. a 5. sloupec zleva.
cat /etc/passwd | cut -d':' -f1,5

# Pokud chceme vybírat sloupce zprava, je nutné si pomoci příkazem rev - tj. otočením textu (ahoj -> joha).
# Text si otočíme, rozdělíme pomocí dvojtečky, vybereme 1. a 5. sloupec a výsledek zase otočíme, čímž docílíme výběru 1. a 5. řádku zprava.
cat /etc/passwd | rev | cut -d':' -f1,5 | rev

# Možnosti vstupu dat do standardního vstupu příkazů.
rev <<< AHOJ
echo "AHOJ" | rev

# Seřazení řádků - defaultně je alfabetické řazení.
cat ./cisla.data | sort

# Seřazení řádků numerickým řazením - využíváme přepínače -n.
cat ./cisla.data | sort -n

# Abychom mohli zjistit počet unikátních řádků v datech, nejprve musíme řádky setřídit.
# Přepínačem -c příkazu uniq docílíme přidání počítadla. 
cat ./cisla.data | sort -n | uniq -c

# Vypsání řádku s největším počtem opakováním. (Neošetřujeme více hodnot se stejným počtem.)
cat ./cisla.data | sort -n | uniq -c | sort -n | tail -1 

# Vypsání čísla reprezentující maximální počet výskytů hodnoty.
cat ./cisla.data | sort -n | uniq -c | sort -n | tail -1 | sed -E 's/^[ ]+([[:digit:]]).*/\1/'
