Voici un exemple de fichier `README.md` pour votre API simple en PHP et MySQL.

```markdown
# API REST Simple en PHP et MySQL

Cette API REST simple, développée en PHP, permet de récupérer des données depuis une base de données MySQL. L'API répond aux requêtes `GET` et retourne une liste de produits au format JSON.

## Prérequis

Avant de commencer, assurez-vous d'avoir les éléments suivants installés sur votre machine :

- **PHP** (version 7.0 ou plus récente)
- **MySQL** (ou un autre serveur de base de données compatible)
- Un serveur HTTP tel qu'Apache ou Nginx

## Installation

1. **Cloner le dépôt :**
   ```bash
   git clone https://github.com/niedjo/simple-api-php.git
   cd simple-api-php
   ```

2. **Configurer la base de données :**

   - Créez une base de données MySQL nommée `api_rest`.
   - Importez le fichier `api_rest.sql` dans votre base de données pour créer la table `categories` avec les données nécessaires.
   - Mettez à jour les informations de connexion à la base de données dans le fichier `index.php` si nécessaire :
     ```php
     $server = 'localhost';
     $dbname = 'api_rest';
     $username = 'root';
     $password = '';
     ```

3. **Déployer l'API :**

   - Placez les fichiers PHP sur votre serveur (Apache, Nginx, etc.).
   - Assurez-vous que le serveur est configuré pour exécuter des scripts PHP.

## Utilisation de l'API

### Endpoint : Récupérer les produits

- **Méthode HTTP** : `GET`
- **URL** : `http://simple-api-php.atwebpages.com/`

#### Réponse JSON

L'API retourne les données suivantes au format JSON :

```json
{
    "produits": [
        {
            "id": "1",
            "nom": "Produit 1",
            "description": "Description du produit 1",
            "prix": "100.00",
            "categories_id": "1"
        },
        {
            "id": "2",
            "nom": "Produit 2",
            "description": "Description du produit 2",
            "prix": "200.00",
            "categories_id": "2"
        }
    ]
}
```

### Gestion des erreurs

- Si la méthode HTTP n'est pas `GET`, l'API renvoie une réponse `405 Method Not Allowed` avec le message suivant :

```json
{
    "message": "la methode n'est pas autorisee"
}
```

## Tester l'API avec JavaScript

Un exemple simple pour tester l'API avec JavaScript est fourni dans le fichier `index.html`. Ce script envoie une requête `GET` à l'API et affiche les produits dans un élément HTML :

```javascript
let donnees = document.querySelector('.donnees')

const recuperer = async () => {
    try {
        fetch("http://simple-api-php.atwebpages.com/index.php")
       .then(data => data.json() )
       .then((body) => {
        donnees.innerText = JSON.stringify(body["produits"]);
       })
    }
    catch (error) {
        console.log(error)
    }
}

recuperer();
```

## Auteur

- **Votre Nom** - [Votre Profil GitHub](https://github.com/niedjo)

## License

Ce projet est sous licence MIT.