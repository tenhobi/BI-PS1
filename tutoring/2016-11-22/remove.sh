#!/bin/bash
# Odstraňování souborů.

# Použití příkazu s argumenty bez uvozovek či apostrofů.
touch 'test' 'soubor' 'test soubor' 'testovacisoubor'
ls
rm test soubor
ls

echo
echo '==='
echo

# Použití příkazu s argumentem v uvozovkách.
touch 'test' 'soubor' 'test soubor' 'testovacisoubor'
ls
rm "test soubor"

echo
echo '==='
echo

# Použití příkazu s argumenty v uvozovkách a se speciálním znakem (*).
# Pozor na to, že se speciální znak, tu konkrétně *, nemusí expandovat na soubory.
touch 'test' 'soubor' 'test soubor' 'testovacisoubor'
ls
rm "test soubor" "test*soubor"

echo
echo '==='
echo

# Ošetření názvů podobných přepínačům.
A='-n'
touch -- "$A"
ls

# Špatný způsob:
#rm "$A"

# Správný způsob, tj. chráníme argumenty od možné záměny za přepínače.
rm -- "$A"

ls
