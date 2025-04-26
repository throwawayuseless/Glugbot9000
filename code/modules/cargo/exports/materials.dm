/datum/export/material
	cost = 5 // Cost per MINERAL_MATERIAL_AMOUNT, which is 2000cm3 as of April 2016.
	desc = "Credit value is equal to 2000 cm3 of material. The standard sheet printing volume."

	elasticity_coeff = 0.0002
	recovery_ds = 0.02 MINUTES
	var/material_id = null
	export_types = list(
		/obj/item/stack/sheet,
		/obj/item/stack/tile,
		/obj/item/stack/ore,
		/obj/item/coin
	)
// Yes, it's a base type containing export_types.
// But it has no material_id, so any applies_to check will return false, and these types reduce amount of copypasta a lot

/datum/export/material/get_amount(obj/O)
	if(!material_id)
		return 0
	if(!isitem(O))
		return 0
	var/obj/item/I = O
	if(!(SSmaterials.GetMaterialRef(material_id) in I.custom_materials))
		return 0

	var/amount = I.custom_materials[SSmaterials.GetMaterialRef(material_id)]

	if(istype(I, /obj/item/stack/ore))
		amount *= 0.8 // Station's ore redemption equipment is really goddamn good.

	return round(amount/MINERAL_MATERIAL_AMOUNT)

// Materials. Prices have been heavily nerfed from the original values; mining is boring, so it shouldn't be a good way to make money.

/datum/export/material/diamond
	cost = 125
	unit_name = "cm3 of diamond"
	material_id = /datum/material/diamond

/datum/export/material/plasma
	cost = 25
	unit_name = "cm3 of plasma"
	material_id = /datum/material/plasma

/datum/export/material/uranium
	cost = 25
	unit_name = "cm3 of uranium"
	material_id = /datum/material/uranium

/datum/export/material/gold
	cost = 30
	unit_name = "cm3 of gold"
	material_id = /datum/material/gold

/datum/export/material/silver
	cost = 10
	unit_name = "cm3 of silver"
	material_id = /datum/material/silver

/datum/export/material/titanium
	cost = 30
	unit_name = "cm3 of titanium"
	material_id = /datum/material/titanium

/*
/datum/export/material/hellstone
	cost = 125
	unit_name = "cm3 of hellstone"
	material_id = /datum/material/hellstone
*/

/datum/export/material/bscrystal
	unit_name = "bluespace crystals"
	cost = 75
	material_id = /datum/material/bluespace

/datum/export/material/plastic
	unit_name = "cm3 of plastic"
	cost = 2
	material_id = /datum/material/plastic

/datum/export/material/metal
	unit_name = "cm3 of metal"
	cost = 2
	material_id = /datum/material/iron
	export_types = list(
		/obj/item/stack/sheet/metal,
		/obj/item/stack/tile/plasteel,
		/obj/item/stack/rods,
		/obj/item/stack/ore,
		/obj/item/coin
	)

/datum/export/material/glass
	unit_name = "cm3 of glass"
	cost = 1
	material_id = /datum/material/glass
	export_types = list(
		/obj/item/stack/sheet/glass,
		/obj/item/stack/ore,
		/obj/item/shard
	)
