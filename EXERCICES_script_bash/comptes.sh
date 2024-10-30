# Indique que le script doit être exécuté avec l'interpréteur Bash
#!/usr/bin/env bash

# Boucle sur les années spécifiées Cette boucle itère sur les années spécifiées (2016, 2017, 2018). À chaque itération, la variable year prend la valeur de l'année en cours.
for year in 2016 2017 2018;

do
    # Affiche le message indiquant l'année actuelle Cette ligne affiche un message sur la console indiquant l'année en cours, suivi du nombre de locations que l'on va compter.
    echo "Locations en $year :"

    # Recherche les fichiers .ann dans le répertoire correspondant à l'année
    # Utilise egrep pour filtrer les lignes contenant "Location" Cette partie utilise la commande egrep pour rechercher le mot "Location" dans les fichiers spécifiés
    # Compte le nombre de lignes trouvées avec wc -l Cette partie compte le nombre de lignes correspondant aux résultats de la recherche et stocke ce nombre dans la variable count
    # Erreur chemin absolu au lieu de chemin raltif
    #count=$(egrep "Location" "/home/administrateur/Bureau/MASTER TAL/M1 TAL/PROJET ENCADRE 1/TD S1/PPE1-2024/EXERCICES_script_bash/ann/$year/"*.ann | wc -l)
    count=$(egrep "Location" "./ann/$year/"*.ann | wc -l)

    # Affiche le nombre de locations trouvées pour l'année actuelle,Cette ligne affiche le nombre de lignes (c'est-à-dire le nombre d'occurrences de "Location") sur la console
    echo "$count"

#Termine la boucle
done
