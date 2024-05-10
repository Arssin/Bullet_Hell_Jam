extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D


@export var player_speed = 30


func _ready() -> void:
	animation_player.play("Idle")

func _physics_process(delta: float) -> void:
	var position_mouse_x = get_global_mouse_position().x
	
	if position_mouse_x < global_position.x:
		sprite_2d.flip_h = true
	else:
		sprite_2d.flip_h = false
		
	move_and_slide()

	
func _input(event: InputEvent) -> void:
	var input_direction = Input.get_vector("move_left", "move_right","move_up", "move_down")
	
	if input_direction:
		animation_player.play("run")
		velocity = input_direction * player_speed
	else:
		animation_player.play("idle")
		velocity = input_direction * 0
