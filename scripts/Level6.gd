extends Node2D



func _on_black_fighter_black_knight_die() -> void:
	pass # Replace with function body.


func attack_spawn():

	Spawning.spawn({"position": $"SpawnPositions/1".global_position, "rotation": 0
	}, "black_knighto", "two")
	Spawning.spawn({"position": $"SpawnPositions/2".global_position, "rotation": 0
	}, "black_knighto", "two")
	Spawning.spawn({"position": $"SpawnPositions/3".global_position, "rotation": 0
	}, "black_knighto", "two")
	Spawning.spawn({"position": $"SpawnPositions/4".global_position, "rotation": 0
	}, "black_knighto", "two")
	Spawning.spawn({"position": $"SpawnPositions/5".global_position, "rotation": 0
	}, "black_knighto", "two")
	
func attack_spawn_two():
	pass
	#Spawning.spawn({"position": $BlackFighter.global_position, "rotation": 0
	#}, "paterno_circlo", "two")


func _on_timer_timeout() -> void:
	attack_spawn()


func _on_timer_2_timeout() -> void:
	attack_spawn_two()
