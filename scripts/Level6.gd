extends Node2D

var killed = false
const DOORS_OPEN = preload("res://music/doors_open.wav")

func _ready() -> void:
	$Barrier2.collision_shape_2d.disabled = true

func _on_black_fighter_black_knight_die() -> void:
	killed = true
	Spawning.reset_bullets()
	$Timer.stop()
	$Lasers.queue_free()
	$Bullets.queue_free()
	$Barrier2.queue_free()
	$Gate.stop()
	$Gate2.stop()
	$Doors.visible = true
	var sound = get_node('../../SFX')
	sound.stream = DOORS_OPEN
	sound.play()
	var doorsChildren = $Doors.get_children()
	for door in doorsChildren:
		door.colide_on()
	$GPUParticles2D.emitting = true
	await get_tree().create_timer(2).timeout
	$GPUParticles2D.emitting = false
	


func attack_spawn():
	if !killed:
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
		Spawning.spawn({"position": $"SpawnPositions/6".global_position, "rotation": 0
		}, "black_knighto", "two")
	
 

func _on_timer_timeout() -> void:
	attack_spawn()




func _on_gate_timeout() -> void:
	$Barrier2.visible = true
	$Barrier2.collision_shape_2d.disabled = false
	$Gate2.start()
	$Gate.stop()

func _on_gate_2_timeout() -> void:
	$Barrier2.visible = false
	$Barrier2.collision_shape_2d.disabled = true
	$Gate.start()
	$Gate2.stop()
