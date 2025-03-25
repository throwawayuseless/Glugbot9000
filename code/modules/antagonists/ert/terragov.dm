// ********************************************************************
// ** TerraGov **
// ********************************************************************
/datum/antagonist/ert/terragov
	name = "TerraGov Shock Trooper"
	outfit = /datum/outfit/job/terragov/ert
	random_names = FALSE
	role = "Shock Trooper"

/datum/antagonist/ert/terragov/inspector
	name = "TerraGov Inspector"
	outfit = /datum/outfit/job/terragov/ert/inspector
	role = "Terran Inspector"

/datum/antagonist/ert/terragov/inspector/greet()
	to_chat(owner, "<B><font size=3 color=red>You are the Terran Inspector.</font></B>")
	to_chat(owner, "The Department of Administrative Affairs is sending you to [station_name()] with the task: [ert_team.mission.explanation_text]")
