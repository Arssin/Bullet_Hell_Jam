extends Node2D

var firstC = false
var secC = false
var thridC = false
var fourthC = false
var completeLvl = false

func check_portal(portalN: String):
	var portal = get_node_or_null(portalN)
	
	if portal:
		for child in portal.get_children():
			if child.has_method("new_wander_pos"):
				return false
	
	return true


func _on_timer_timeout() -> void:
	
	firstC = check_portal("Portal")
	secC = check_portal("Portal2")
	thridC = check_portal("Portal3")
	fourthC = check_portal("Portal4")

		
	if fourthC && thridC && secC && firstC:
		completeLvl = true
	else:
		completeLvl = false
		
	if completeLvl:
		$Label.show()

