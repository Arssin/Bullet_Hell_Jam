extends Node2D

var firstC = false
var secC = false
var thridC = false
var fourthC = false
var completeLvl = false


func _on_timer_timeout() -> void:
	
	
	var portal = get_node_or_null("Portal").get_children()
	var portalT = get_node_or_null("Portal2").get_children()
	var portalTh = get_node_or_null("Portal3").get_children()
	var portalF = get_node_or_null("Portal4").get_children()
	
	if portal:
		pass
		pass
	if portalTh:
		pass
	if portalF:
		pass
	#if portal:
		#var small_mob = portal.get_node_or_null("Small_Runing_Mob")
		#if small_mob:
			#firstC = false
		#else: 
			#firstC = true
		#
	#if portalT:
		#var small_mob = portalT.get_node_or_null("Small_Runing_Mob")
		#if small_mob:
			#secC = false
		#else: 
			#secC = true
#
	#if portalTh:
		#var small_mob = portalTh.get_node_or_null("Small_Runing_Mob")
		#if small_mob:
			#thridC = false
		#else: 
			#thridC = true
			#
	#if portalF:
		#var small_mob = portalF.get_node_or_null("Small_Runing_Mob")
		#if small_mob:
			#fourthC = false
		#else: 
			#fourthC = true
		
	if fourthC && thridC && secC && firstC:
		completeLvl = true
	else:
		completeLvl = false
		
	if completeLvl:
		$Label.show()

