+++
title = "Migration du blog et des projets."
date = 2023-09-21
draft = true
tags = ["blog"]
+++

J'ai récemment décidé de migrer ce blog et mes projets pour du *self-hosting*, i.e. via mon propre nom de domaine et serveur.

Utiliser GitHub comme plateforme d'hébergement était plutôt simple: pas besoin de gérer un serveur exposé ou de trouver un nom de domaine acceptable. Cependant, plusieurs réflexions ont fini par converger vers ce besoin d'auto-hébergement.

## La découverte de Fossil

Je ne sais plus exactement comment, mais [Fossil](https://fossil-scm.org) a commencé à capter de plus en plus mon attention. La première fois que j'ai appris l'existence du projet, c'est probablement via SQLite.

Une des raisons est la recherche de pérennité dans ma méthodologie; je réfléchissais à une façon de backup simplement toutes les données non Git de GitHub. Une autre est que j'utilisais un bug tracker local pour certains projets, Redmine, sans pouvoir partager facilement cette information avec d'autres personnes (en plus de me poser des problèmes à chaque mise à jour d'Arch Linux).

Je désirais alors un bug tracker distribué. J'ai trouvé des projets comme [git-bug](https://github.com/MichaelMure/git-bug), mais sans être convaincu par leurs caractéristiques. Je souhaitais à ce moment là rester avec Git, de par son omniprésence, et Fossil me semblait alors faire un peu trop de choses. Mais sans alternative, j'ai donc commencé à creuser vers Fossil.

Je considérais déjà SQLite comme un de mes projets préférés et Fossil, par le/les mêmes auteurs (et créé pour SQLite), s'est finalement ajouté à la liste. Fossil a énormément d'avantages et la question est rapidement devenue: Quels sont les inconvénients ? Est-ce que ça me conviendra pour les (potentielles) décennies à venir ?

**Les avantages:**

- Gestionnaire de projet distribué: tickets, wiki, doc, forum, etc. Plus besoin d'essayer de backup des systèmes obscurs et l'information est facilement distribuable.
- Plus besoin de dépendre de GitHub, Redmine ou AsciiDoctor.
- Plus portable que Git, léger.
- Bien documenté, un format simple et durable.
- Fossil s'appuie sur SQLite qui fait déjà partie de ma méthodologie: pas de format bespoke de *packfiles*.
- Plusieurs niveaux d'abstractions: une Web UI et une CLI. Le rendu de la timeline de Fossil est vraiment très cool.
- La synchronisation de Fossil repose sur le protocol HTTP: simplicité.
- Écrit en C, qui fait partie de ma méthodologie.
- Développé par des personnes qui, selon moi, valorisent l'indépendance, la simplicité et la durabilité.

**Les inconvénients:**

- Les features pourraient être trop simple.
- Bien moins connu que Git et GitHub; moins interopérable.
- Absence de réécriture de l'historique ?
- La cathédrale plutôt que le bazaar ?
- Moins scalable que Git.

### La cathédrale

## Un nom de domaine
