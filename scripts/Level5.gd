extends Node2D

var totem_1_die = false
var totem_2_die = false
var totem_3_die = false
var totem_4_die = false



func _on_mini_totem_totem_died() -> void:
	totem_1_die = true
	if totem_1_die && totem_2_die && totem_3_die && totem_4_die:
		emit_signal('boss_open')
	$Totemix2.queue_free()
	


func _on_mini_totem_2_totem_died() -> void:
	totem_2_die = true
	if totem_1_die && totem_2_die && totem_3_die && totem_4_die:
		emit_signal('boss_open')
	$Totemix4.queue_free()


func _on_mini_totem_4_totem_died() -> void:
	totem_4_die = true
	if totem_1_die && totem_2_die && totem_3_die && totem_4_die:
		emit_signal('boss_open')
	$Totemix3.queue_free()


func _on_mini_totem_3_totem_died() -> void:
	totem_3_die = true
	if totem_1_die && totem_2_die && totem_3_die && totem_4_die:
		emit_signal('boss_open')
	$Totemix1.queue_free()
	
signal boss_open


func _on_boss_open() -> void:
	$Angry.start()
	$Angry2.start()
	$Barrier.queue_free()
	$Barrier3.queue_free()
	$Barrier2.queue_free()
	$Barrier4.queue_free()
	
func _on_totem_boss_died() -> void:
	$Angry2.stop()
	$Angry.stop()
	$AngryNode.queue_free()
	$Totemix5.queue_free()
	var doorsChildren = $Doors.get_children()
	for door in doorsChildren:
		door.colide_on()
			
	$Doors.show()
	$Label.show()


func _on_angry_timeout() -> void:
	Spawning.spawn({"position": $Totem.global_position, "rotation": 0
	}, "angry_boss", "two")
	Spawning.spawn({"position": $Totem.global_position, "rotation": 0
	}, "angry_boss2", "two")
	Spawning.spawn({"position": $Totem.global_position, "rotation": 0
	}, "angry_boss3", "two")
	Spawning.spawn({"position": $Totem.global_position, "rotation": 0
	}, "angry_boss4", "two")
	Spawning.spawn({"position": $Totem.global_position, "rotation": 0
	}, "angry_boss4", "two")
	Spawning.spawn({"position": $Totem.global_position, "rotation": 0
	}, "angry_boss5", "two")
	Spawning.spawn({"position": $Totem.global_position, "rotation": 0
	}, "angry_boss6", "two")
	Spawning.spawn({"position": $Totem.global_position, "rotation": 0
	}, "angry_boss7", "two")
	Spawning.spawn({"position": $Totem.global_position, "rotation": 0
	}, "angry_boss8", "two")

	


func _on_angry_2_timeout() -> void:
	Spawning.spawn({"position": $Totem.global_position, "rotation": 0
	}, "circlo2", "two")
