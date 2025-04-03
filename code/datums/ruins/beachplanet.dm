// Hey! Listen! Update _maps\map_catalogue.txt with your new ruins!

/datum/map_template/ruin/beachplanet
	prefix = "_maps/RandomRuins/BeachRuins/"
	ruin_type = RUINTYPE_BEACH

/datum/map_template/ruin/beachplanet/crashedengie
	name = "Crashed Engineer Ship"
	id = "beach_crashed_engineer"
	description = "An abandoned camp built by a crashed engineer"
	suffix = "beach_crashed_engineer.dmm"
	ruin_tags = list(RUIN_TAG_MINOR_COMBAT, RUIN_TAG_MEDIUM_LOOT, RUIN_TAG_HAZARDOUS)

/datum/map_template/ruin/beachplanet/ancient
	name = "Ancient Danger"
	id = "beach_ancient"
	description = "As you draw near the ancient wall, a sense of foreboding overcomes you. You aren't sure why, but you feel this dusty structure may contain great dangers."
	suffix = "beach_ancient_ruin.dmm"
	ruin_tags = list(RUIN_TAG_MEDIUM_COMBAT, RUIN_TAG_MEDIUM_LOOT, RUIN_TAG_LIVEABLE)

/datum/map_template/ruin/beachplanet/frontiersmen_depot
	name = "Frontiersmen Depot"
	id = "beach_bunkers"
	description = "A poorly constructed jumble of bunkers, currently held by the Frontiersmen Fleet for usage as a supply depot."
	suffix = "beach_bunkers.dmm"
	ruin_tags = list(RUIN_TAG_MEDIUM_COMBAT, RUIN_TAG_MEDIUM_LOOT, RUIN_TAG_LIVEABLE)
