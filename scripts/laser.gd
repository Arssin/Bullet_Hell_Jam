extends Node2D

@export var laser_length := 1.00
@export var target_pos := 0
@export var laser_timer:float = 1.00
@export var lasterEnd: float = 2.00


func _ready() -> void:
	%Timer.wait_time = laser_timer
	%EndLaser.wait_time = lasterEnd
	$RayCast2D/Line2D.scale.y = laser_length
	$RayCast2D.target_position.y = target_pos
	$Timer.start()


func _on_timer_timeout() -> void:
	$RayCast2D.enabled = true
