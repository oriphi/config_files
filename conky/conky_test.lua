--this is a lua script for use in conky
require 'cairo'


--Objects
palette = {0x7B9f35,0x96b854,0x89ab44,0x6f9228,0x62861c,0x078484,0x1e6b6b,0x147878,0x008e8e,0x009898,0xaa3939,0xffaaaa,0xd46a6a,0x801515,0x550000}
cpu_charge = {
	prefix = '[',
	suffix=']',
	name = "top",
	arg="cpu 1",
	xpos = 100,
	ypos = 12,
	prefix="[",
	suffix="]",
	font = "DejaVu Sans Mono",
	font_size = 8,
	color = 0xffffff,
	alpha=1,
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
}
labl_cpu={
{
	prefix = '[ ',
	suffix=' %]',
	name = "cpu",
	arg="cpu",
	xpos = 1395,
	ypos = 63,

	font = "DejaVu Sans Mono",
	font_size = 12,
	color = 0xffffff,
	alpha=1,
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
},
{
	prefix = '[ ',
	suffix=' %]',
	name = "cpu",
	arg="cpu0",
	xpos = 1890,
	ypos = 82,

	font = "DejaVu Sans Mono",
	font_size = 10,
	color = 0xffffff,
	alpha=1,
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
},
{
	prefix = '[',
	suffix=' %]',
	name = "cpu",
	arg="cpu1",
	xpos = 1890,
	ypos = 102,

	font = "DejaVu Sans Mono",
	font_size = 10,
	color = 0xffffff,
	alpha=1,
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
},
{
	prefix = '[',
	suffix=' %]',
	name = "cpu",
	arg="cpu2",
	xpos = 1890,
	ypos = 122,

	font = "DejaVu Sans Mono",
	font_size = 10,
	color = 0xffffff,
	alpha=1,
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
},
{
	prefix = '[',
	suffix=' %]',
	name = "cpu",
	arg="cpu3",
	xpos = 1890,
	ypos = 142,

	font = "DejaVu Sans Mono",
	font_size = 10,
	color = 0xffffff,
	alpha=1,
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
},
{
	prefix = '[ ',
	suffix=' %]',
	name = "cpu",
	arg="cpu4",
	xpos = 1480,
	ypos = 82,

	font = "DejaVu Sans Mono",
	font_size = 10,
	color = 0xffffff,
	alpha=1,
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
},
{
	prefix = '[ ',
	suffix=' %]',
	name = "cpu",
	arg="cpu5",
	xpos = 1480,
	ypos = 102,

	font = "DejaVu Sans Mono",
	font_size = 10,
	color = 0xffffff,
	alpha=1,
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
},
{
	prefix = '[ ',
	suffix=' %]',
	name = "cpu",
	arg="cpu6",
	xpos = 1480,
	ypos = 122,

	font = "DejaVu Sans Mono",
	font_size = 10,
	color = 0xffffff,
	alpha=1,
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
},
{
	prefix = '[ ',
	suffix=' %]',
	name = "cpu",
	arg="cpu7",
	xpos = 1480,
	ypos = 142,

	font = "DejaVu Sans Mono",
	font_size = 10,
	color = 0xffffff,
	alpha=1,
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
},
{
	prefix = '',
	suffix='',
	name = "exec",
	arg="lscpu |grep Nom |cut -d \":\" -f2",
	xpos = 1400,
	ypos = 40,

	font = "DejaVu Sans Mono",
	font_size = 20,
	color = 0xffffff,
	alpha=1,
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
},

}

