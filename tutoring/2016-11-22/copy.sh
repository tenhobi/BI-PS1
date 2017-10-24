#!/bin/bash
# Kopírování souborů (a složek).

# Soubor cyklus.sh se zkopíruje do souboru test.sh
cp './cyklus.sh' './test.sh'

# Rekurzivní kopírování souborů (tj. kopírování složek).
# Aktuální adresář (= tečka) do složky kopie v nadřazeném adresáři (= dvě tečky).
# Pro přesun složky je nutné používat přepínač -R (= rekurzivní kopírování).
cp -R . ../kopie/

# Přesun souboru test-mv do souboru new-mv-test.
# Přesun je vlastně přejmenování.
touch './test-mv'
ls
mv './test-mv' './new-mv-test'

# Přesun složky, není potřeba používat přepínač.
mv ./slozka/ ./druha/
