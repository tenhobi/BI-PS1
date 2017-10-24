#!/bin/bash

#
# Archivace
#

# vytvoreni

tar cvf archiv.tar soubory

# zobrazení struktury

tar tvf archiv.tar

# rozbalení archivu

tar xvf archiv.tar

#
# Komprese .Z
#

# komprese

compress soubor

# dekomprese

uncompress soubor


#
# Komprese .gz
#

# komprese

gzip soubor

# dekomprese

gunzip soubor

#
# Zachováni původního souboru při kompresi
#

cat archiv.tar | gzip > archiv.tar.gz

#
# Archivace a komprese rovnou do .tar.gz
#

tar cvf - soubor | gzip > archiv.tar.gz
