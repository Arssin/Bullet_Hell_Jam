extends CharacterBody2D

@export var move_on_path: PathFollow2D
@export var movement_speed = 10

var previous_global_position = Vector2.ZERO

@onready var player = get_node('../../Player')

func _ready() -> void:
	$AnimatedSprite2D.play("cristal")
	previous_global_position = global_position

func _physics_process(delta: float) -> void:
	print(player.global_position)
	move_on_path.progress += movement_speed
	position = move_on_path.position
	var current_global_position = global_position
	previous_global_position = current_global_position
	
func 
