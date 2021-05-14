-----------------------------------------------------------------------------
--                               conkyrc_seamod
-- Date    : 04/23/2016
-- Author  : SeaJey and Maxiwell
-- Conky   : >= 1.10 
-- License : Distributed under the terms of GNU GPL version 2 or later
-----------------------------------------------------------------------------

-- custom settings
_font0 = 'Cascadia Code PL:size=11'
_font_bf = 'Cascadia Code PL:size=11:style=bold'
_font_nm = 'Cascadia Code PL:size=11:style=normal'
_font_bf_sm = 'Cascadia Code PL:size=11:style=bold'
_font_nm_sm = 'Cascadia Code PL:size=11:style=normal'
font0 = '${font ' .. _font0 .. '}'
font_bf = '${font ' .. _font_bf .. '}'
font_nm = '${font ' .. _font_nm .. '}'
font_bf_sm = '${font ' .. _font_bf_sm .. '}'
font_nm_sm = '${font ' .. _font_nm_sm .. '}'
--print(font_bf)
--print(font_nm)

net0 = 'eth0'
--- end of custom settings

conky.config = {

	background = true,
	update_interval = 1,

	cpu_avg_samples = 2,
	net_avg_samples = 2,
	temperature_unit = 'celsius',

	double_buffer = true,
	no_buffers = true,
	text_buffer_size = 2048,

	gap_x = 80,
	gap_y = 70,
	minimum_width = 300, minimum_height = 900,
	maximum_width = 350,

	own_window = true,
	own_window_type = 'normal',
	own_window_transparent = true,
	own_window_argb_visual = true,
	own_window_class = 'conky-semi',
	own_window_hints = 'undecorated,sticky,skip_taskbar,skip_pager,below',

	border_inner_margin = 0,
	border_outer_margin = 0,
	alignment = 'top_right',


	draw_shades = false,
	draw_outline = false,
	draw_borders = false,
	draw_graph_borders = false,

    -- show_graph_scale = true,
    -- show_graph_range = true,

	override_utf8_locale = true,
	use_xft = true,
	font = _font0,
	xftalpha = 0.5,
	uppercase = false,

-- Defining colors
	default_color = '#FFFFFF',
-- Shades of Gray
	color1 = '#DDDDDD',
	color2 = '#AAAAAA',
	color3 = '#888888',
-- Orange
--	color4 = '#EF5A29',
--	color4 = '#F05B02',
--	color4 = '3b8eea',
	color4 = '#f14c4c',
-- Green
--	color5 = '#77B753',
    color5 = '#23d18b',
-- Loading lua script for drawning rings
	lua_load = '~/.conky/seamod/seamod_rings.lua',
	lua_draw_hook_pre = 'main',

};

