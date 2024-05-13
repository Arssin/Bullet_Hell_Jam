extends Node2D

@export var laser_length := 1.00
@export var target_pos := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$RayCast2D/Line2D.scale.y = laser_length
	$RayCast2D.target_position.y = target_pos
	$Timer.start()


func _on_timer_timeout() -> void:
	$RayCast2D.enabled = true
