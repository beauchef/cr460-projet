# Commandes

## Étape 1: Créer l'image Docker de Wordpress

Batir l'image: `docker build .`
Repérer l'ID de la nouvelle image: `docker images`
Tagger l'image: `docker tag c42953e5abaf beauchef/wordpress:4.7`

## Étape 2: Créer le cluster sur Google Cloud Platform

Dans la section `Container Engine`, sélectionner `CREATE CLUSTER`.
Donner le nom `cr460`, et choisir la zone `us-east1-b`.
Choisir des machines `small` (bien que micro devrait suffire) et une taille de 3.
Laisser le reste par défaut, et cliquer sur `Create` en bas.

## Étape 3: Créer la base de donnée sur Google Cloud Platform

Dans la section `SQL`, créer une nouvelle base de donnée en cliquant sur `CREATE INSTANCE`.
Créer une BD MySQL de 2nd génération avec comme nom `wordpress`.
Sélectionner le région `us-east1` et la zone `us-east1-b`.
Tout en bas, cliquer sur `+ Add network` et mettre le nom `all` et le network `0.0.0.0:0`.
Laisser le reste par défaut et cliquer sur `Create`.
Lorsque la BD sera prête, cliquer sur celle-ci.
Dans la section `Access Control`, puis `Users`, créer un user `wordpress` avec le mot de passe `password`.
Dans la section `Databases`, cliquer sur `New database`, et créer la BD `wordpress`.

## Étape 4: Effectuer le déploiement sur le cluster

Créer un entrée pour le cluster dans kubeconfig: `gcloud container clusters get-credentials cr460`
Vérifier que le cluster roule correctement: `kubectl cluster-info`
Puis exécuter successivement les fonctions suivantes:
  
  * `kubectl create -f .\wordpress-deployment.yaml`
  * `kubectl create -f .\wordpress-service.yaml`
  * `kubectl create -f .\wordpress-ingress.yaml`

