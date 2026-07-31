# TP1 — Rapport

## 1. Pourquoi --no-verify fonctionne, et la parade

Le hook pre-commit s'exécute côté client, sur la machine du développeur, qui en a le
contrôle total. --no-verify demande à Git de sauter cette étape, ce que rien n'empêche
techniquement. La seule parade efficace est de rejouer les mêmes vérifications côté
serveur (CI/CD) et de rendre leur succès obligatoire via une protection de branche.
Je l'ai vérifié concrètement : mon commit avec --no-verify est passé en local, mais une
fois la protection activée sur main, le push a été refusé par GitHub....

## 2. Le secret était-il sur le distant ? Que faire en premier ?

...
Le hook pre-commit s'exécute côté client, sur la machine du développeur, qui en a le
contrôle total. --no-verify demande à Git de sauter cette étape, ce que rien n'empêche
techniquement. La seule parade efficace est de rejouer les mêmes vérifications côté
serveur (CI/CD) et de rendre leur succès obligatoire via une protection de branche.
Je l'ai vérifié concrètement : mon commit avec --no-verify est passé en local, mais une
fois la protection activée sur main, le push a été refusé par GitHub.
## 3. Mutabilité des tags et incident tj-actions/changed-files

...
Un tag Git est un simple pointeur nommé, mutable : rien n'empêche de le faire pointer
vers un autre commit. Dans l'incident de mars 2025, l'attaquant a compromis le jeton du
bot et réécrit tous les tags de version pour pointer vers un commit malveillant unique.
Tous les workflows référençant l'action par tag (@v45) ont exécuté du code malveillant
sans qu'aucune configuration cliente n'ait changé. Seul l'épinglage par empreinte de
commit complète (immuable) aurait protégé totalement.
## 4. Trois éléments relevant de la CMDB au sens ITIL

...

- L'historique Git (git log) : qui a changé quoi, quand, pourquoi, via les messages
  Conventional Commits.
- Le fichier .terraform.lock.hcl : versions et empreintes exactes des providers utilisés.
- L'arborescence envs/dev, envs/staging, envs/prod : éléments de configuration par
  environnement et leurs relations.
