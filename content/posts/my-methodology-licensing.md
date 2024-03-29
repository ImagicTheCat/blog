+++
title = "Ma méthodologie: choix d'une licence libre."
date = 2023-01-22
tags = ["programming", "methodology"]
+++

Cet article décrit mon point de vue et ma méthodologie actuelle pour choisir une licence libre.

## Copyleft vs. permissive

Ma perception est qu'il existe deux grandes catégories de licences: les virales/copyleft[^1] et les "permissives". Je n'aime pas vraiment le terme "permissives" parce qu'il sous-entend qu'une licence libre serait restrictive par défaut, ce qui est plutôt l'inverse pour moi.

[^1]: https://fr.wikipedia.org/wiki/Copyleft

- Exemple de licence virale/copyleft: [GPL-3.0](https://www.gnu.org/licenses/gpl-3.0.html)
- Exemple de licence permissive: [Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0)

Est-ce qu'une licence copyleft est "plus libre" qu'une licence non copyleft, ou l'inverse ?

Une licence non copyleft est concrètement plus libre en terme de *degrés de liberté* accordés. Cependant, la notion de liberté en société est un concept complexe. Par exemple, une liberté totale pour chaque individu impliquerait la capacité de nuire à la liberté d'autrui, ne permettant pas une liberté totale.

> La liberté des uns s'arrête là où commence celle des autres.

— proverbe célèbre

Une licence copyleft prend par exemple en compte l'importance de la réciprocité du partage et l'impose à travers ses conditions. De plus, les restrictions peuvent garantir des libertés, comme la restriction d'ajouter des restrictions.

Je n'apprécie pas la GPL, mais je la perçois comme un moyen de "combattre le mal par le mal", i.e. elle n'existerait probablement pas si notre société ne cultivait pas des comportements propriétaires, abusifs et opportunistes (Peut-être que les règles de ce genre sont indispensables au développement d'une société dénuée de ces derniers ?).

Je ne veux/peux utiliser la GPL car (par mon interprétation):
- La licence est complexe, e.g. il peut être difficile d'évaluer la portée de sa viralité (IPC[^2], *shared memory*, CLI[^3], etc.).
- Le manque de granularité pour la composition. Pour moi il s'agit avant tout de partage de code source avant d'être une question de processus, programme ou application (e.g. un module).
- La GPL est une licence virale à la frontière du programme ou "software"; il peut être possible d'en abuser. E.g. si des personnes utilisent une interface IPC juste pour contourner la GPL, ça peut affecter la qualité des logiciels pour des raisons non techniques.
- Elle n'impacte pas uniquement le monde propriétaire, elle est particulièrement virale et peut être incompatible avec d'autres initiatives libres. Elle semble imposer une vision du libre aux autres.
- Je ne suis pas à l'aise avec le fait de contraindre la vertu, j'aimerai plutôt l'inspirer.
- Je préfère manquer de sanctionner un criminel plutôt que de sanctionner un innocent. Plus concrètement, je préfère qu'une personne abuse de mon travail plutôt que d'empêcher des gens respectueux de l'utiliser.

[^2]: Inter-process communication
[^3]: Command-line interface

Pour des petits modules qui ne représentent qu'une fraction d'un projet plus large, je ne vois aucun problème a utiliser une licence non copyleft, car le potentiel d'abus est quasi inexistant. En revanche l'impact de la GPL est démesuré car tout le projet est "contaminé".

Mais quand un projet devient plus gros ou *standalone* / *end-user* (le projet n'est pas ou peu utilisé pour construire un projet plus large), il ne nécessite que peu de travail supplémentaire pour être exploité et l'envie d'une licence copyleft fait son apparition.

La GPL est inacceptable pour moi tout comme la LGPL qui semble reposer sur des notions trop spécifiques comme des "libraries" ou du "dynamic / static linking", qui ont surtout du sens pour des langages comme le **C**.

D'un autre côté, une licence non copyleft me parait trop fragile pour des projets importants qui pourraient attirer un certain opportunisme. E.g. un projet libre qui serait vampirisé par un projet propriétaire; ce dernier peut se nourrir de cette base libre, mais pas l'inverse. Un déséquilibre qui peut dissuader de contribuer au projet originel.

## Un juste milieu ?

Il existe cependant une alternative au choix de deux "extrêmes": la [MPL-2.0](https://www.mozilla.org/en-US/MPL/2.0/).

La MPL-2.0 peut être considérée comme une licence copyleft non virale, car sa viralité s'arrête à la frontière d'un fichier. C'est plus simple à comprendre et permet la composition de manière saine; le concept de fichier est déjà fondamental à la structuration d'un projet. Tant que les langages de programmation reposent sur des fichiers, la MPL sera adaptée.

Mon interpretation: avec cette licence il est facile de réutiliser le code existant, tout en dissuadant un minimum l'appropriation du projet.

## Un choix progressif

En conclusion, en fonction de la taille et la nature du projet, voici mon choix de licences, progressivement:
- **Public Domain:** Pour des morceaux de code. Pas vraiment de licences, pas de complexité pour une réutilisation maximale.
- **MIT:** Pour de petits projets, par exemple des modules constitués d'un seul fichier Lua. Simple et concise.
- **MPL-2.0:** Pour tout le reste, plus robuste et relativement simple.
