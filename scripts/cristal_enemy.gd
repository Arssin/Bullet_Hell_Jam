extends CharacterBody2D

@export var move_on_path: PathFollow2D
@export var movement_speed = 10

var previous_global_position = Vector2.ZERO

@onready var player = get_node('../../Player')
@onready var attack: Timer = $Attack


func _ready() -> void:
	attack.wait_time = randf_range(0.7,1.5)
	$AnimatedSprite2D.play("cristal")
	previous_global_position = global_position

func _physics_process(delta: float) -> void:
	move_on_path.progress += movement_speed
	position = move_on_path.position
	var current_global_position = global_position
	previous_global_position = current_global_position
	
func attack_spawn():
	$PlayerMarker.global_position = player.global_position
	Spawning.spawn({"position": global_position, "rotation": 0}, "cristal", "two")


func _on_attack_timeout() -> void:
	attack_spawn()
