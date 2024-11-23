#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Usage: $0 fichier_source [nombre_de_bigrammes]"
    exit 1
fi

fichier_source=$1
nombre_de_bigrammes=${2:-25}

# Appel au script 1
mots=$(./script_1.sh "$fichier_source")

# Générer les bigrammes
echo "$mots" | tail -n +2 > decalage.txt
echo "$mots" | paste - decalage.txt | sort | uniq -c | sort -nr | head -n "$nombre_de_bigrammes"
