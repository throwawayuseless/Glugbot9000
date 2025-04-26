/datum/outfit/job/terragov
	name = "TerraGov Base Outfit"

	faction_icon = "bg_terragov"

/datum/outfit/job/terragov/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	if(visualsOnly)
		return
	H.faction |= list(FACTION_PLAYER_TERRAGOV)
	H.grant_language(/datum/language/solarian_international)

/datum/outfit/job/terragov/assistant
	name = "TerraGov - Scribe"
	id_assignment = "Scribe"
	jobtype = /datum/job/assistant
	job_icon = "scribe"

	head = /obj/item/clothing/head/beret/terragov/plain
	uniform = /obj/item/clothing/under/terragov/formal
	shoes = /obj/item/clothing/shoes/laceup
	suit = /obj/item/clothing/suit/terragov

/datum/outfit/job/terragov/bureaucrat
	name = "TerraGov - Bureaucrat"
	id_assignment = "Bureaucrat"
	jobtype = /datum/job/curator
	job_icon = "curator"

	head = /obj/item/clothing/head/beret/terragov
	uniform = /obj/item/clothing/under/terragov/formal
	shoes = /obj/item/clothing/shoes/laceup
	suit = /obj/item/clothing/suit/terragov/bureaucrat
	l_hand = /obj/item/storage/bag/books
	r_pocket = /obj/item/key/displaycase
	l_pocket = /obj/item/laser_pointer
	accessory = /obj/item/clothing/accessory/pocketprotector/full
	backpack_contents = list(
		/obj/item/barcodescanner = 1
	)

/datum/outfit/job/terragov/captain
	name = "TerraGov - Captain"
	jobtype = /datum/job/captain
	job_icon = "solgovrepresentative" // idk

	id = /obj/item/card/id/gold
	gloves = /obj/item/clothing/gloves/combat
	ears = /obj/item/radio/headset/terragov/alt/captain
	uniform =  /obj/item/clothing/under/terragov/formal/captain
	suit = /obj/item/clothing/suit/armor/vest/terragov/captain
	shoes = /obj/item/clothing/shoes/laceup
	head = /obj/item/clothing/head/terragov/captain
	backpack_contents = list(/obj/item/melee/classic_baton/telescopic=1)

	backpack = /obj/item/storage/backpack/captain
	satchel = /obj/item/storage/backpack/satchel/cap
	duffelbag = /obj/item/storage/backpack/duffelbag/captain
	courierbag = /obj/item/storage/backpack/messenger/com

	accessory = /obj/item/clothing/accessory/medal/gold/captain

	chameleon_extras = list(/obj/item/gun/energy/e_gun, /obj/item/stamp/captain)

/datum/outfit/job/terragov/shocktrooper
	name = "TerraGov - Shock Trooper"
	id_assignment = "Shock Trooper"
	jobtype = /datum/job/officer
	job_icon = "Sonnensöldner"

	id = /obj/item/card/id/terragov
	uniform = /obj/item/clothing/under/terragov
	suit = /obj/item/clothing/suit/armor/vest/terragov
	ears = /obj/item/radio/headset/terragov/alt
	gloves = /obj/item/clothing/gloves/combat
	head = /obj/item/clothing/head/terragov/shocktrooper
	r_pocket = null
	l_pocket = null
	shoes = /obj/item/clothing/shoes/workboots
	back = /obj/item/storage/backpack
	box = /obj/item/storage/box/survival
	backpack_contents = list(/obj/item/crowbar/power)

/datum/outfit/job/terragov/representative
	name = "TerraGov - Terran Representative"
	jobtype = /datum/job/terragov
	job_icon = "solgovrepresentative"

	id = /obj/item/card/id/terragov
	head = /obj/item/clothing/head/terragov
	uniform = /obj/item/clothing/under/terragov/formal
	accessory = /obj/item/clothing/accessory/waistcoat/terragov
	neck = /obj/item/clothing/neck/cloak/terragov
	suit = /obj/item/clothing/suit/toggle/terragov
	alt_suit = /obj/item/clothing/suit/armor/terragov_trenchcoat
	dcoat = /obj/item/clothing/suit/hooded/wintercoat
	gloves = /obj/item/clothing/gloves/color/white
	shoes = /obj/item/clothing/shoes/laceup
	ears = /obj/item/radio/headset/terragov/captain
	glasses = /obj/item/clothing/glasses/sunglasses

	implants = list(/obj/item/implant/mindshield)

	backpack_contents = list(
		/obj/item/melee/knife/letter_opener = 1
	)

/datum/outfit/job/terragov/overseer
	name = "TerraGov - Overseer"
	id_assignment = "Overseer"
	jobtype = /datum/job/head_of_personnel
	job_icon = "headofpersonnel"

	id = /obj/item/card/id/terragov
	ears = /obj/item/radio/headset/terragov/captain
	uniform = /obj/item/clothing/under/terragov/formal
	head = /obj/item/clothing/head/terragov
	neck = /obj/item/clothing/neck/cloak/overseer
	suit = /obj/item/clothing/suit/armor/vest/terragov/overseer
	shoes = /obj/item/clothing/shoes/laceup

	backpack_contents = list(/obj/item/storage/box/ids=1,\
		/obj/item/melee/classic_baton/telescopic=1, /obj/item/modular_computer/tablet/preset/advanced = 1)

	chameleon_extras = list(/obj/item/gun/energy/e_gun, /obj/item/stamp/officer)

