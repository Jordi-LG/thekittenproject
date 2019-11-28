# The Kitten Project

### Un site ou tu peux acheter des photos de petits chats trop mignons !

Ce site a été réalisé à Montpellier par:
* EL ADOUZI Marine
* HENNIN Paul
* LE GUET Jordi
* LE GUET Terence

___

## Installation
(en local)

```
git clone git@github.com:Jordi-LG/thekittenproject.git
bundle install
rails db:create
rails db:migrate
rails db:seed

rails server

```

Lien vers notre application:
```
https://thekittenproject.herokuapp.com/
```

___

## Gems rajoutées pour notre application:
* table_print
* devise
* dotenv
* faker
* aws-sdk-s3
* stripe
* jquery
* devise-guests
* active-admin

___

## Navigation
Sur notre site, en page d'accueil vous trouverez l'index des photos.

En tant que visiteur, il est possible de se créer un compte et de devenir User.

En tant que User, on peut accéder à son profil (le modifier)

Cliquer sur une photo vous renvoie à sa page show.

En tant que User et visiteur, il est possible d'ajouter la photo dans votre panier.

L'icone du panier, dans la navbar, vous renvoie à la page show du panier de l'utilisateur connecté ou du visiteur.

Sur la page show du panier, vous trouverez un recapitulatif de commande.

Sur cette même page, il est possible de supprimer un élément du panier.

En tant que User, la commande se fait via la gem Stripe

En tant que visiteur, il faut se créer un compte pour valider sa commande

## Features
1. En tant que visiteur:
  * Avoir un panier
  * Ajouter au panier
  * Voir son panier
  * Modifier les articles
  * Pour valider son panier, il faut se connecter ou créer un compte


2. Dashboard Admin
