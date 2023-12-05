#!/bin/bash

# Mise à jour du dépôt local
git checkout dev
git pull

# Exécution des tests
python test.py

if [ $? -eq 0 ]; then
    # Si les tests passent, rebase dev sur master et push des modifications
    git rebase dev master
    git push origin dev
    echo "Tests passed"

else
    # Récupère la date pour créer la branche failure
    current_date=$(date "+%F-%Hh-%Mm-%Ss")
    failure_branch="failures/$current_date"

    # Crée une nouvelle branche failure
    git checkout -b "$failure_branch"

    # Ajoute les fichiers qui ont échoué aux tests dans la branche failure
    # Assurez-vous d'ajouter les fichiers spécifiques à votre situation
    # Exemple : cp chemin/vers/fichier_echec.py ./$failure_branch

    # Commit des modifications dans la branche failure
    git add .
    git commit -m "Tests failed on $current_date"

    # Pousse la branche failure sur le dépôt distant
    git push origin "$failure_branch"
    echo "Test failed"
    exit 1
fi

# Attend une interaction de l'utilisateur avant de fermer le terminal
read -p "Appuyez sur Entrée pour quitter le terminal."
