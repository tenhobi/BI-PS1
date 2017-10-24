#!/bin/bash

#find kde? co? [volitelne: co s tim?]

find . -name '*.txt' # najde v aktualnim adresari vsechny soubory, jejichz jmeno konci .txt

find . -name '*.txt' -type f # totez jako predtim, ale soubor jeste navic musi byt obycejny

find . \( -name '*.txt' -o -type f \) # najde v aktualnim adresari vsechny soubory, ktere jsou bud obycejne, nebo jejich jmeno konci na .txt, nebo splnuji obe tato kriteria (logicke nebo)

find . \! -type f # najde v aktualnim adresari vsechny neobycejne soubory

#dalsi predikaty, co se hodi umet:
# -amin, -cmin, -mmin
# -mindepth, -maxdepth
# -size
# -perm (pozor na tri rezimy, kouknout do manualu)

find . \( \! -type f \) -exec rm '{}' \; # smaze vsechny neobycejne soubory v aktualnim adresari (za '{}' se dosazuji jmena souboru, ktera find postupne nachazi, a pro kazdy se rm vola zvlast) - nezapomenout napsat na konec strednik!
