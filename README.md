The Conky Bar Script
==
> Changelog:
> __Version 1.0:__ 
> premiere version
>Nouveaux Objets _Barre_ ,  _label_, _texte_ 
>Routines:
>`rgb_to_r_g_b(couleur,alpha)`Converti une couleur en hexadécimal en r-g-b
>`boucle_bar(display,data)`Affiche toute les barres du macro-objet __data__
>`boucle_labl(display,data)` Affiche tout les labels du macro-objet __data__
>`affich_text(display,data)` Affiche un label fixe
>`affich_text2(display,data)` Affiche un label dynamique
>`affich_bar(display,data)` Affiche la barre __data__
>`conky_main()` Boucle principale

----
Introduction:
=============
__CBS__ est un script à utiliser avec __Conky__ qui permet d'afficher et de configurer plus simplement l'affichage de testes ou de barres grâce à __Conky__.

----
#Utilisation:
* Afin de ne pas avoir de problèmes d'affichage, il est préférable de modifier ces paramètres du fichier de configuration de __Conky__ :
 + `minimum_height= resolution verticale de l'écran`
 + `minimum_width= resolution horizontale de l'écran` 

* Dans le fichier de configuration de __Conky__, ajoutez à la fin de `conky.config`:
	* `lua_load = /path/to/the/lua/script,`
	* `lua_draw_hook_post = "main" (nom de la boucle principale),`

#Les Différents Objets: