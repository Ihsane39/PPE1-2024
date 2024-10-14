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
