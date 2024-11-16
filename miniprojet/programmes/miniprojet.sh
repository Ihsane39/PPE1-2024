#!/bin/bash

# Vérification de l'argument
if [ -z "$1" ]; then
    echo "Erreur : Vous devez spécifier un fichier en argument."
    exit 1
fi

#Déclartion d'une variable
output_html="../tableaux/tableau-fr.html"

echo "<!DOCTYPE html>" > $output_html
echo ' <html lang="fr">' >> $output_html
echo "     <head>" >> $output_html
echo "        <title>A simple HTML</title>" >> $output_html
echo '        <meta charset="UTF-8" />' >> $output_html
echo '         <link rel="stylesheet" type="text/css" href="IG.css" />' >> $output_html

echo "     </head>" >> $output_html

echo "     <body>" >> $output_html

echo '     <div style="width: 80%; margin: 0 auto; padding-top: 15px;">' >> $output_html
echo '     <table border="1" width="100%"> ' >> $output_html
echo '            <caption style="padding-bottom:20px;"><strong><u><center>Suite de Miniprojet</center></strong></u></caption> ' >> $output_html
echo "         <thead> " >> $output_html
echo "             <tr> " >> $output_html
echo '                 <th style="border: auto solid black; padding: 10px;">Nombre URL</th>' >> $output_html
echo '                 <th style="border: 1px solid black; padding: 10px;">Les URLS</th>' >> $output_html
echo '                 <th style="border: 1px solid black; padding: 10px;">Code htttp</th> ' >> $output_html
echo '                <th style="border: 1px solid black; padding: 10px;">Nombre de Tokens</th>' >> $output_html
echo '                 <th style="border: 1px solid black; padding: 10px;">Encodage html</th>' >> $output_html
echo "             </tr> " >> $output_html
echo "         </thead>" >> $output_html
echo "         <tbody> " >> $output_html

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
            echo "<tr>" >> $output_html
            echo "  <td> $line_number </td>" >> $output_html
            echo "  <td> $line </td>" >> $output_html
            echo "  <td> $code_http </td>" >> $output_html
            echo "  <td> $countword </td>" >> $output_html
            echo "  <td> $encodding </td>" >> $output_html
            echo "</tr>" >> $output_html
            echo -e "${line_number}\t${line}\t${code_http}\t${countword}\t${encodding}"
            ((line_number++))  # Incrémentation du numéro de ligne
        done < "$1"
echo "        </tbody>" >> $output_html
echo "    </table>" >> $output_html
echo "    </div>" >> $output_html
echo "    </body>" >> $output_html
echo "</html>" >> $output_html
