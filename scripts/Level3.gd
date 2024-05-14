extends Node2D

var lvl_end = false


func _process(delta: float) -> void:
	if !lvl_end && $Node2D.get_children().size() == 1:
		$Doors.show()
		$Label.show()
		lvl_end = true
