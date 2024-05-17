extends Node2D

var lvl_end = false

const DOORS_OPEN = preload("res://music/doors_open.wav")

func _process(delta: float) -> void:
	if !lvl_end && $Node2D.get_children().size() == 1:
		var doorsChildren = $Doors.get_children()
	
		for door in doorsChildren:
			door.colide_on()
		
		var sound = get_node('../../SFX')
		sound.stream = DOORS_OPEN
		sound.play()
		$Doors.show()
		
		$Label.show()
		lvl_end = true
