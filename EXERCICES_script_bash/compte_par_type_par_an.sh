# Indique que le script doit être exécuté avec l'interpréteur Bash env rend le script plus adaptable et accessible sur différents systèmes
#!/usr/bin/env bash

#Condition qui vérifie le nombre d'arguments passés aus programme

if [ "$#" -ne 1 ]; then
    echo "$0 Ce programme prend seulement 1 arguments"
    exit 1
fi


entity=$1

# Vérifie que l'entité est une chaîne non vide et composée uniquement de lettres
if [[ -z "$entity" ]] || ! [[ "$entity" =~ ^[a-zA-Z]+$ ]]; then
    echo "Erreur : L'entité doit être une chaîne non vide composée uniquement de lettres."
    exit 1
fi

# Boucle sur les années spécifiées Cette boucle itère sur les années spécifiées (2016, 2017, 2018). À chaque itération, la variable year prend la valeur de l'année en cours.

for year in 2016 2017 2018;

do

#Cette ligne lance le srcipt avec les arguments, les entity et year.

    ./compte_par_type.sh "$entity" "$year"
done