--${offset 15}]] .. font_nm .. [[${color1}${pre_exec lsb_release -d | cut -f 2} - $sysname $kernel
conky.text = [[
]] .. font_bf .. [[ ${color4}SYSTEM ${hr 2}
${offset 15}]] .. font_nm .. [[${color1}$sysname $kernel
# ${offset 15}]] .. font_nm .. [[${color1}Battery:  ${color3}${battery_bar 5,150 BAT0} ${color3}${battery_percent BAT0}%
${offset 15}]] .. font_nm .. [[${color1}Uptime: ${color3}$uptime

# Showing CPU Graph
${voffset 20}
${offset 125}${cpugraph cpu0 40,220 666666 666666 1}${voffset -15}
${offset 90}]] .. font_bf .. [[${color5}CPU
# Showing TOP 5 CPU-consumers
${offset 105}]] .. font_nm .. [[${color4}${top name 1}${alignr}${top cpu 1}%
${offset 105}]] .. font_nm .. [[${color1}${top name 2}${alignr}${top cpu 2}%
${offset 105}]] .. font_nm .. [[${color2}${top name 3}${alignr}${top cpu 3}%
${offset 105}]] .. font_nm .. [[${color3}${top name 4}${alignr}${top cpu 4}%
${offset 105}]] .. font_nm .. [[${color3}${top name 5}${alignr}${top cpu 5}%

#Showing memory part with TOP 5
${voffset 25}
${offset 90}]] .. font_bf .. [[${color5}MEM
${offset 105}]] .. font_nm .. [[${color4}${top_mem name 1}${alignr}${top_mem mem_res 1}
${offset 105}]] .. font_nm .. [[${color1}${top_mem name 2}${alignr}${top_mem mem_res 2}
${offset 105}]] .. font_nm .. [[${color2}${top_mem name 3}${alignr}${top_mem mem_res 3}
${offset 105}]] .. font_nm .. [[${color3}${top_mem name 4}${alignr}${top_mem mem_res 4}
${offset 105}]] .. font_nm .. [[${color3}${top_mem name 4}${alignr}${top_mem mem_res 5}

# Showing disk partitions: root, home and files
${voffset 20}
${offset 90}]] .. font_bf .. [[${color5}DISKS
${voffset -72}
${offset 250}${color1}]] .. font_bf_sm .. [[R: ${alignr}]] .. font_nm_sm .. [[${color2}${diskio_read}
${offset 250}${color1}]] .. font_bf_sm .. [[W: ${alignr}]] .. font_nm_sm .. [[${color2}${diskio_write}
${offset 120}${diskiograph 40,220 666666 666666 1000000 -l}${voffset -30}
${voffset 10}
${offset 100}]] .. font_bf_sm .. [[${color1}     /: ${alignr}$color3]] .. font_nm_sm .. [[${fs_used /} / ${fs_size /}
${offset 100}]] .. font_bf_sm .. [[${color1} /home: ${alignr}$color3]] .. font_nm_sm .. [[${fs_used /home} / ${fs_size /home}
${offset 100}]] .. font_bf_sm .. [[${color1}/mnt/c: ${alignr}$color3]] .. font_nm_sm .. [[${fs_used /mnt/c} / ${fs_size /mnt/c}
# ${offset 15}]] .. font_bf_sm .. [[${color1}Free: $color3]] .. font_nm_sm .. [[${fs_free /}${alignr}]] .. font_bf_sm .. [[${color1}Used: $color3]] .. font_nm_sm .. [[${fs_used /}
# ${offset 15}]] .. font_bf_sm .. [[${color1}Free: $color3]] .. font_nm_sm .. [[${fs_free /home}${alignr}]] .. font_bf_sm .. [[${color1}Used: $color3]] .. font_nm_sm .. [[${fs_used /home}
# ${offset 15}]] .. font_bf_sm .. [[${color1}Free: $color3]] .. font_nm_sm .. [[${fs_free /mnt/c}${alignr}]] .. font_bf_sm .. [[${color1}Used: $color3]] .. font_nm_sm .. [[${fs_used /mnt/c}

# Network data (my desktop have only LAN). ETHERNET ring is mostly useless but looks pretty, main info is in the graphs
${voffset 33}
${offset 90}]] .. font_bf .. [[${color5}ETHERNET
${voffset -20}
${offset 180}]] .. font_bf_sm .. [[${color1}Lan: ${alignr}$color3${addr eth0}
${offset 180}]] .. font_bf_sm .. [[${color1}Ext: ${alignr}$color3${execi 600 wget -q -O /dev/stdout http://checkip.dyndns.org/ | cut -d : -f 2- | cut -d \< -f -1}
# ${offset 190}]] .. font_bf_sm .. [[${alignr}$color3${execi 600 wget -q -O /dev/stdout https://www.dnsleaktest.com/ | grep from | grep -o '<p>.*<img' | grep -o '>.*<' | grep -oEi '[a-zA-Z0-9 ,]+'}

${voffset -20}
${offset 110}${color1}]] .. font_bf_sm .. [[Up: ${alignr}]] .. font_nm_sm .. [[$color2${upspeed eth0} / ${totalup eth0}
${offset 110}${upspeedgraph eth0 40,225 4B1B0C F14C4c 100000000 -l}
${offset 110}${color1}]] .. font_bf_sm .. [[Down: ${alignr}]] .. font_nm_sm .. [[$color2${downspeed eth0} / ${totaldown eth0}
${offset 110}${downspeedgraph eth0 40,225 324D23 23d18b 100000000 -l}

${color4}${hr 2}




]];
