# IOTEST

## Jak přidat skript do `$PATH`

```bash
PATH="/cesta/ke/slozce:$PATH" >> ~/.bashrc
alias iotest="iotest.sh" >> ~/.bashrc
```

## Návod na použití

Jediný důležitý soubor pro funkčnost testování je `iotest.sh`, takže zbytek netřeba kopírovat. Ve složce `tests/` se nachází ukázkový projekt s referenčními daty, na kterém je možné a vhodné si *IO test* vyzkoušet.

Momentálně je očekávána struktura, kde C soubor se jmenuje `main.c` a všechny referenční soubory jsou ve složce `samples/`.

```
jmeno-projektu/
  main.c
  samples/
    0001_in.txt
    0001_out.txt
    0002_in.txt
    0002_out.txt
    ...
```

*IO test* je doporučen mít jen jeden, např. ve složce pro progtesty, kde se také budou nacházet jednotlivé projekty, např.:

```
progtesty/
  iotest.sh
  muj-projekt-1/
    ...
  muj-projekt-2/
    ...
```

V tomto případě se *IO test* spustí ve stylu `./iotest muj-projekt-1/`.

## Usage

Actual help list and guides how to use this script can be found using `./iotest --help` command.

## Creators

**Honza Bittner** 

- <https://twitter.com/tenhobi>
- <https://fb.com/tenhobi>
- <https://github.com/HoBi>
