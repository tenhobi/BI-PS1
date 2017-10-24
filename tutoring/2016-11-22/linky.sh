#!/bin/bash
# Tvoření linků mezi soubory.

# hardlink =  soubor má stejné ID a ukazuje na stejná data v paměti,
#             pokud se soubor vymaže, na data lze stále přistupovat
#             z ostatních hardlinků.

# symlink =   soubor ukazuje na jiný soubor. Pokud se původní soubor
#             ukazující na data smaže, symlink na data již nevidí.

# Vytvoření hardlinku bbb na soubor aaa.
touch aaa
ln aaa bbb

# Vytvoření symlinku ddd na soubor ccc.
touch ccc
ln -s ccc ddd
