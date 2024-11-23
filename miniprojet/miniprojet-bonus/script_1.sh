#!/bin/bash

# Script pour nettoyer un fichier texte et produire un mot par ligne

# Étape 1 : Vérifier qu'un argument est fourni
if [ $# -lt 1 ]; then
    echo "Usage: $0 fichier_source"
    exit 1
fi

# Étape 2 : Variables
fichier_source=$1

# Étape 3 : Vérifier que le fichier existe et est lisible
if [ ! -r "$fichier_source" ]; then
    echo "Erreur : le fichier '$fichier_source' n'existe pas ou n'est pas lisible."
    exit 1
fi

# Étape 4 : Nettoyage et transformation du fichier texte
cat "$fichier_source" | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]' | grep -oE '\w+'