Cpu_use = {
	name = "cpu",
	arg = "cpu0",
	val_max = 100, 				---valeur maximale de la charge
	startx = 600, 				---position en x de la barre
	starty = 300,				---position en y de la barre
	type_bar = "cursor",				---type de remplissage (fill//cursor)
	front_color = 0xffffff,		---couleur de la barre remplie
	front_alpha = 1,			---alpha de la barre remplie
	cursor_width = 6,			---ATTENTION ajouter minimum/max pour éviter dépassement
	cursor_color = 0x2266dd,
	cursor_alpha = 1,
	line_width = 10,			--- épaisseur de la barre
	size = 450,					---longueur de la barre
	background = 'yes',			--- colorer le fond
	back_color = 0xD7A52C,		---couleur de fond
	back_alpha = 1,				---alpha du fond
	begin = 'right',				---début de la barre (gauche // droite)
	border = '',				---dessiner les bords (yes//'')
	border_width = 3,			---épaisseur des bords
	border_color = 0x000000,	---couleur des bords
	border_alpha = 1,			---alpha des bords
	font = "DejaVu Sans Mono",	---police de la légende
	font_size = 12,				---taille police
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
	line_cap = CAIRO_LINE_CAP_BUTT,
}
CPU_use2={
	name ="cpu",
	arg="cpu0",
	val_max=100,
	startx=500,
	starty=40,
	type_bar='fill',
	front_color=0xffffff,
	front_alpha=1,
	line_width=5,
	size=150,
	background='no',
	begin='right',
	border='no',
	font = "DejaVu Sans Mono",	
	font_size = 12,	
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
	line_cap = CAIRO_LINE_CAP_BUTT,
}

CPUS = {
{
	name ="cpu",
	arg="",
	val_max=100,
	startx=1450,
	starty=60,
	type_bar='fill',
	front_color=0xffffff,
	front_alpha=0.5,
	line_width=10,
	size=430,
	background='yes',
	back_color=0x2f343f,
	back_alpha=0.5,
	begin='left',
	border='',
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
	line_cap = CAIRO_LINE_CAP_BUTT,
	font = "DejaVu Sans Mono",	
	font_size = 12,
	
	
	labl = "",
		labl_pos = "left", --left,right
		labl_prefix = '[ ',
		labl_suffix=' %]',
		labl_name = "cpu",
		labl_arg="",
		labl_deltax = 0,
		labl_deltay = 3,
		font = "DejaVu Sans Mono",
		font_size = 10,
		labl_color = 0xffffff,
		labl_alpha = 1,
},
{
	name ="cpu",
	arg="cpu0",
	val_max=100,
	startx=1880,
	starty=80,
	type_bar='fill',
	front_color=0xffffff,
	front_alpha=0.5,
	line_width=5,
	size=150,
	background='yes',
	back_color=0x2f343f,
	back_alpha=0.5,
	begin='right',
	border='',

	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
	line_cap = CAIRO_LINE_CAP_BUTT,
	font = "DejaVu Sans Mono",	
	font_size = 12,	
	
	labl = "",
		labl_prefix = '[ ',
		labl_suffix=' %]',
		labl_name = "cpu",
		labl_arg="cpu0",
		labl_pos = "right", --top/bottom,left,right
		labl_deltax = 0,
		labl_deltay = 0,
		font = "DejaVu Sans Mono",
		font_size = 10,
		labl_color = 0xffffff,
		labl_alpha = 1,

},
{
	name ="cpu",
	arg="cpu1",
	val_max=100,
	startx=1880,
	starty=100,
	type_bar='fill',
	front_color=0xffffff,
	front_alpha=0.5,
	line_width=5,
	size=150,
	background='yes',
	back_color=0x2f343f,
	back_alpha=0.5,
	begin='right',
	border='',
	labl = "no",
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
	line_cap = CAIRO_LINE_CAP_BUTT,
		font = "DejaVu Sans Mono",	
	font_size = 12,	
},
{
	name ="cpu",
	arg="cpu2",
	val_max=100,
	startx=1880,
	starty=120,
	type_bar='fill',
	front_color=0xffffff,
	front_alpha=0.5,
	line_width=5,
	size=150,
	background='yes',
	back_color=0x2f343f,
	back_alpha=0.5,
	begin='right',
	border='',
	labl = "no",
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
	line_cap = CAIRO_LINE_CAP_BUTT,
	font = "DejaVu Sans Mono",	
	font_size = 12,	
},
{
	name ="cpu",
	arg="cpu3",
	val_max=100,
	startx=1880,
	starty=140,
	type_bar='fill',
	front_color=0xffffff,
	front_alpha=0.5,
	line_width=5,
	size=150,
	background='yes',
	back_color=0x2f343f,
	back_alpha=0.5,
	begin='right',
	border='',
	labl = "no",
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
	line_cap = CAIRO_LINE_CAP_BUTT,
	font = "DejaVu Sans Mono",	
	font_size = 12,	
},
{
	name ="cpu",
	arg="cpu4",
	val_max=100,
	startx=1530,
	starty=80,
	type_bar='fill',
	front_color=0xffffff,
	front_alpha=0.5,
	line_width=5,
	size=150,
	background='yes',
	back_color=0x2f343f,
	back_alpha=0.5,
	begin='left',
	border='',
	labl = "no",
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
	line_cap = CAIRO_LINE_CAP_BUTT,
	font = "DejaVu Sans Mono",	
	font_size = 12,	
},

{
	name ="cpu",
	arg="cpu5",
	val_max=100,
	startx=1530,
	starty=100,
	type_bar='fill',
	front_color=0xffffff,
	front_alpha=0.5,
	line_width=5,
	size=150,
	background='yes',
	back_color=0x2f343f,
	back_alpha=0.5,
	begin='left',
	border='',
	labl = "no",
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
	line_cap = CAIRO_LINE_CAP_BUTT,
	font = "DejaVu Sans Mono",	
	font_size = 12,	
},
{
	name ="cpu",
	arg="cpu6",
	val_max=100,
	startx=1530,
	starty=120,
	type_bar='fill',
	front_color=0xffffff,
	front_alpha=0.5,
	line_width=5,
	size=150,
	background='yes',
	back_color=0x2f343f,
	back_alpha=0.5,
	begin='left',
	border='',
	labl = "no",
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
	line_cap = CAIRO_LINE_CAP_BUTT,
	font = "DejaVu Sans Mono",	
	font_size = 12,	
},
{
	name ="cpu",
	arg="cpu7",
	val_max=100,
	startx=1530,
	starty=140,
	type_bar='fill',
	front_color=0xffffff,
	front_alpha=0.5,
	line_width=5,
	size=150,
	background='yes',
	back_color=0x2f343f,
	back_alpha=0.5,
	begin='left',
	border='',
	labl = "no",
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
	line_cap = CAIRO_LINE_CAP_BUTT,
	font = "DejaVu Sans Mono",	
	font_size = 12,	
},
}

gpu_labl={
{
	prefix = '[ ',
	suffix=' %]',
	name = "exec",
	arg="nvidia-settings -t -q [gpu:0]/GPUUtilization |grep graphics|cut -d \"=\" -f2|cut -d \",\" -f1",
	xpos = 1200,
	ypos = 40,

	font = "DejaVu Sans Mono",
	font_size = 10,
	color = 0xffffff,
	alpha=1,
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
},

{
	prefix = '[ ',
	suffix=' %]',
	name = "exec",
	arg="nvidia-settings -t -q [gpu:1]/GPUUtilization |grep graphics|cut -d \"=\" -f2|cut -d \",\" -f1",
	xpos = 1200,
	ypos = 60,

	font = "DejaVu Sans Mono",
	font_size = 10,
	color = 0xffffff,
	alpha=1,
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
},

}

horloge ={
{
	prefix = '',
	suffix='',
	name = "time",
	arg="%H",
	xpos = 100,
	ypos = 100,
	val_max = 24,
	font = "DejaVu Sans Mono",
	font_size = 60,
	color = 0xffffff,
	alpha=1,
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
},
{
	prefix = '',
	suffix='',
	name = "time",
	arg="%M",
	xpos = 180,
	ypos = 80,

	font = "DejaVu Sans Mono",
	font_size = 40,
	color = 0xffffff,
	alpha=1,
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
},
{
	prefix = '',
	suffix='',
	name = "time",
	arg="%S",
	xpos = 200,
	ypos = 100,

	font = "DejaVu Sans Mono",
	font_size = 20,
	color = 0xffffff,
	alpha=1,
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
},
{
	prefix = '',
	suffix='',
	name = "time",
	arg="%D",
	xpos = 100,
	ypos = 126,

	font = "DejaVu Sans Mono",
	font_size = 25,
	color = 0xffffff,
	alpha=1,
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
},

}

divers = {
{
	prefix = 'User:   ',
	suffix='',
	name = "nodename",
	arg="",
	xpos = 100,
	ypos = 150,

	font = "DejaVu Sans Mono",
	font_size = 12,
	color = 0xffffff,
	alpha=1,
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
},
{
	prefix = 'OS:     ',
	suffix='',
	name = "sysname",
	arg="",
	xpos = 100,
	ypos = 164,

	font = "DejaVu Sans Mono",
	font_size = 12,
	color = 0xffffff,
	alpha=1,
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
},
{
	prefix = 'Kernel: ',
	suffix='',
	name = "kernel",
	arg="",
	xpos = 100,
	ypos = 176,

	font = "DejaVu Sans Mono",
	font_size = 12,
	color = 0xffffff,
	alpha=1,
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
},
{
	prefix = 'Arch:   ',
	suffix='',
	name = "machine",
	arg="",
	xpos = 100,
	ypos = 188,

	font = "DejaVu Sans Mono",
	font_size = 12,
	color = 0xffffff,
	alpha=1,
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
},

}
Memory_labl = {
{
	prefix = 'Ram :',
	suffix='',
	name = "mem",
	arg="",
	xpos = 1360,
	ypos = 203,

	font = "DejaVu Sans Mono",
	font_size = 12,
	color = 0xffffff,
	color_type = "changing",
	alpha=1,
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
},
}
Memory = {
{
	name ="memperc",
	arg="",
	val_max=100,
	startx=1450,
	starty=200,
	type_bar='cursor',
	cursor_width = 6,
	cursor_color =0xffffff,
	cursor_alpha = 0.6,
	front_color=0xffffff,
	front_alpha=0.6,
	line_width=10,
	size=430,
	background='yes',
	back_color=0x2f343f,
	back_alpha=0.6,
	begin='left',
	border='',
	labl = "no",
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
	line_cap = CAIRO_LINE_CAP_BUTT,
		font = "DejaVu Sans Mono",	
	font_size = 12,	
},
}

function rgb_to_r_g_b(colour, alpha)
    return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end

function boucle_bar(display,data)
	local function load_bar(display,data)
		affich_bar(display,data)
	end
	for i in pairs(data) do
		load_bar(display,data[i])
	end
end
function boucle_labl(display,data)
	local function load_labl(display,data)
		affich_text2(display,data)
	end
	for i in pairs(data) do
		load_labl(display,data[i])
	end
end


function affich_text(cr,data)
	cairo_select_font_face (cr,data['font'], data['font_slant'], data['font_face'])
	cairo_set_font_size (cr, data['font_size'])
	cairo_set_source_rgba (cr,rgb_to_r_g_b(data["color"],data["alpha"]))
	cairo_move_to (cr,data['xpos'],data['ypos'])
	cairo_show_text (cr,data["text"])
	cairo_stroke (cr)
end

function affich_text2(cr,data)
	local com = string.format('${%s %s}',data["name"],data["arg"])
	local font,font_slant,font_face,font_size = data["font"], data['font_slant'], data['font_face'],data['font_size']
	local value = conky_parse(com)
	local pref,suf = data["prefix"],data["suffix"]

	cairo_select_font_face (cr,font, font_slant, font_face)
	cairo_set_font_size (cr, font_size)
	
	cairo_set_source_rgba (cr,rgb_to_r_g_b(data["color"],data["alpha"]))
	cairo_move_to (cr,data['xpos'],data['ypos'])
	cairo_show_text (cr,pref..value..suf)
	cairo_stroke (cr)

end
function color_change(palette,val,val_max)
	local num = table.getn(palette)
	local prct = val/val_max
	return(palette[math.floor(num * prct)])
end

function affich_bar(cr,data)
	local begin =data["begin"]
	local line_width = data["line_width"]
	local line_cap = data["line_cap"]
	local startx,starty = data["startx"],data["starty"]

	local endy,endx = starty,startx
	local size = data["size"]
	
	if begin == 'left' then
		endx = startx + size
	elseif begin == "right" then
		endx = startx - size
	end
	local com, val = string.format('${%s %s}',data["name"],data["arg"]),0
	
	--Draw the background of the gauge
	if data["background"] == 'yes' then
		cairo_set_line_width (cr,line_width)
		cairo_set_line_cap  (cr, line_cap)
		cairo_set_source_rgba (cr,rgb_to_r_g_b(data["back_color"],data["back_alpha"]))
		cairo_move_to (cr,startx,starty)
		cairo_line_to (cr,endx,endy)
		cairo_stroke (cr)
	end
	if data["border"] == 'yes' then
		local border_width =data["border_width"]
		cairo_set_line_width (cr,border_width)
		cairo_set_source_rgba(cr,rgb_to_r_g_b(data["border_color"],data["border_alpha"]))
		local borderx,bordery =startx,starty
		local delta =border_width
		local fillx,filly,end_fill = 0,0,0
		if data["begin"] == 'left' then
			boderx = startx - delta 
		elseif data["begin"] == 'right' then
			borderx = startx + delta/2
		end
		bordery = starty -delta/2 -line_width/2
		cairo_rectangle (cr,borderx,bordery,size + delta,delta + line_width)
		
		cairo_stroke(cr)


	
	end
	val = tonumber(conky_parse(com))*(endx - startx)/100
	if data["type_bar"] == "fill" then
		fillx = startx
		filly = starty
		end_fill = startx + val

	elseif data["type_bar"] == "cursor" then
		fillx = startx + val - data["cursor_width"]/2
		filly = starty
		end_fill = startx + val + data["cursor_width"]/2 

	end
	
	if data["labl"] == "yes" then
		local labelx,labely = 0,0
		local full_text = data["labl_prefix"]..val..data["labl_suffix"]
		local maxi = tostring(data["val_max"])
		local len = string.len(data["labl_prefix"]..maxi..data["labl_suffix"])
		local pos = data["labl_pos"]
		if  pos == "left" then
			labelx = startx + data["labl_deltax"] - len*data["font_size"]
			labely = starty  + data["labl_deltay"]
		print(labelx,labely)
		
		elseif pos =="right" then
			labelx = startx + data["labl_deltax"] + size
			labely = starty  + data["labl_deltay"]
			print(labelx,labely)
		end
		local labl_table = {
			text = full_text,
			xpos = labelx,
			ypos = labely,
			font = data["font"],
			font_size = data["font_size"],
			color = data["labl_color"],
			alpha = data["labl_alpha"],
			font_slant = data["font_slant"],
			font_face = data["font_face"],
			}
		affich_text(cr,labl_table)
--[[		local text = {
			name = data["labl_name"],
			arg = data["labl_arg"],
			prefix = data["labl_prefix"],
			suffix = data["labl_suffix"],
			xpos = labelx,
			ypos = labely,
			font = data["font"],
			font_size = data["font_size"],
			color = data["labl_color"],
			alpha = data["labl_alpha"],
			font_slant=data["font_slant"],
			font_face = data["font_face"],
			}
			affich_text2(cr,text)
			
			]]
	end

	cairo_set_line_width (cr,line_width)
	cairo_set_line_cap  (cr, line_cap)
	cairo_set_source_rgba (cr,rgb_to_r_g_b(data["front_color"],data["front_alpha"]))
	cairo_move_to (cr,fillx ,filly)
	cairo_line_to (cr,end_fill,endy)
	cairo_stroke (cr)
end

function conky_main()
	if conky_window == nil then 
		return 
	end
	local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
	cr = cairo_create(cs)
	local updates=tonumber(conky_parse('${updates}'))
	if updates>5 then
		--##############################
		----------------------------
		boucle_bar(cr,CPUS)
		boucle_labl(cr,labl_cpu)
		--boucle_labl(cr,gpu_labl)
		boucle_labl(cr,horloge)
		boucle_labl(cr,divers)
		
		boucle_bar(cr,Memory)
		boucle_labl(cr,Memory_labl)
		---------------------------------------



		--##############################
	end-- if updates>5
	cairo_surface_destroy(cs)
	cairo_destroy(cr)
	

end-- end main function
