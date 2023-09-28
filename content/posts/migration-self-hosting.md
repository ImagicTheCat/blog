+++
title = "Migration du blog et des projets."
date = 2023-09-28
tags = ["blog", "programming"]
+++

J'ai récemment décidé de migrer ce blog et mes projets pour du *self-hosting*, i.e. via mon propre nom de domaine et serveur.

Le blog est déplacé vers [imagicthecat.thul.fr](https://imagicthecat.thul.fr) et mes projets sont dorénavant gérés via [Fossil](https://fossil-scm.org). La migration des projets est progressive et certains d'entre eux archivés sur [GitHub](https://github.com) ne seront peut-être jamais migrés.

**Les projets sont disponibles à ces endroits:**

- *self-hosted* [Upstream](https://imagicthecat.thul.fr/fossils)
- Miroir sur [Chisel](https://chiselapp.com/user/imagicthecat/)
- Miroir (code uniquement) sur [GitHub](https://github.com/ImagicTheCat) 

Si certains de mes projets vous intéressent particulièrement, n'hésitez pas à les cloner / synchroniser sur vos machines afin d'accroître leur pérennité.

La suite de l'article détaille les raisons de cette migration.

---

Utiliser GitHub comme plateforme d'hébergement est plutôt simple: pas besoin de gérer un serveur ou de trouver un nom de domaine acceptable. Cependant, plusieurs réflexions ont fini par converger vers ce besoin d'auto-hébergement.

## Migration vers Fossil

Fossil a commencé à capter de plus en plus mon attention.

Une des raisons est la recherche de pérennité dans ma méthodologie; je réfléchissais à une façon de sauvegarder simplement toutes les données non-Git de GitHub. Une autre est que j'utilisais un bug tracker local pour certains projets, [Redmine](https://www.redmine.org), sans pouvoir partager facilement cette information avec d'autres personnes (en plus de me poser des problèmes à chaque mise à jour d'Arch Linux).

Je désirais alors un bug tracker distribué. J'ai trouvé des projets comme [git-bug](https://github.com/MichaelMure/git-bug), mais sans être convaincu par leurs caractéristiques. Je souhaitais continuer d'utiliser Git, de par son omniprésence, et Fossil me semblait alors faire un peu trop de choses. Mais sans alternative, j'ai donc commencé à creuser vers Fossil.

Finalement, Fossil rejoint petit à petit SQLite dans la liste de mes projets préférés. Sa [documentation](https://fossil-scm.org/home/doc/trunk/www/permutedindex.html) contient déjà beaucoup d'informations sur ses points forts et ses limitations, je vais donc m'en tenir aux points qui m'importent le plus.

- Gestionnaire de projet distribué: tickets, wiki, doc, forum, etc. Toute l'information importante est distribuée et donc facile à partager et préserver.
- L'étroit couplage des différents modules de Fossil permet d'avoir synergie et simplification:
  - Le système de wiki semble peu pertinent si on préfère la documentation intégrée, pourtant il permet de créer des notes pour d'autres éléments comme les *check-ins*, les branches ou les tags.
  - Fossil permet de facilement référencer un *artifact* ou élément du projet et implémente des *backlinks* et *hints* (e.g. un ticket fermé est rayé).
  - Les différentes features utilisent le même système de documentation (Markdown, [Pikchr](https://pikchr.org/home), etc.).[^1]
  - La timeline est autant utile pour les *check-ins* que pour les autres *artifacts*.
  - Le système de forum pourrait dans le [futur](https://fossil-scm.org/forum/forumpost/a05a1d7d0ae4e32eb3573cd0f7567716cef153e05a44cef620fc63c687935e63) servir de système général de discussion attaché à des éléments spécifiques.
- Plus besoin de dépendre de GitHub, Redmine et [AsciiDoctor](https://asciidoctor.org)/[Antora](https://antora.org):
  - GitHub est propriétaire, rien ne garanti que le système sera toujours accessible, flexible ou dans un état acceptable. En plus d'être non distribué et complexe.
  - Redmine est beaucoup plus complexe qu'un bug tracker, la seule feature que j'utilisais.
  - Avec la feature de recherche de Fossil et le support du Markdown/HTML, AsciiDoctor et Antora ont perdu encore plus de leur intérêt dans ma méthodologie.
  - Redmine, AsciiDoctor et Antora ont des codebases relativement conséquentes écrites dans des langages qui ne font pas partie de ma méthodologie.[^2]
- J'aime l'idée qu'un *commit* soit un *commitment*. Ne pas avoir la possibilité de modifier l'historique semble simplifier le système et le processus de développement.
- Interfaces à différents niveaux d'abstractions: une Web UI et une CLI[^3]. E.g. le rendu de la timeline de Fossil est très agréable et je peux facilement synchroniser et consulter mes projets hors-ligne sur un *ordinateur de poche*; dans mon cas Android, via [termux](https://termux.dev).
- La synchronisation de Fossil repose sur le protocole HTTP, comme la Web UI. Cette dernière est symétrique pour l'hébergement et pour la manipulation locale du projet: un serveur Fossil est un dépôt spécial qui fait office de point de rendez-vous.
- Plus portable que Git et léger.
- Fossil est écrit en C et s'appuie sur SQLite, qui font déjà partie de ma méthodologie.
- Bien documenté, avec un [format](https://fossil-scm.org/home/doc/trunk/www/fileformat.wiki) simple et durable.
- Développé par des personnes qui semblent valoriser l'indépendance, la simplicité et la durabilité.

[^1]: Les *check-ins* ne supportent pas le Markdown actuellement.
[^2]: Qu'un outil soit simple et développé dans un langage que je maîtrise est un plus car cela me permet de l'adapter à mes besoins ou de le maintenir en cas d'abandon. Un exemple qui me semble pertinent est le [Lua](https://lua.org): l'implémentation officielle est suffisamment simple (~20 000 C SLOC via [scc](https://github.com/boyter/scc)) pour être maintenue par une seule personne.
[^3]: Command-Line Interface

Migrer vers un autre gestionnaire de version (ou projet) n'est pas sans conséquences, j'ai donc eu un certain nombre de réticences:

1. Git est omniprésent; utiliser autre chose implique une réduction de l'interopérabilité avec d'autres développeurs.
2. *Cathedral vs. Bazaar*.[^4] Fossil n'est pas optimisé pour recevoir des contributions tierces / *drive-by*.
3. Les features de Fossil pourraient être trop simples par rapport à des systèmes spécialisés (bug tracker, wiki, forum, etc.).
4. Moins *scalable* que Git.
5. Absence d'outils pour réécrire l'historique.

[^4]: <https://en.wikipedia.org/wiki/The_Cathedral_and_the_Bazaar>

Pour ce qui est des points **1.** et **2.**, l'idée de collaborer avec tout le monde de manière très découplée me plaisait, mais j'ai réalisé avec le temps que ce n'est pas une façon de travailler qui me convient.

Déjà, la plupart de mes projets sont *solo*; je n'ai pas l'intention de collaborer de manière *étroite*, i.e. sur la même codebase, avec d'autres personnes. Pour d'éventuels projets à plusieurs, ce serait sûrement en petit comité avec des personnes qui se comprennent, se complètent et partagent une vision cohérente plutôt qu'avec un grand nombre de personnes divergentes.

Cela n'exclue pas la discussion, des suggestions ou la proposition de patchs (potentiellement ensuite adaptés), ce qui serait alors plus une forme de collaboration *distante* (en opposition à étroite).

Pour les points **3.** et **4.**, je ne pense pas avoir un jour besoin de plus que ce dont SQLite a besoin pour son développement. Les features de Fossil me paraissent essentielles et suffisantes.

Le point **5.**, déjà évoqué plus haut, semble plus être un problème de familiarité qu'un réel obstacle.

*En résumé, Fossil simplifie considérablement ma méthodologie et résout certains problèmes.*

## Un nom de domaine

Un nom de domaine est un composant essentiel à la présence numérique, particulièrement pour les URLs[^5]. Dépendre de services comme GitHub ne permet pas de gérer cette présence numérique de manière pérenne; par exemple, pour assurer la durabilité des liens aux différentes ressources que l'on souhaite partager.

[^5]: Uniform Resource Locator

Maintenir un nom de domaine tout au long de sa vie n'est pas très cher payé pour être indépendant. L'aspect pratique de systèmes propriétaires est séduisant, mais conduit au [vendor lock-in](https://en.wikipedia.org/wiki/Vendor_lock-in).

Ceci étant dit, j'utilise quand même GitHub en tant que miroir (code uniquement) dans un but de préservation des projets. En plus d'être une backup, ça permet d'éventuellement bénéficier d'initiatives comme l'[Arctic Vault](https://archiveprogram.github.com/arctic-vault/).
