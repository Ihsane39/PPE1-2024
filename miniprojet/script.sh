#!/usr/bin/bash
corpus=$2
counter=1

if [ $# -ne 2 ];
then
    echo "À la suite de la ligne de commande, entrez le nom du fichier qui contient les URLs et le nom de votre corpus."
    exit
fi

while read -r url; do
    # Extraire le nom du site avec sed
    site_name=$(echo "$url" | sed -E 's_https?://(www\.)?([^/.]+).*_\2_' | sed 's/[^a-zA-Z0-9]/_/g')

    # Créer un nom de fichier avec le format NOMCORPUS-SITE-XXX
    filename=$(printf "$corpus-%s-%03d.txt" "$site_name" "$counter")

    # Ajouter l'URL en haut du fichier de sortie
    echo "URL : $url" > "$filename"

    # Télécharger le contenu HTML et le convertir en texte brut
    # Utiliser curl pour récupérer la page, puis lynx pour le convertir
    # Enregistrer le texte brut dans le fichier correspondant
    if curl -s "$url" | lynx -stdin -dump -nolist >> "$filename"; then
        echo "Contenu extrait de $url et sauvegardé dans $filename"
    else
        echo "Erreur lors de la récupération de $url"
    fi

    # Incrémenter le compteur pour le prochain fichier
    ((counter++))

done < "$1"