/datum/outfit/job/terragov/doctor
	name = "TerraGov - Medical Doctor"
	jobtype = /datum/job/doctor
	job_icon = "medicaldoctor"

	ears = /obj/item/radio/headset/headset_med
	uniform = /obj/item/clothing/under/terragov/formal
	accessory = /obj/item/clothing/accessory/armband/medblue
	shoes = /obj/item/clothing/shoes/laceup
	head = /obj/item/clothing/head/terragov_surgery
	suit =  /obj/item/clothing/suit/terragov/jacket
	l_hand = /obj/item/storage/firstaid/medical

	backpack = /obj/item/storage/backpack/medic
	satchel = /obj/item/storage/backpack/satchel/med
	duffelbag = /obj/item/storage/backpack/duffelbag/med
	courierbag = /obj/item/storage/backpack/messenger/med
	box = /obj/item/storage/box/survival/medical

/datum/outfit/job/terragov/miner
	name = "TerraGov - Field Engineer"
	id_assignment = "Field Engineer"
	jobtype = /datum/job/mining
	job_icon = "shaftminer"

	ears = /obj/item/radio/headset/headset_cargo/mining
	shoes = /obj/item/clothing/shoes/workboots/mining
	gloves = /obj/item/clothing/gloves/explorer
	uniform = /obj/item/clothing/under/terragov
	accessory = /obj/item/clothing/accessory/armband/cargo
	head = /obj/item/clothing/head/hardhat/terragov
	suit =  /obj/item/clothing/suit/hazardvest/terragov
	l_pocket = /obj/item/reagent_containers/hypospray/medipen/survival
	r_pocket = /obj/item/storage/bag/ore	//causes issues if spawned in backpack
	backpack_contents = list(
		/obj/item/flashlight/seclite=1,\
		/obj/item/melee/knife/survival=1,\
		/obj/item/stack/marker_beacon/ten=1)

	backpack = /obj/item/storage/backpack/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	duffelbag = /obj/item/storage/backpack/duffelbag
	box = /obj/item/storage/box/survival/mining

/datum/outfit/job/terragov/psychologist
	name = "TerraGov - Psychologist"
	jobtype = /datum/job/psychologist
	job_icon = "psychologist"

	head = /obj/item/clothing/head/fedora/terragov
	suit = /obj/item/clothing/suit/terragov/suit
	ears = /obj/item/radio/headset/headset_srvmed
	uniform = /obj/item/clothing/under/terragov/formal
	shoes = /obj/item/clothing/shoes/laceup
	id = /obj/item/card/id
	l_hand = /obj/item/clipboard

	backpack = /obj/item/storage/backpack/medic
	satchel = /obj/item/storage/backpack/satchel/med
	duffelbag = /obj/item/storage/backpack/duffelbag/med

/datum/outfit/job/terragov/patient
	name = "TerraGov - Attentive Care Patient"
	id_assignment = "Attentive Care Patient"
	jobtype = /datum/job/prisoner
	job_icon = "assistant" // todo: bug rye for patient icon // rye. rye. give me 50 gazillion billion dollars paypal

	id = /obj/item/card/id/patient
	uniform = /obj/item/clothing/under/rank/medical/gown
	alt_suit = null
	shoes = /obj/item/clothing/shoes/sandal/slippers

/datum/outfit/job/terragov/engineer
	name = "TerraGov - Ship Engineer"
	id_assignment = "Ship Engineer"
	jobtype = /datum/job/engineer
	job_icon = "stationengineer"

	belt = /obj/item/storage/belt/utility/full/engi
	ears = /obj/item/radio/headset/headset_eng
	uniform = /obj/item/clothing/under/terragov/formal
	accessory = /obj/item/clothing/accessory/armband/engine
	head = /obj/item/clothing/head/hardhat/terragov
	suit =  /obj/item/clothing/suit/hazardvest/terragov
	shoes = /obj/item/clothing/shoes/workboots
	r_pocket = /obj/item/t_scanner

	backpack = /obj/item/storage/backpack/industrial
	satchel = /obj/item/storage/backpack/satchel/eng
	duffelbag = /obj/item/storage/backpack/duffelbag/engineering
	courierbag = /obj/item/storage/backpack/messenger/engi

	box = /obj/item/storage/box/survival/engineer
	backpack_contents = list(/obj/item/modular_computer/tablet/preset/advanced=1)

/datum/outfit/job/terragov/quartermaster
	name = "TerraGov - Logistics Deck Officer"
	id_assignment = "Logistics Deck Officer"
	jobtype = /datum/job/qm
	job_icon = "quartermaster"

	ears = /obj/item/radio/headset/terragov/captain
	uniform = /obj/item/clothing/under/terragov/formal
	suit = /obj/item/clothing/suit/terragov/overcoat
	shoes = /obj/item/clothing/shoes/laceup
	head = /obj/item/clothing/head/flatcap/terragov
	glasses = /obj/item/clothing/glasses/sunglasses
	l_hand = /obj/item/clipboard
	backpack_contents = list(/obj/item/modular_computer/tablet/preset/cargo=1)
