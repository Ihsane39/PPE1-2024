#!/bin/bash

# Script pour afficher les mots les plus fréquents d’un texte

# Étape 1 : Vérification des arguments
if [ $# -lt 1 ]; then
    echo "Usage: $0 fichier_source [nombre_de_mots]"
    exit 1
fi

# Étape 2 : Variables
fichier_source=$1
nombre_de_mots=${2:-25}  # Par défaut, 25 mots les plus fréquents
script1_path="$(dirname "$0")/script_1.sh"  # Chemin absolu vers script1.sh

# Étape 3 : Vérifications de pré-requis
# Vérifier que le script de l'exercice 1 existe et est exécutable
if [ ! -x "$script1_path" ]; then
    echo "Erreur : script1.sh introuvable ou non exécutable."
    exit 1
fi

# Vérifier que le fichier source existe et est lisible
if [ ! -r "$fichier_source" ]; then
    echo "Erreur : le fichier '$fichier_source' n'existe pas ou n'est pas lisible."
    exit 1
fi

# Étape 4 : Traitement
# Appel au script de l'exercice 1 pour nettoyer et extraire les mots
"$script1_path" "$fichier_source" | \
    sort | uniq -c | sort -nr | head -n "$nombre_de_mots"
