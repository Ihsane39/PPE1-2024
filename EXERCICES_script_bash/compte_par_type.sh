# Indique que le script doit être exécuté avec l'interpréteur Bash env rend le script plus adaptable et accessible sur différents systèmes
#!/usr/bin/env bash

#Condition qui vérifie le nombre d'arguments passer au programme.

if [ "$#" -ne 2 ]; then
    echo "$0 Ce programme prend seulement 2 arguments"
    exit 1
fi


entity=$1
year=$2


# Vérifie que l'entité est une chaîne non vide et composée uniquement de lettres
if [[ -z "$entity" ]] || ! [[ "$entity" =~ ^[a-zA-Z]+$ ]]; then
    echo "Erreur : L'entité doit être une chaîne non vide composée uniquement de lettres."
    exit 1
fi

# Vérifie que l'année est un nombre à 4 chiffres
if ! [[ "$year" =~ ^[0-9]{4}$ ]]; then
    echo "Erreur : L'année doit être un nombre à 4 chiffres."
    exit 1
fi

#Cette ligne affiche un message sur la console indiquant l'année en cours, suivi du nombre d'entité que l'on va compter.

echo "$entity en $year :"

# Recherche les fichiers .ann dans le répertoire correspondant à l'année
#Egrep cherhche la valeur de la variable entity dans le chemin spécifié
#Compte le nombre de lignes trouvées avec wc -l Cette partie compte le nombre de lignes correspondant aux résultats de la recherche et stocke ce nombre dans la variable count

count=$(egrep "$entity" "/home/administrateur/Bureau/MASTER TAL/M1 TAL/PROJET ENCADRE 1/TD S1/PPE1-2024/EXERCICES_script_bash/ann/$year/"*.ann | wc -l)

#Cette ligne affiche le nombre de lignes (c'est-à-dire le nombre d'occurrences de "Location") sur la console

echo "$count"
