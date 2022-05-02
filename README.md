# Résumé
[![CircleCI](https://circleci.com/gh/Alaet/P13_New/tree/main.svg?style=svg&circle-token=a3a14bd4c4c474be0730e598030ffd5f3feb60a7)](https://circleci.com/gh/Alaet/P13_New/tree/main)

Site web d'Orange County Lettings

## Développement local

### Prérequis

- Compte GitHub avec accès en lecture à ce repository
- Git CLI
- SQLite3 CLI
- Interpréteur Python, version 3.6 ou supérieure

Dans le reste de la documentation sur le développement local, il est supposé que la commande `python` de votre OS shell exécute l'interpréteur Python ci-dessus (à moins qu'un environnement virtuel ne soit activé).

### macOS / Linux

#### Cloner le repository

- `cd /path/to/put/project/in`
- `git clone https://github.com/OpenClassrooms-Student-Center/Python-OC-Lettings-FR.git`

#### Créer l'environnement virtuel

- `cd /path/to/Python-OC-Lettings-FR`
- `python -m venv venv`
- `apt-get install python3-venv` (Si l'étape précédente comporte des erreurs avec un paquet non trouvé sur Ubuntu)
- Activer l'environnement `source venv/bin/activate`
- Confirmer que la commande `python` exécute l'interpréteur Python dans l'environnement virtuel
`which python`
- Confirmer que la version de l'interpréteur Python est la version 3.6 ou supérieure `python --version`
- Confirmer que la commande `pip` exécute l'exécutable pip dans l'environnement virtuel, `which pip`
- Pour désactiver l'environnement, `deactivate`

#### Exécuter le site

- `cd /path/to/Python-OC-Lettings-FR`
- `source venv/bin/activate`
- `pip install --requirement requirements.txt`
- `python manage.py runserver`
- Aller sur `http://localhost:8000` dans un navigateur.
- Confirmer que le site fonctionne et qu'il est possible de naviguer (vous devriez voir plusieurs profils et locations).

#### Linting

- `cd /path/to/Python-OC-Lettings-FR`
- `source venv/bin/activate`
- `flake8`

Un linting via le github-super-linter ([Super-Linter github](https://github.com/github/super-linter)) s'effectue 
lors de chaque commit sur la branche principale du projet (master).

#### Tests unitaires

- `cd /path/to/Python-OC-Lettings-FR`
- `source venv/bin/activate`
- `pytest`

#### Base de données

- `cd /path/to/Python-OC-Lettings-FR`
- Ouvrir une session shell `sqlite3`
- Se connecter à la base de données `.open oc-lettings-site.sqlite3`
- Afficher les tables dans la base de données `.tables`
- Afficher les colonnes dans le tableau des profils, `pragma table_info(Python-OC-Lettings-FR_profile);`
- Lancer une requête sur la table des profils, `select user_id, favorite_city from
  Python-OC-Lettings-FR_profile where favorite_city like 'B%';`
- `.quit` pour quitter

#### Panel d'administration

- Aller sur `http://localhost:8000/admin`
- Connectez-vous avec l'utilisateur `admin`, mot de passe `Abc1234!`

### Windows

Utilisation de PowerShell, comme ci-dessus sauf :

- Pour activer l'environnement virtuel, `.\venv\Scripts\Activate.ps1`
- Remplacer `which <my-command>` par `(Get-Command <my-command>).Path`


### Déploiement pour développement local

Il est nécessaire de configurer des variables d'environnements pour utiliser le projet localement sur votre machine.

Les variables nécessaires au déploiement sont à renseigner 
en variables d'environnement sur [CircleCI](https://circleci.com/docs/2.0/env-vars/).

Vous trouverez à la racine un fichier .env, sont à renseigner :

**ALLOWED_HOST** = 127.0.0.1, localhost

**DEBUG** = True

**SECRET_KEY** = Votre [clé secrète](https://djecrety.ir/)

**SENTRY_DSN** = Le DSN fournit par [Sentry](https://sentry.io/welcome/) pour votre projet

Il faut ensuite ajuster le fichier "settings.py" en commentant la ligne :

`environ.Env.read_env()`

Et en enlevant le commentaire de la ligne en dessous pour exécuter les variables d'environnement précédemment établi :

`environ.Env.read_env(env.str('.', '.env'), overwrite=True)`

À partir de là, il est possible d'utiliser docker pour créer une image [Docker](https://docs.docker.com/) locale sur 
votre machine.

## Déploiement

### Fonctionnement du déploiement

Le déploiement de l'application OC-lettings se fait via un pipeline CI/CD sur CircleCI qui exécute l'application, 
l'englobe dans un container Docker qui est ensuite déployé sur Heroku.

### Configuration requise au déploiement

### Installations

* #### Installation de Docker

Installez Docker sur votre poste en suivant les instructions au lien ci-dessous :

https://docs.docker.com/get-docker/

*  #### Installation d'Heroku

Installez Heroku sur votre poste en suivant les instructions au lien ci-dessous :

https://devcenter.heroku.com/articles/heroku-cli#install-the-heroku-cli

* #### Compte CircleCI

Il est nécessaire de se connecter sur le site CircleCi à l'adresse suivante afin de pouvoir surveiller la 
progression du pipeline CI/CD et y apporter des modifications si nécessaire :

Si votre compte CircleCi n'est pas lié à votre compte GitHub, allez dans *User Settings* à l'adresse ci-dessous et 
cliquez sur le bouton *Connect* de l'onglet GitHub :

https://app.circleci.com/settings/user

Les variables d'environnement de votre projet CircleCI sont paramétrables dans *Project Settings* -> *Environment 
Variables* et sont les suivantes :

**SECRET_KEY** = Votre clé secrète Django.  
**ALLOWED_HOSTS** = 127.0.0.1,localhost  
**DOCKER_LOGIN** = Le login de votre compte Docker Hub sur lequel l'image de l'application est envoyée.  
**DOCKER_PASSWORD** = Le mot de passe de votre compte Docker Hub sur lequel l'image de l'application est envoyée.  
**HEROKU_API_KEY** = La clé API de votre compte Heroku sur lequel l'application est déployée.  
**HEROKU_APP_NAME** = Le nom de votre application Heroku.  
**SENTRY_DSN** = Le DSN Sentry de votre application.  
**DEBUG** = False

* #### Compte Docker Hub

Si vous ne disposez pas d'un compte Docker Hub, inscrivez-vous à l'adresse suivante:

https://hub.docker.com/signup

* #### Compte Heroku

Si vous ne disposez pas d'un compte Heroku, inscrivez-vous à l'adresse suivante :

https://signup.heroku.com/

Récupérez votre clé API en allant dans les paramètres de votre compte utilisateur Heroku -> *Account settings* puis *API key*.

* #### Compte Sentry

Si vous ne disposez pas d'un compte Sentry, inscrivez-vous à l'adresse suivante :

https://sentry.io/signup/

Une fois votre projet créé, cliquez sur *Settings*, *Projects*, sélectionnez-le, puis dans la rubrique *SDK Setup*,
cliquez sur *Client Keys (DSN)* et récupérez votre DSN à renseigner dans les variables d'environnement.  

### Etapes nécessaires pour effectuer le déploiement

La première étape du déploiement est l'envoi d'un pull request sur la branche master du dépôt GitHub.

Ce pull request va déclencher le démarrage d'un pipeline sur le projet CircleCi lié au dépôt GitHub.

La première étape du pipeline est le test de l'application.

Si les tests échoues, les prochaines étapes ne sont pas effectuées.

En cas de succès, l'étape de linting est alors lancée.

Si le linting échoue, les prochaines étapes ne sont pas effectuées.

En cas de succès, un container Docker englobant l'application est créé conformément à l'image Docker et aux 
directives présentes dans le fichier Dockerfile du projet.

Si la conteneurisation échoue, la prochaine et dernière étape n'est pas effectuée.

En cas de succès, le conteneur englobant l'application est déployé sur Heroku et la nouvelle version de celle-ci 
est disponible à l'adresse ci-dessous :

oc-lettings-om.herokuapp.com