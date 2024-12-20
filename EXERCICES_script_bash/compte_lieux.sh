#!/usr/bin/env bash

if [ "$#" -ne 3 ]; then
    echo "$0 : entrez 3 arguments: l'année, le mois (ou * pour tous les mois) et le nombre de lieux"
    exit 1
fi

year=$1
month=$2
nbr_area=$3

# Vérifier si l'année est un nombre à 4 chiffres ou le symbole *
if ! [[ "$year" =~ ^[0-9]{4}$ || "$year" == "*" ]]; then
    echo "Erreur : L'année doit être un nombre à 4 chiffres ou * pour toutes les années."
    exit 1
fi

# Vérifier si le mois est un nombre entre 1 et 12, ou le symbole *
if ! [[ "$month" =~ ^[0-9]+$ || "$month" == "*" ]] || ([ "$month" -ne "*" ] && ([ "$month" -lt 1 ] || [ "$month" -gt 12 ])); then
    echo "Erreur : Le mois doit être un nombre entre 1 et 12, ou * pour tous les mois."
    exit 1
fi


# Vérifier si nbr_area est un nombre
if ! [[ "$nbr_area" =~ ^[0-9]+$ ]]; then
    echo "Erreur : Le nombre de lieux doit être un entier positif."
    exit 1
fi

# Classement des lieux de toutes les années et mois confondus
if [ "$year" = "*" ] && [ "$month" = "*" ]; then
    echo "le classement des $nbr_area lieux les plus cités de 2016 à 2018"
    #count=$(egrep "Location" "/home/administrateur/Bureau/MASTER TAL/M1 TAL/PROJET ENCADRE 1/TD S1/PPE1-2024/EXERCICES_script_bash/ann/2016/"*.ann "/home/administrateur/Bureau/MASTER TAL/M1 TAL/PROJET ENCADRE 1/TD S1/PPE1-2024/EXERCICES_script_bash/ann/2017/"*.ann "/home/administrateur/Bureau/MASTER TAL/M1 TAL/PROJET ENCADRE 1/TD S1/PPE1-2024/EXERCICES_script_bash/ann/2018/"*.ann | cut -f3 | sort | uniq -c | sort -nr | head -"$nbr_area") Remplacement chemin absolu par chemin relatif
    count=$(egrep "Location" "./ann/2016/"*.ann "./ann/2017/"*.ann "./ann/2018/"*.ann | cut -f3 | sort | uniq -c | sort -nr | head -"$nbr_area")


# Classement des lieux de tous les mois confondus d'une seule année
elif [ "$month" = "*" ]; then
    echo "le classement des $nbr_area lieux les plus cités pour l'année $year"
    #count=$(egrep "Location" "/home/administrateur/Bureau/MASTER TAL/M1 TAL/PROJET ENCADRE 1/TD S1/PPE1-2024/EXERCICES_script_bash/ann/$year/"*.ann | cut -f3 | sort | uniq -c | sort -nr | head -"$nbr_area")
    count=$(egrep "Location" "./ann/$year/"*.ann | cut -f3 | sort | uniq -c | sort -nr | head -"$nbr_area")


# Classement des lieux de toutes les années confondues d'un seul mois
elif [ "$year" = "*" ]; then
    echo "le classement des $nbr_area lieux les plus cités en $month de 2016 à 2018"
    #count=$(egrep "Location" "/home/administrateur/Bureau/MASTER TAL/M1 TAL/PROJET ENCADRE 1/TD S1/PPE1-2024/EXERCICES_script_bash/ann/2016/"2016_"$month"_*.ann "/home/administrateur/Bureau/MASTER TAL/M1 TAL/PROJET ENCADRE 1/TD S1/PPE1-2024/EXERCICES_script_bash/ann/2017/"2017_"$month"_*.ann "/home/administrateur/Bureau/MASTER TAL/M1 TAL/PROJET ENCADRE 1/TD S1/PPE1-2024/EXERCICES_script_bash/ann/2018/"2018_"$month"_*.ann | cut -f3 | sort | uniq -c | sort -nr | head -"$nbr_area")Remplacement chemin absolu par chemin relatif
    count=$(egrep "Location" "./ann/2016/"2016_"$month"_*.ann "./ann/2017/"2017_"$month"_*.ann "./ann/2018/"2018_"$month"_*.ann | cut -f3 | sort | uniq -c | sort -nr | head -"$nbr_area")

# Classement des lieux d'une année et d'un mois spécifiques
else
    echo "le classement des $nbr_area lieux les plus cités à la date $month/$year"
    #count=$(egrep "Location" "/home/administrateur/Bureau/MASTER TAL/M1 TAL/PROJET ENCADRE 1/TD S1/PPE1-2024/EXERCICES_script_bash/ann/$year/${year}_${month}"_*.ann | cut -f3 | sort | uniq -c | sort -nr | head -"$nbr_area") Remplacement chemin absolu par chemin relatif
    count=$(egrep "Location" "./ann/$year/${year}_${month}"_*.ann | cut -f3 | sort | uniq -c | sort -nr | head -"$nbr_area")
fi

echo "$count"
