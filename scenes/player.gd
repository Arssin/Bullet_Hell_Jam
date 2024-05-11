extends CharacterBody2D
class_name Player

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var health_bar: TextureProgressBar = $CanvasLayer/HealthBar


var rock := preload("res://player/player_projectile_rock.tscn")


var player_can_attack = true

@export var player_speed = 30


func _ready() -> void:
	health_bar.max_value = PlayerGlobals.player_max_health
	health_bar.value = PlayerGlobals.player_max_health
	PlayerGlobals.player_get_dmg.connect(_on_dmg_taken)
	PlayerGlobals.player_dead.connect(_player_death)
	animation_player.play("Idle")

func _physics_process(delta: float) -> void:
	var position_mouse_x = get_global_mouse_position().x
	if position_mouse_x < global_position.x:
		sprite_2d.flip_h = true
		$CollisionShape2D.position.x = -0.5
	else:
		$CollisionShape2D.position.x = 0.5
		sprite_2d.flip_h = false
		
	move_and_slide()
	


	
func _input(event: InputEvent) -> void:
	var input_direction = Input.get_vector("move_left","move_right","move_up", "move_down")
	
	if Input.is_action_just_pressed("attack") && player_can_attack:
		shoot(rock)
		$PlayerAttack.start()
		player_can_attack = false

	if input_direction:
		animation_player.play("Run")
		velocity = input_direction * player_speed
	else:
		animation_player.play("Idle")
		velocity = input_direction * 0
		
		

func shoot(projectile):
	var bullet = projectile.instantiate()
	bullet.position = $".".global_position
	bullet.direction = global_position.direction_to(get_global_mouse_position())
	add_child(bullet)


func _on_player_attack_timeout() -> void:
	$PlayerAttack.stop()
	player_can_attack = true

	
func update_player_healthbar(value):
	health_bar.value = value

func _on_dmg_taken(value):
	update_player_healthbar(value)
	
func _player_death():
	queue_free()
	
