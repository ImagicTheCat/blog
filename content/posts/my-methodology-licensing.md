+++
title = "Ma méthodologie: les licences libres."
date = 2023-01-09
draft = true
+++

Cet article décrit mon point de vue et ma méthodologie actuelle pour choisir une licence libre.

# L'aspect viral

Ma perception est qu'il existe deux grandes catégories de licences: les virales/copyleft[^1] et les "permissives". Je n'aime pas vraiment le terme "permissif" parce qu'il sous entend qu'une licence libre serait restrictive par défaut, ce qui est plutôt l'inverse pour moi.

[^1]: https://fr.wikipedia.org/wiki/Copyleft

- Exemple de licence virale/copyleft: [GPL-3.0](https://www.gnu.org/licenses/gpl-3.0.html)
- Exemple de licence permissive: [Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0)

Des personnes ne jurent que par des licences copyleft, jusqu'à insinuer que les licences "permissives" ne sont pas vraiment libres. On peut aussi argumenter l'inverse, car la GPL impose des restrictions et offre donc moins de degrés de libertés.

La réalité est complexe. La GPL serait un moyen de "combattre le mal par le mal". Elle n'existerait probablement pas si notre société ne cultivait pas des comportements propriétaires, abusifs et opportunistes.

De l'autre côté, une licence non copyleft est concrètement plus libre, mais ignore le problème de l'opportunisme. Sans copyleft, on peut remarquer un avantage considérable du point de vue du monde propriétaire: des changements d'un projet libre peuvent être incorporés dans un projet propriétaire, mais pas l'inverse. Si le projet propriétaire se construit sur une base libre indépendante, la plus value des deux projets n'est incorporée que dans un seul sens au détriment de la communauté.

Je n'aime pas la GPL car:
- La licence est complexe.
- Elle n'impacte pas uniquement le monde propriétaire, elle est virale et incompatible avec d'autres initiatives. Ma vision du libre n'est pas de l'imposer aux autres.
- Je préfère manquer de sanctionner un criminel plutôt que de sanctionner un innocent. Plus concrètement, je préfère qu'une personne abuse de mon travail plutôt que d'empêcher des gens respectueux de l'utiliser.
- La GPL est une licence virale à la frontière du programme, il est toujours possible d'en abuser. E.g. si des personnes utilisent une interface IPC[^2] juste pour contourner la GPL, ça affecte la qualité des logiciels pour des raisons non techniques.
- Le manque de composition. Pour moi la programmation est avant tout du code avant d'être une question de processus.

[^2]: Inter-process communication

Pour des petits modules qui ne représentent qu'une fraction d'un projet plus large, je ne vois aucun problème a utiliser une licence non copyleft, car le potentiel d'abus est quasi inexistant. Mais quand un projet devient plus gros, *standalone*, *end-user*, i.e. qu'il nécessite peu de travail supplémentaire pour être exploité, l'envie d'une licence copyleft fait son apparition.

La GPL est inacceptable et la LGPL repose sur des notions trop spécifiques ("libraries", "dynamic / static linking"). Il existe cependant une alternative déjà bien en place: la [MPL-2.0](https://www.mozilla.org/en-US/MPL/2.0/).

La MPL-2.0 peut être considérée comme une licence copyleft non virale, car sa viralité s'arrête à la frontière d'un fichier. C'est plus compréhensible, plus simple et ça permet la composition de manière saine: le concept de fichier est déjà fondamental à la structuration d'un projet; tant que les langages de programmation reposent sur des fichiers, la MPL sera adaptée.

## Choix progressif

En fonction de la taille et la nature du projet, voici mon choix de licences, progressivement:
- **Public Domain:** pour des morceaux de code, pas de licences complexes, réutilisation maximale.
- **MIT:** pour de petits modules, e.g. un module avec un seul fichier Lua comme j'ai l'habitude d'en faire. Concise.
- **MPL-2.0:** pour tout le reste.
