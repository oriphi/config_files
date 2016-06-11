--this is a lua script for use in conky
require 'cairo' 

--Objects
--[[
labl_cpu={
	{
	prefix = '[ ',
	suffix=' %]',
	name = "cpu",
	arg="cpu0",
	xpos = 800,
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
	arg="cpu1",
	xpos = 800,
	ypos = 82,

	font = "DejaVu Sans Mono",
	font_size = 10,
	color = 0xffffff,
	alpha=1,
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
	},
}
]]



CPUS = {

	{
 	name ="cpu",
	arg="",
	val_max=100,
	startx=800,
	starty=160,
	type_bar='cursor',
		cursor_width = 10,
		cusor_color = 0xffffff,
		cursor_alpha = 0.5,
		
		front_color=0xffffff,
		front_alpha=0.5,
	
	line_width=15,
	size=500,
	background='yes',
	back_color=0x000000,
	back_alpha=1,
	bar_orientation = "vertical",
	begin='up',
	border='',
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
	line_cap = CAIRO_LINE_CAP_BUTT,
	font = "DejaVu Sans Mono",	
	font_size = 12,
	labl = "yes",
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
	--[[
		{
 	name ="cpu",
	arg="cpu7",
	val_max=100,
	startx=700,
	starty=160,
	type_bar='cursor',
		cursor_width = 10,
		cusor_color = 0xffffff,
		cursor_alpha = 0.5,
		
		front_color=0xffffff,
		front_alpha=0.5,
	
	line_width=15,
	size=500,
	background='yes',
	back_color=0x000000,
	back_alpha=1,
	bar_orientation = "horizontal",
	begin='right',
	border='',
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
	line_cap = CAIRO_LINE_CAP_BUTT,
	font = "DejaVu Sans Mono",	
	font_size = 12,
	labl = "yes",
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
	]]
	{
	name ="cpu",
	arg="cpu1",
	val_max=100,
	startx=600,
	starty=80,
	type_bar='fill',
	front_color=0xffffff,
	front_alpha=0.5,
	line_width=5,
	size=100,
	background='yes',
	back_color=0x2f343f,
	back_alpha=0.5,
	bar_orientation = "horizontal",
	begin='left',
	border='',
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
	line_cap = CAIRO_LINE_CAP_BUTT,
	font = "DejaVu Sans Mono",	
	font_size = 12,	
	labl = "yes",
		labl_prefix = '[ ',
		labl_suffix=' %]',
		labl_name = "cpu",
		labl_arg="cpu0",
		labl_pos = "left", 
		labl_deltax = 0,
		labl_deltay = 0,
		font = "DejaVu Sans Mono",
		font_size = 10,
		labl_color = 0xffffff,
		labl_alpha = 1,
	},
}

horloge_circle = {
	{
 	name ="time",
	arg="%H",
	val_max=24,
	center_x=300,
	center_y=300,
	start_angle = 0,
	end_angle = 360,
	circle_type = "fill",
		front_color = 0xffffff,
		front_alpha = 0.5,
		
	cursor_width = 10,
	cusor_color = 0xffffff,
	cursor_alpha = 0.5,
		

	circle_width=20,
	radius=120,
	background='yes',
		back_color=0x000000,
		back_alpha=1,
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
	line_cap = CAIRO_LINE_CAP_BUTT,
	font = "DejaVu Sans Mono",	
	font_size = 12,
	labl = "yes",
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
 	name ="time",
	arg="%M",
	val_max=60,
	center_x=300,
	center_y=300,
	start_angle = 0,
	end_angle = 360,
	circle_type = "fill",
		front_color = 0xffffff,
		front_alpha = 0.5,
		
	cursor_width = 10,
	cusor_color = 0xffffff,
	cursor_alpha = 0.5,
		

	circle_width=20,
	radius=100,
	background='yes',
		back_color=0x000000,
		back_alpha=1,
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
	line_cap = CAIRO_LINE_CAP_BUTT,
	font = "DejaVu Sans Mono",	
	font_size = 12,
	labl = "yes",
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
 	name ="time",
	arg="%S",
	val_max=60,
	center_x=300,
	center_y=300,
	start_angle = 0,
	end_angle = 360,
	circle_type = "pie",
		front_color = 0xffffff,
		front_alpha = 0.5,
		
	cursor_width = 10,
	cusor_color = 0xffffff,
	cursor_alpha = 0.5,
		

	circle_width=20,
	radius=80,
	background='yes',
		back_color=0x000000,
		back_alpha=0.4,
	font_slant=CAIRO_FONT_SLANT_NORMAL,
	font_face=CAIRO_FONT_WEIGHT_NORMAL,
	line_cap = CAIRO_LINE_CAP_BUTT,
	font = "DejaVu Sans Mono",	
	font_size = 12,
	labl = "yes",
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
}
--[[
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
]]


--[[
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
]]

--[[
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
]]

--[[
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
]]
function affich_cercle(cs,data)
	local center_x,center_y = data["center_x"],data["center_y"]
	local val_max = data["val_max"]
	local radius = data["radius"]
	local start_angle,end_angle = data["start_angle"], data["end_angle"]
	local circle_width = data["circle_width"]
	local pi = math.pi
	
	if data["background"] == "yes" then
		if data["circle_type"] == "fill" then 
			cairo_set_line_width (cr,circle_width )
			cairo_set_source_rgba (cr,rgb_to_r_g_b(data["back_color"],data["back_alpha"]))
			cairo_arc (cr,center_x,center_y,radius - circle_width/2,(start_angle-90)*(pi/180),(end_angle-90)*(pi/180))
			cairo_stroke (cr)
			
		elseif data["circle_type"] == "pie" then
			cairo_new_path(cr)
				cairo_set_line_width (cr,0)
				cairo_set_source_rgba (cr,rgb_to_r_g_b(data["back_color"],data["back_alpha"]))
				cairo_arc (cr,center_x,center_y,radius,(start_angle-90)*(pi/180),(end_angle-90)*(pi/180))
				cairo_line_to(cr,center_x,center_y)
				cairo_close_path(cr)
				cairo_fill_preserve(cr)
				
		end
	end


	local com, val_prct,val_num = string.format('${%s %s}',data["name"],data["arg"]),0,0
	local len_circle = (end_angle - start_angle) * (pi /180)*radius
	val_num = conky_parse(com)
	val_prct = val_num/val_max
	
	if val_prct > 0.01 then
		fill_angle =(val_prct*len_circle/radius) + (start_angle * pi / 180)
	else
		fill_angle = start_angle * pi/180
	end


	if data["circle_type"] == "fill" then
		cairo_set_line_width (cr,circle_width)
		cairo_set_source_rgba (cr,rgb_to_r_g_b(data["front_color"],data["front_alpha"]))
		cairo_arc (cr,center_x,center_y,radius - circle_width/2,(start_angle-90)*(pi/180),fill_angle - pi/2)
		cairo_stroke (cr)
		
	elseif data["circle_type"] == "pie" then
		cairo_new_path(cr)
		local new_rad = radius * val_prct
		cairo_set_line_width (cr,0)
		cairo_set_source_rgba (cr,rgb_to_r_g_b(data["front_color"],data["front_alpha"]))
		cairo_arc (cr,center_x,center_y,new_rad,(start_angle-90)*(pi/180),(end_angle - 90)*pi/180)
		cairo_line_to(cr, center_x,center_y)
		cairo_close_path(cr)
		cairo_fill_preserve(cr)


	end
end



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
function boucle_cercle(display,data)
	local function load_cercle(display,data)
		affich_cercle(display,data)
	end
	for i in pairs(data) do
		load_cercle(display,data[i])
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
	if data["bar_orientation"] == "horizontal" then	
		if begin == 'left' then
			endx = startx + size
			
		elseif begin == "right" then
			endx = startx - size
		end
		endy = starty
		
	elseif data["bar_orientation"] == "vertical" then
		if begin == "up" then 
			endy = starty + size
		elseif begin == "down" then
			endy = starty - size
		end
		endx = startx

	end
	local com, val,val_num = string.format('${%s %s}',data["name"],data["arg"]),0,0
	
	--Draw the background of the gauge
	if data["background"] == 'yes' then
		
		cairo_new_path(cr)
		cairo_set_line_width (cr,0)
		cairo_set_line_cap  (cr, line_cap)
		cairo_set_source_rgba (cr,rgb_to_r_g_b(data["back_color"],data["back_alpha"]))
		cairo_move_to (cr,startx,starty)
		cairo_line_to (cr,endx,endy)
		if data["bar_orientation"] == "horizontal" then
		
			cairo_line_to (cr,endx, endy +line_width)
			cairo_line_to (cr, startx, endy + line_width)

		elseif data["bar_orientation"] == "vertical" then
			cairo_line_to (cr,endx + line_width, endy )
			cairo_line_to (cr, startx + line_width, starty )

		end
		cairo_close_path(cr)
		cairo_fill_preserve(cr)
	--cairo_stroke (cr)
		--[[
		cairo_set_line_width (cr,line_width)
		cairo_set_line_cap  (cr, line_cap)
		cairo_set_source_rgba (cr,rgb_to_r_g_b(data["back_color"],data["back_alpha"]))
		cairo_move_to (cr,startx,starty)
		cairo_line_to (cr,endx,endy)
		cairo_stroke (cr)
	]]
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
	val_num = tonumber(conky_parse(com))
	if data["bar_orientation"] == "horizontal" then

		val = val_num*(endx - startx)/100
	elseif data["bar_orientation"] == "vertical" then
		local delta = endy - starty
		val = val_num*(endy - starty)/100
	end
	 

	if data["type_bar"] == "fill" then
		fillx = startx
		filly = starty
		if data["bar_orientation"] == "horizontal" then
			end_fillx = startx + val
			end_filly = starty
		elseif data["bar_orientation"] =="vertical" then
			end_fillx = startx
			end_filly = starty + val


		end

	elseif data["type_bar"] == "cursor" then
		if data["bar_orientation"] == "horizontal" then
			if begin == 'left' then
				fillx = math.max(startx + val - data["cursor_width"]/2,startx)
				end_fillx = math.min(startx + val + data["cursor_width"]/2,startx + size)
			elseif begin == 'right' then 
			
				fillx = math.max(startx + val - data["cursor_width"]/2,startx - size)
				end_fillx = math.min(startx + val + data["cursor_width"]/2 , startx )
			end
			filly = starty
			
			end_filly = starty
		elseif data["bar_orientation"] == "vertical" then
			if begin == 'up' then
				filly = math.max(starty + val - data["cursor_width"]/2,starty)
				end_filly = math.min(starty + val + data["cursor_width"]/2,starty + size)
			elseif begin == 'down' then
				filly = math.min(starty + val - data["cursor_width"]/2,starty)
				end_filly = math.max(starty + val + data["cursor_width"]/2,starty + size)
			end
			fillx = startx 

			end_fillx = startx
		end
		

	end
	cairo_new_path(cr)
	cairo_set_line_width (cr,0)
	cairo_set_line_cap  (cr, line_cap)
	cairo_set_source_rgba (cr,rgb_to_r_g_b(data["front_color"],data["front_alpha"]))
	cairo_move_to (cr,fillx ,filly)
	cairo_line_to (cr,end_fillx,end_filly)
	if data["bar_orientation"] == "horizontal" then
		cairo_line_to (cr,end_fillx,end_filly + line_width)
		cairo_line_to (cr,fillx,end_filly + line_width)
		cairo_close_path(cr)
	elseif data["bar_orientation"] == "vertical" then
		cairo_line_to (cr,end_fillx + line_width,end_filly)
		cairo_line_to (cr,fillx + line_width,filly)
		cairo_close_path(cr)
	end
	--cairo_close_path(cr)
	cairo_fill_preserve(cr)
	--[[
	cairo_set_line_width (cr,line_width)
	cairo_set_line_cap  (cr, line_cap)
	cairo_set_source_rgba (cr,rgb_to_r_g_b(data["front_color"],data["front_alpha"]))
	cairo_move_to (cr,fillx ,filly)
	cairo_line_to (cr,end_fillx,end_filly)
	cairo_stroke (cr)
	]]
	if data["labl"] == "yes" then

		local labelx,labely = 0,0
		local full_text = data["labl_prefix"]..tostring(val_num)..data["labl_suffix"]
		local maxi = tostring(data["val_max"])
		local len = string.len(data["labl_prefix"]..maxi..data["labl_suffix"])
		local pos = data["labl_pos"]
		if  pos == "left" then
			labelx = startx + data["labl_deltax"] - len*data["font_size"]
			labely = starty  + data["labl_deltay"]
		
		elseif pos =="right" then
			labelx = startx + data["labl_deltax"] + size
			labely = starty  + data["labl_deltay"]
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
			
	end

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
		--boucle_labl(cr,labl_cpu)
		--boucle_labl(cr,gpu_labl)
		--boucle_labl(cr,horloge)
		--boucle_labl(cr,divers)
		boucle_cercle(cr,horloge_circle)
		---------------------------------------



		--##############################
	end-- if updates>5
	cairo_surface_destroy(cs)
	cairo_destroy(cr)
	

end-- end main function
