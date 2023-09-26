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

Une des raisons est la recherche de pérennité dans ma méthodologie; je réfléchissais à une façon de backup simplement toutes les données non-Git de GitHub. Une autre est que j'utilisais un bug tracker local pour certains projets, [Redmine](https://www.redmine.org), sans pouvoir partager facilement cette information avec d'autres personnes (en plus de me poser des problèmes à chaque mise à jour d'Arch Linux).

Je désirais alors un bug tracker distribué. J'ai trouvé des projets comme [git-bug](https://github.com/MichaelMure/git-bug), mais sans être convaincu par leurs caractéristiques. Je souhaitais à ce moment là rester avec Git, de par son omniprésence, et Fossil me semblait alors faire un peu trop de choses. Mais sans alternative, j'ai donc commencé à creuser vers Fossil.

Finalement, Fossil rejoint petit à petit SQLite dans la liste de mes projets préférés. La [documentation](https://fossil-scm.org/home/doc/trunk/www/permutedindex.html) de Fossil contient déjà beaucoup d'informations sur ses points forts et ses limitations, je vais donc m'en tenir aux points qui m'importent le plus.

- Gestionnaire de projet distribué: tickets, wiki, doc, forum, etc. Toute l'information importante est distribuée et donc facile à partager, durable.
- Le fait que les différents modules de Fossil soient étroitement couplés permet d'avoir une certaine synergie:
  - Le système de wiki semble peu pertinent si on préfère la documentation intégrée, pourtant il permet de créer des notes pour d'autres éléments comme les check-ins, les branches ou les tags.
  - Fossil permet de facilement référencer un *artifact* ou élément du projet et implémente quelques backlinks ou hints (e.g. un ticket fermé est rayé) sur les liens.
  - Le système de forum pourrait dans le [futur](https://fossil-scm.org/forum/forumpost/a05a1d7d0ae4e32eb3573cd0f7567716cef153e05a44cef620fc63c687935e63) servir de système de discussion attaché à des éléments spécifiques.
  - Les différentes features utilisent le même système de documentation (Markdown, [Pikchr](https://pikchr.org/home), etc.)[^1].
- Plus besoin de dépendre de GitHub, Redmine et [AsciiDoctor](https://asciidoctor.org)/[Antora](https://antora.org).
  - GitHub est propriétaire, rien ne garanti que le système sera toujours accessible, modifiable ou dans un état acceptable. En plus d'être non distribué et complexe.
  - Redmine est beaucoup plus complexe qu'un bug tracker, la seule feature que j'utilisais.
  - Avec la feature de recherche de Fossil, les cross-references et le support du Markdown, AsciiDoctor et Antora perdent de leur intérêt.
  - Redmine et AsciiDoctor sont écrit en Ruby, qui ne fait pas partie de ma méthodologie, et ont des codebases relativement conséquentes.
- J'aime l'idée qu'un *commit* soit un *commitment*. Ne pas avoir la possibilité de modifier l'historique semble simplifier le système et le processus de développement. J'ai la sensation d'avoir jusqu'à présent fait quelque chose d'inutile; une forme de [bikeshedding](https://en.wiktionary.org/wiki/bikeshedding).
- Fossil est écrit en C et s'appuie sur SQLite, qui font déjà partie de ma méthodologie.
- Bien documenté, avec un [format](https://fossil-scm.org/home/doc/trunk/www/fileformat.wiki) simple et durable.
- Plus portable que Git, léger.
- Plusieurs niveaux d'abstractions: une Web UI et une CLI[^2]. E.g. le rendu de la timeline de Fossil est très agréable.
- La synchronisation de Fossil repose sur le protocole HTTP, comme la Web UI. La Web UI est symétrique pour l'hébergement et pour la manipulation locale du projet; un serveur Fossil n'est qu'un dépôt spécial qui peut faire office de point de rendez-vous.
- Développé par des personnes qui semblent valoriser l'indépendance, la simplicité et la durabilité.

[^1]: Les check-ins ne supportent pas le Markdown actuellement.
[^2]: Command-Line Interface

Migrer vers un autre gestionnaire de version (ou projet) n'est pas sans conséquences, j'ai donc eu un certains nombres de réticences.

1. Git est omniprésent; utiliser autre chose implique une réduction de l'interopérabilité avec d'autres développeurs.
2. *Cathedral vs. Bazaar*. Fossil n'est pas optimisé pour recevoir des contributions "en vrac".
3. Les features de Fossil pourraient être trop simples par rapport à des systèmes spécialisés (bug tracker, wiki, forum, etc.).
4. Moins *scalable* que Git.
5. Absence de réécriture de l'historique.

Pour ce qui est du point **1** et **2**, pouvoir collaborer avec tout le monde de manière très découplée sonnait bien, mais j'ai réalisé avec le temps que ce n'est pas la manière de travailler qui me convient. Déjà, la plupart de mes projets sont *solo*; je n'ai pas l'intention de collaborer de manière *étroite*, i.e. sur la même codebase, avec d'autres personnes. Pour d'éventuels projets à plusieurs, ce serait en petit comité avec des personnes qui se comprennent et qui partagent une vision cohérente plutôt qu'avec un grand nombre de personnes divergentes. Cela n'exclue pas la discussion, des suggestions ou la soumission de patchs (ensuite adaptés), ce qui serait plutôt une forme de collaboration *distante* (en opposition à étroite).

Pour le point **3** et **4**, je ne pense pas avoir un jour besoin de plus que ce dont SQLite a besoin pour son développement. Les features de Fossil me paraissent essentielles et suffisantes.

Le point **5**, déjà évoqué plus haut, semblait être plus un problème de familiarité qu'un réel obstacle.

## Un nom de domaine
