#!/bin/bash
# Změna proměnné PATH a efekt na příkaz ls.

# Zavoláme příkaz ls - normální očekávané chování.
ls

echo "$PATH"

# Do proměnné $PATH přidáme na začátek vlastní cestu.
PATH="${PWD}:${PATH}"

echo "$PATH"

# V naší vlastní cestě se nachází soubor ls, který se spustí, namísto obvyklého příkazu ls.
ls
