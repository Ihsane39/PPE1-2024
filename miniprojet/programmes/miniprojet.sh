#!/bin/bash

# Vérification de l'argument
if [ -z "$1" ]; then
    echo "Erreur : Vous devez spécifier un fichier en argument."
    exit 1
fi

# Initialisation du compteur de lignes
line_number=1

# Lecture du fichier passé en argument
while read -r line; do
    # Récupération du code HTTP
    code_http=$(curl -o /dev/null -s -w "%{http_code}" "$line")

    # Récupération de l'encodage
    encodding=$(curl -sI "$line" | grep -i "content-type" | sed -n "s/.*charset=//p")
    if [ -z "$encodding" ]; then
        encodding="Non spécifié"
    fi

    # Récupération du nombre de mots
    countword=$(curl -s "$line" | wc -w)

    # Afficher le numéro de ligne, l'URL, le code HTTP, l'encodage, et le nombre de mots
    echo -e "${line_number}\t${line}\t${code_http}\t${countword}\t${encodding}"
    ((line_number++))  # Incrémentation du numéro de ligne
done < "$1"
