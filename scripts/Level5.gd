extends Node2D

var totem_1_die = false
var totem_2_die = false
var totem_3_die = false
var totem_4_die = false



func _on_mini_totem_totem_died() -> void:
	totem_1_die = true
	if totem_1_die && totem_2_die && totem_3_die && totem_4_die:
		emit_signal('boss_open')
	$Totemix3.queue_free()
	


func _on_mini_totem_2_totem_died() -> void:
	totem_2_die = true
	if totem_1_die && totem_2_die && totem_3_die && totem_4_die:
		emit_signal('boss_open')
	$Totemix4.queue_free()


func _on_mini_totem_4_totem_died() -> void:
	totem_4_die = true
	if totem_1_die && totem_2_die && totem_3_die && totem_4_die:
		emit_signal('boss_open')
	$Totemix2.queue_free()


func _on_mini_totem_3_totem_died() -> void:
	totem_3_die = true
	if totem_1_die && totem_2_die && totem_3_die && totem_4_die:
		emit_signal('boss_open')
	$Totemix1.queue_free()
	
signal boss_open


func _on_boss_open() -> void:
	$StaticBody2D.queue_free()


func _on_totem_boss_died() -> void:
	var doorsChildren = $Doors.get_children()
	for door in doorsChildren:
		door.colide_on()
			
	$Doors.show()
	$Label.show()
