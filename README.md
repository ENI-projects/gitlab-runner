# gitlab-runner

Projet décrivant le runner gitlab dans lequel nos pipelines vont s'exécuter.
Ce projet permet de build l'image de ce runner et les pipelines se baseront dessus via sa propre CI.

## Contenu de l'image

L'image est basée sur l'image debian stretch-20191224 avec kubectl d'installé.