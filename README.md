The Conky Bar Script
==
>*Changelog:*
> __Version 1.1:__
> Création de barres Verticales
> Correction du bug de dépassement aux extrêmitées des barres
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
---
## To Do:
- [x] Ajouter des barres verticales (Cursor + Fill).
- [x] Corriger le bug d'affichage du curseur en extrémité de barre
- [ ] Ajouter des labels mobiles directement sur les barres
- [ ] Ajouter un style de barre jauge 
- [ ] Ajouter des barres circulaires 
- [ ]  Affichage du label pour les barres
- [ ] Echelle pour les barres
- [ ] Echelle pour les cercles
- [ ] Différents types de cercles 

----
Introduction:
=============
__CBS__ est un script à utiliser avec __Conky__ qui permet d'afficher et de configurer plus simplement l'affichage de testes ou de barres grâce à __Conky__.

----
# Utilisation:
* Afin de ne pas avoir de problèmes d'affichage, il est préférable de modifier ces paramètres du fichier de configuration de __Conky__ :
 + `minimum_height= resolution verticale de l'écran`
 + `minimum_width= resolution horizontale de l'écran` 

* Dans le fichier de configuration de __Conky__, ajoutez à la fin de `conky.config`:
	* `lua_load = /path/to/the/lua/script,`
	* `lua_draw_hook_post = "main" (nom de la boucle principale),`
---
# Création d'objets:
Chaque objet peut êre défini séparament ou alors regroupé avec des objets du même tupe au sein d'un __macro objet__
### Objet Simple:
	définition:
	Objet = {arg1,arg2,arg3, ...}
### Macro objet:
	Définition:
	Objet = {Objet1, Objet2, ...}
>/!\ Tous les objets d'un __macro objet__ doivent être du __même__ type.
### Afficher des objets:
* Pour les objets simples: Dans la boucle principale, utiliser la routine `affich_bar(display, nom_de_l'objet)`
* Pour les macro_objets: dans la boucle principale, utiliser la routine `boucle_bar(display, nom_du_macro_objet)`
----
# Les Différents Objets:
## 1. Le label Fixe:
Cet objet permet d'afficher du texte à l'écran, il peut être crée au sein d'un __marco-objet__ ou alors seul

	
	label={
		text = , 	* Texte à afficher
		xpos =,  	* Position en x du label (en pxl)	
		ypos =,		* Position en y du label
		color = ,	* Couleur en hexadécimal (0xffffff)
		alpha = ,	* Valeur de la transparence (1 = totalement opaque, 0 = invisible)
		font = ,	* Police d\'écriture
		font_size = ,	* Taille de la police
		font_slant = ,	*
		font_face = ,	*
---
## 2. Le Label Dynamique:

Cet objet permet d'executer une commande shell ou __Conky__ et d'afficher le résultat.

	label = {
		name = ,	* Commande à executer
		arg = ,		* Arguments de la commande
		prefix = ,	* Texte à afficher avant la valeur
		suffix = ,	* Texte à afficher près la valeur
		xpos = ,	* Position en x du label
		ypos = ,	* Position en y du label
		color = ,	* Couleur du texte en hexadécimal
		alpha = ,	* Valeur de la transparence
		font = ,	* Police de caractère
		font_size = ,	* Taille de la police
		font_slant = ,
		font_face = ,
		}
---
## 3. Les Barres
L'objet _Barre_ permet d'afficher de manière plus visuelle la valeur souhaitée.

	barre = {
		name = ,	* Commande à executer
		arg = ,		* Arguments de la commande
		val_max = ,	* Valeur maximale possible
		startx = ,	* Position du coin haut gauche (si begin = left) // droit (si begin = right)
		starty = ,	* Position en y de la barre
		orientation = , Orientation de la barre (horizontal / vertical)
		begin = ,	* Sens de remplissage de la barre (si orientation = 'horizontal': left//right)(si orientation ='vertical': 'up' // 'down')
		line_width = ,	* Epaisseur de la barre
		size = ,	* Longueur de la barre
		line_cap = ,
		--- Valeurs inutilisées
		font = ,	
		font_size = ,
		font_face = ,
		font_slant = ,
		---
		type_bar = ,	* ('cursor'//'fill')

			---options pour type_bar = 'fill'
			front_color = ,		* Couleur de la barre remplie
			front_alpha = ,		* Transparence du remplissage
			---options pour type_bar = 'cursor'
			cursor_color = ,	* Couleur du curseur
			cursor_alpha = ,	* Transaprence du curseur
			cursor_width = ,	* Largeur du curseur
		background = ,	* 'yes'//'' (Colorer le corps de la barre
			--- options pour background = 'yes'
			back_color = ,		* Couleur du corps
			back_alpha = ,		* Transparence  du corps
		border = ,	* 'yes'//'' (Dessiner les bords ou non)
			--- options pour border = 'yes'
			border_width = ,	* Epaisseur du contour
			border_color = ,	* Couleur du contour
		}


---

# Quelques exemples de commandes:
	
	name = 'cpu',arg = 'cpuN'  (N <= nombre de cpu -1)
> Indique la charge du N-ième processeur

__/!\ Les processeurs sont numérotés à partir de 0.__

Ce script est compatible avec 
[Conky Objets]

    name = 'exec', arg = 'nvidia-settings -t -q [gpu:0]/GPUUtilization | grep graphics | cut -d \"=\" -f2 | cut -d \",\" -f1 `
> Récupère la charge du 1er GPU ( *ne marche qu'avec les cartes graphiques Nvidia avec les drivers officiels *)
> La commande exec permet d'executer une commande shell et de récupérer la sortie)S

#### Horloges :
    nom =" time" arg = "%H" // "%M" // "%S"
> Permaet de récupérer les Heures/Minutes Secondes sur l'horloge du systeme 

