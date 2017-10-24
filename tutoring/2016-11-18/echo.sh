#!/bin/bash
# Escapování stringů (textových řetězců), rozdíl mezi uvozovkami " a apostrofy '.

# Deklarace proměnné bez $.
alfa=5

# Shodný zápis. U druhé možnosti se závorkami je jasně definováno, co je celé jméno proměnné.
# Získání hodnoty proměnné s $.
echo "$alfa"
echo "${alfa}"

# Vypsání "$alfa" jako textu v uvozovkách.
echo "aaasadasd asd \"\$alfa\" sfsdfsdf"

# Vypsání "$alfa" jako textu v apostrofech.
echo 'aaasadasd asd "$alfa" sfsdfsdf'

# ---
# Různé situace jak se zpracuje shell při výpisu proměnné.
# Požadovaný výstup je "5cislo":

# Špatně - proměnnou alfacislo shell nezná a neví, že chceme pracovat s proměnnou alfa.
echo "$alfacislo"

# V pořádku - nejdříve se nahradí proměnná a dosadí se do řetězce.
echo "${alfa}cislo"

# Špatně - proměnná se sice nahradí, ale řetězec obsahuje nechtěnou mezeru.
echo "$alfa cislo"

# V pořádku - nejdříve se nahradí proměnná v prvním řetězci a následně se řetězce spojí.
echo "$alfa""cislo"
