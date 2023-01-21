+++
title = "Ma méthodologie: choix d'une licence libre."
date = 2023-01-21
draft = true
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

Une licence copyleft prend par exemple en compte l'importance de la réciprocité du partage et l'impose à travers ses conditions. Les restrictions peuvent garantir des libertés, comme la restriction d'ajouter des restrictions.

Je n'apprécie pas la GPL, mais je la perçois comme un moyen de "combattre le mal par le mal", i.e. elle n'existerait probablement pas si notre société ne cultivait pas des comportements propriétaires, abusifs et opportunistes.

Je ne veux/peux utiliser la GPL car:
- La licence est complexe.
- Elle n'impacte pas uniquement le monde propriétaire, elle est particulièrement virale et peut être incompatible avec d'autres initiatives libres. Elle semble imposer une vision du libre aux autres.
- Je préfère manquer de sanctionner un criminel plutôt que de sanctionner un innocent. Autrement dit, je préfère qu'une personne abuse de mon travail plutôt que d'empêcher des gens respectueux de l'utiliser.
- La GPL est une licence virale à la frontière du programme, il est toujours possible d'en abuser. E.g. si des personnes utilisent une interface IPC[^2] juste pour contourner la GPL, ça affecte la qualité des logiciels pour des raisons non techniques.
- Le manque de composition. Pour moi la programmation est avant tout du code source avant d'être une question de processus.

[^2]: Inter-process communication

Pour des petits modules qui ne représentent qu'une fraction d'un projet plus large, je ne vois aucun problème a utiliser une licence non copyleft, car le potentiel d'abus est quasi inexistant. Mais quand un projet devient plus gros ou *standalone* / *end-user*[^3], il ne nécessite que peu de travail supplémentaire pour être exploité; l'envie d'une licence copyleft fait son apparition.

[^3]: Si on visualise un graphe de dépendances (acyclique), le projet est plus proche des racines que des feuilles. Par exemple, le projet se suffit à lui même et n'est pas utilisé dans le développement d'un projet plus large.

La GPL est inacceptable pour moi tout comme la LGPL qui semble reposer sur des notions trop spécifiques comme des "libraries" ou du "dynamic / static linking", qui ont surtout du sens pour des langages comme le **C**.

D'un autre côté, une licence non copyleft me parait trop fragile pour des projets importants qui pourraient attirer un certain opportunisme. E.g. un projet libre qui serait vampirisé par un projet propriétaire; ce dernier peut se nourrir de cette base libre, mais pas l'inverse. Un déséquilibre qui peut dissuader de contribuer au projet originel.

## Un juste milieu ?

Il existe cependant une alternative au choix de deux "extrêmes": la [MPL-2.0](https://www.mozilla.org/en-US/MPL/2.0/).

La MPL-2.0 peut être considérée comme une licence copyleft non virale, car sa viralité s'arrête à la frontière d'un fichier. C'est plus simple, plus compréhensible et permet la composition de manière saine. Le concept de fichier est déjà fondamental à la structuration d'un projet; tant que les langages de programmation reposent sur des fichiers, la MPL sera adaptée.

Mon interpretation: avec cette licence il est facile de construire autour du code existant, tout en dissuadant un minimum l'appropriation du projet.

## Choix progressif

En fonction de la taille et la nature du projet, voici mon choix de licences, progressivement:
- **Public Domain:** Pour des morceaux de code. Pas de licences complexes, réutilisation maximale.
- **MIT:** Pour de petits projets, par exemple des modules constitués d'un seul fichier Lua. Simple, concise.
- **MPL-2.0:** Pour tout le reste.
