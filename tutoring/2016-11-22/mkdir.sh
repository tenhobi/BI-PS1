#!/bin/bash
# Vytváření složek.

# Vytvoření složky alfa beta gama.
mkdir 'alfa beta gama'

# Ochránění proti názvům shodnými s přepínači.
A='-r'
mkdir -- "$A"

# Vytvoření složky a neexistujících mezisložek pomocí přepínače -p.
mkdir -p "./skola/ps1/cviceni/2016-11-22/"
