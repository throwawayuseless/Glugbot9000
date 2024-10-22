// Hey! Listen! Update _maps\map_catalogue.txt with your new ruins!

/datum/map_template/ruin/beachplanet
	prefix = "_maps/RandomRuins/BeachRuins/"
	allow_duplicates = FALSE
	cost = 5
	ruin_type = RUINTYPE_BEACH

/datum/map_template/ruin/beachplanet/ancient
	name = "Ancient Danger"
	id = "beach_ancient"
	description = "As you draw near the ancient wall, a sense of foreboding overcomes you. You aren't sure why, but you feel this dusty structure may contain great dangers."
	suffix = "beach_ancient_ruin.dmm"

/datum/map_template/ruin/beachplanet/town
	name = "Beachside Town"
	id = "beach_town"
	description = "A fresh town on a lovely coast, where its inhabitants are is unknown."
	suffix = "beach_ocean_town.dmm"

/datum/map_template/ruin/beachplanet/crashedengie
	name = "Crashed Engineer Ship"
	id = "beach_crashed_engineer"
	description = "An abandoned camp built by a crashed engineer"
	suffix = "beach_crashed_engineer.dmm"

/datum/map_template/ruin/beachplanet/floatresort
	name = "Floating Beach Resort"
	id = "beach_float_resort"
	description = "A hidden paradise on the beach"
	suffix = "beach_float_resort.dmm"
