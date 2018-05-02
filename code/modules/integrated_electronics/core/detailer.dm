/obj/item/device/integrated_electronics/detailer
	name = "assembly detailer"
	desc = "A combination autopainter and flash anodizer designed to give electronic assemblies a colorful, wear-resistant finish."
	icon = 'icons/obj/assemblies/electronic_tools.dmi'
	icon_state = "detailer"
	w_class = 2
	var/data_to_write = null
	var/accepting_refs = FALSE
	var/detail_color = COLOR_ASSEMBLY_WHITE
	var/list/color_list = list(
		"black" = COLOR_ASSEMBLY_BLACK,
		"gray" = COLOR_FLOORTILE_GRAY,
		"machine gray" = COLOR_ASSEMBLY_BGRAY,
		"white" = COLOR_ASSEMBLY_WHITE,
		"red" = COLOR_ASSEMBLY_RED,
		"orange" = COLOR_ASSEMBLY_ORANGE,
		"beige" = COLOR_ASSEMBLY_BEIGE,
		"brown" = COLOR_ASSEMBLY_BROWN,
		"gold" = COLOR_ASSEMBLY_GOLD,
		"yellow" = COLOR_ASSEMBLY_YELLOW,
		"gurkha" = COLOR_ASSEMBLY_GURKHA,
		"light green" = COLOR_ASSEMBLY_LGREEN,
		"green" = COLOR_ASSEMBLY_GREEN,
		"light blue" = COLOR_ASSEMBLY_LBLUE,
		"blue" = COLOR_ASSEMBLY_BLUE,
		"purple" = COLOR_ASSEMBLY_PURPLE
		)

/obj/item/device/integrated_electronics/detailer/New()
	.=..()
	update_icon()

/obj/item/device/integrated_electronics/detailer/update_icon()
	overlays.Cut()
	var/image/detail_overlay = image('icons/obj/assemblies/electronic_tools.dmi', "detailer-color")
	detail_overlay.color = detail_color
	overlays.Add(detail_overlay)

/obj/item/device/integrated_electronics/detailer/attack_self(mob/user)
	var/color_choice = input(user, "Select color.", "Assembly Detailer") as null|anything in color_list
	if(!color_list[color_choice])
		return
	if(!in_range(src, user))
		return
	detail_color = color_list[color_choice]
	update_icon()