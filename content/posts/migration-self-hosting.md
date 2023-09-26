+++
title = "Migration du blog et des projets."
date = 2023-09-21
draft = true
tags = ["blog"]
+++

J'ai récemment décidé de migrer ce blog et mes projets pour du *self-hosting*, i.e. via mon propre nom de domaine et serveur.

Utiliser [GitHub](https://github.com) comme plateforme d'hébergement était plutôt simple: pas besoin de gérer un serveur ou de trouver un nom de domaine acceptable. Cependant, plusieurs réflexions ont fini par converger vers ce besoin d'auto-hébergement.

## Migration vers Fossil

Je ne sais plus exactement comment, mais [Fossil](https://fossil-scm.org) a commencé à capter de plus en plus mon attention. La première fois que j'ai appris l'existence du projet, c'est probablement via SQLite.

Une des raisons est la recherche de pérennité dans ma méthodologie; je réfléchissais à une façon de backup simplement toutes les données non-Git de GitHub. Une autre est que j'utilisais un bug tracker local pour certains projets, Redmine, sans pouvoir partager facilement cette information avec d'autres personnes (en plus de me poser des problèmes à chaque mise à jour d'Arch Linux).

Je désirais alors un bug tracker distribué. J'ai trouvé des projets comme [git-bug](https://github.com/MichaelMure/git-bug), mais sans être convaincu par leurs caractéristiques. Je souhaitais à ce moment là rester avec Git, de par son omniprésence, et Fossil me semblait alors faire un peu trop de choses. Mais sans alternative, j'ai donc commencé à creuser vers Fossil.

Finalement, Fossil rejoint petit à petit SQLite dans la liste de mes projets préférés. La [documentation](https://fossil-scm.org/home/doc/trunk/www/permutedindex.html) de Fossil contient déjà beaucoup d'informations sur ses points forts et ses limitations, je vais donc m'en tenir aux points qui m'importent le plus.

- Gestionnaire de projet distribué: tickets, wiki, doc, forum, etc. Toute l'information importante est distribuée et donc facile à partager, durable.
- Plus besoin de dépendre de GitHub, [Redmine](https://www.redmine.org) et [AsciiDoctor](https://asciidoctor.org)/[Antora](https://antora.org).
  - GitHub est propriétaire, rien ne garanti que le système sera toujours accessible, modifiable ou dans un état acceptable. En plus d'être non distribué et complexe.
  - Redmine est beaucoup plus complexe qu'un bug tracker, la seule feature que j'utilisais.
  - Avec la feature de recherche de Fossil, les cross-references[^1] et le support du Markdown, AsciiDoctor et Antora perdent de leur intérêt.
  - Redmine et AsciiDoctor sont écrit en Ruby (qui ne fait pas partie de ma méthodologie) avec des codebases conséquentes.
- Fossil s'appuie sur SQLite qui fait déjà partie de ma méthodologie: pas besoin de format bespoke (*packfiles*).
- Écrit en C, qui fait partie de ma méthodologie.
- Bien documenté, avec un format simple et durable.
- Plus portable que Git, léger.
- Plusieurs niveaux d'abstractions: une Web UI et une CLI. E.g. le rendu de la timeline de Fossil est très agréable.
- La synchronisation de Fossil repose sur le protocole HTTP, comme la Web UI. La Web UI est symétrique pour l'hébergement et pour la manipulation locale du projet; un serveur Fossil n'est qu'un dépôt spécial qui peut faire office de point de rendez-vous.
- Développé par des personnes qui semblent valoriser l'indépendance, la simplicité et la durabilité.

[^1]: Fossil permet de facilement référencer n'importe quelle donnée du projet et implémente quelques backlinks ou hints (un ticket fermé est rayé) sur les liens.

**Les inconvénients:**

- Les features pourraient être trop simple.
- Bien moins connu que Git et GitHub; moins interopérable.
- Absence de réécriture de l'historique ?
- La cathédrale plutôt que le bazaar ?
- Moins scalable que Git.

## Un nom de domaine
