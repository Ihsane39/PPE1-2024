# Journal de bord du projet encadré
## Exercice Classement par arborescence Donné le 25/09/24 réalisé le 28/09/24
 Je n’ai pas réussi à zipper par le biais de mon terminal. J’ai dû le faire par l’interface graphique. Clique droit souris puis « compressé »

## Exercice intro git du 02/10/24
 Etait très difficile pour moi. J'aurais besoin de plusieus exercice avant de savoir bien gérer mon dépôt durant cette année de master

## Exercice Pipelines : mise en pratique 09/10/24 réalisé le 13/10/24
 Les piplines sont encore un concept absterets pour moi. L'exercie était chronophage. Certaines commandes m'étaient inconnues. Je n'avais pas le bon résultas comme vous le constaterez dans les fichers. J'ai dû faire appel l'aide d'une autre personne pour corriger et comprendre mes erreurs. 


# Séance 3	
## Exercices git correction d’erreurs
 Git II : corriger des erreurs
 Première erreur
 Deuxième erreur catastrophique
 Je suis complétment perdue entre tous les git
 Exercices git correction d’erreurs
 Cette ligne doit être mise de côté

Exercice 4.b
Anticiper et régler un conflit potentiel
On souhaite à présent voir sur la version locale si nous sommes à jour par rapport à la version en ligne. Quelle(s)
commande(s) pouvez-vous utiliser ?

git fetch: cette commande met à jour les dernières modifications depuis le dépôt distant sans les fusionner immédiatement à la branche locale
git log origin/main...main: cette commande affiche l'historique des commits dans Git, en comparant deux branches : la branche locale main et la branche distante origin/main.

Normalement, vous verrez que vous avez 1 commit de retard par rapport au dépôt en ligne. Tentez de récupérer
les changements, que se passe-t-il ?

Je n'ai pas eu de conflit tel que c'est décrit dans l'exercice. Mais j'ai eu la branche main et la branche head qui ont divergé, je les ai refusionné avec la fonction git merge

On souhaite garder dans un coin les changements effectués en local pour les appliquer après avoir récupéré les
modification de la version en ligne. On souhaite indiquer le message "Conservation des changements séance 3".
On ne souhaite pas encore appliquer ces changements. Quelle(s) commande(s) utiliser ?

git stash push -m "Conservation des changements séance 3" : cette commande enregistre les modifications qui ne doivent pas être commit dans une pile de stashes et permet d'ajouter un message descriptif
git pull: cette commande récupére les modifications du dépôt en ligne


Supposons que nous avons laissé quelques jours notre dépôts et que notre mémoire nous fait défaut. Quelle(s)
commande(s) utiliser pour voir la liste des changements conservés et ce qu’ils contiennent ?

git show: cette commande affiche des informations sur tout fichier git
git stash list: cette commande montre tous les changements "stashés" (mis de côté) jusqu'à présent.

En théorie, vous n’avez qu’un seul tas de changements conservés. Une fois appliqués, on ne souhaite plus voir
les changements en utilisant les commandes du paragraphe précédent. Quelle(s) commande(s) utiliser ?
Une fois les changements appliqués, effectuez les opérations nécessaires pour les pousser sur le dépôt distant.

git stash pop : cette commande applique les changements du  dernier stash 

# Séance 4
## Exercices script Bahs
Fonctionnement du script Bash

Ce script Bash vérifie la validité des URLs dans un fichier passé en argument. Voici les étapes détaillées de son fonctionnement :

1. Le script commence par vérifier le nombre d'arguments passés lors de l'exécution. S'il n'y a pas exactement un argument, le script affiche un message "ce programme demande un argument" et se termine immédiatement.

2. La variable `FICHIER_URLS` est initialisée avec le premier argument passé au script. Cette variable est censée contenir le chemin vers un fichier texte dans lequel chaque ligne représente une URL.

3. Deux variables, `OK` et `NOK`, sont initialisées à 0. Ces variables comptent respectivement le nombre de lignes valides (celles qui ressemblent à des URLs) et le nombre de lignes invalides.

4. Le script utilise une boucle `while` pour lire chaque ligne du fichier spécifié. À chaque itération :
   - La ligne est affichée sur la sortie standard avec le texte "la ligne :".
   - Le script tente ensuite de vérifier si la ligne correspond à une URL en utilisant une expression régulière (regex) qui cherche des chaînes commençant par `http` ou `https`.
   - Si la ligne correspond à la regex, un message "ressemble à une URL valide" est affiché, et la variable `OK` est incrémentée.
   - Si la ligne ne correspond pas à la regex, un message "ne ressemble pas à une URL valide" est affiché, et la variable `NOK` est incrémentée.

5. À la fin de la boucle, le script affiche le nombre total d'URLs valides et de lignes douteuses (non conformes) en utilisant les valeurs des variables `OK` et `NOK`.

 - Le script utilise la commande `exit` sans préciser de code de sortie, ce qui signifie que le code par défaut (0) sera utilisé.

# Séance 5
## Réponse question 1: 
mini-projet

1. Il ne faut pas utilist la commande "cat" car elle va lire entièrement le fichier en une seule fois et elle n'est pas idéale pour manipuler chaque ligne individuellement dans script Bash.
2. Pour transformer "urls/fr.txt" en paramètre du script il faut ajoutet les lignes suivantes: 
#!/bin/bash

# Vérification de l'argument
if [ -z "$1" ]; then
    echo "Erreur : Vous devez spécifier un fichier en argument."
    exit 1
fi

# Lecture du fichier passé en argument
while read -r line; do
    echo "$line"
done < "$1"

 $1 représente le premier argument passé au script (le chemin du fichier).
 Pour vérifier le passage d'argument j'ai mis en place la condition if  qui va vérifier la présence du premier argument si aucun argument n'est passé, le script affiche une erreur et se termine avec exit 1. 

3. Pour afficher le numéro de ligne avant chaque URL (sur la même ligne) il faut ajouter un compteur et l'incrementer pour chaque tour de la boucle while et l'afficher en débute de ligne en séparant par une tabulation (\t).

1.1 les erreurs peuvent être corrigées : j'ai modifié deux urls le 3 et le 9:
 le 3 avait le code erreur 301 signifie que la page a été déplacée. le lien lui manquait le https:// car  curl ne peut pas lire sans le http.
 le 9 avait le code erreur 404  signifie que la page est inexistante; donc j'ai chercheé le lien qui correpond. 
 Donc j'ai mofifié ces deux liens par des liens fonctionnels.

Je n'ai pas compris la cosigne sur tableaux: tableau-fr.tsv (cette semaine uniquement)

# Séance 7
## Le style déploiment de page (htm,css et Bulma)

Le html et le css j'arrive un peu mieux que Bulma.
Je ne comprends pass comme fonctionne l'intégration de style Bulma dans un scritp html. Or que c'est du syle et doit être logiquement dans le script CSS.
De plus lorsque j'ai regardé le site **https://bulma.io/documentation/features/skeletons/** en détail je ne vois pas le style approprement parlé mais plutôt des fonctionnalités comme des boutons clicables qui mène vers des liens, des exemples de commandes formulaires ect..
