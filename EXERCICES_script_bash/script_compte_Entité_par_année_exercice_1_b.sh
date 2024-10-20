# Indique que le script doit être exécuté avec l'interpréteur Bash env rend le script plus adaptable et accessible sur différents systèmes
#!/usr/bin/env bash

# Boucle sur les années spécifiées Cette boucle itère sur les années spécifiées (2016, 2017, 2018). À chaque itération, la variable year prend la valeur de l'année en cours.

if [ "$#" -ne 1 ]; then
    echo "$0 Ce programme prend seulement 1 arguments"
    exit 1
fi


entity=$1


for year in 2016 2017 2018;

do

#Cette ligne affiche un message sur la console indiquant l'année en cours, suivi du nombre d'entité que l'on va compter.

    ./script_compte_Entité_par_année.sh "$entity" "$year"
done
