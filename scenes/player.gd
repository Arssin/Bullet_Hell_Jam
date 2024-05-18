extends CharacterBody2D
class_name Player

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var health_bar: TextureProgressBar = $CanvasLayer/HealthBar
@export var ghost_node: PackedScene
@onready var ghost_timer: Timer = $GhostTimer
@onready var bullet_pattern: Path2D = $Shoot/BulletPattern

const PLAYER_GOT_HIT = preload("res://music/player_got_hit.wav")
const ATTACK_PLAYER = preload("res://music/attack_player.wav")

var is_immortal = false
var player_can_attack = true
var dash_on_cd = false



func _ready() -> void:
	Spawning.create_pool("2","player",150)
	Spawning.create_pool("111","player",150)
	Spawning.create_pool("112","player",150)
	health_bar.max_value = PlayerGlobals.player_max_health
	health_bar.value = PlayerGlobals.player_health
	PlayerGlobals.player_get_dmg.connect(_on_dmg_taken)
	PlayerGlobals.player_dead.connect(_player_death)
	animation_player.play("Idle")
	
func _process(delta: float) -> void:
	var input_direction = Input.get_vector("move_left","move_right","move_up", "move_down")
	if Input.is_action_just_pressed("attack") && player_can_attack or Input.is_action_pressed("attack") && player_can_attack:
		attack_spawn()
		$PlayerAttack.start()
		player_can_attack = false
		
	if Input.is_action_just_pressed("dash") && !dash_on_cd:
		ghost_timer.start()
		dash(input_direction)
	

func _physics_process(delta: float) -> void:
	var position_mouse_x = get_global_mouse_position().x
	$WeaponMarker.look_at(get_global_mouse_position())
	

	if position_mouse_x < global_position.x:
		sprite_2d.flip_h = true
		$CollisionShape2D.position.x = -0.5
	else:
		$CollisionShape2D.position.x = 0.5
		sprite_2d.flip_h = false
		
	move_and_slide()
	


func add_ghost():
	var ghost = ghost_node.instantiate()
	ghost.set_property(global_position,$Sprite2D.scale * 1.5)
	get_tree().current_scene.add_child(ghost)


func dash(direction):
	$DashCd.start()
	dash_on_cd = true
	set_collision_layer_value(3,false)
	velocity = direction * 600
	#set_collision_layer_value(3,true)

	#var isDashing = true
	#print('go')
	#var tween = get_tree().create_tween()
	#tween.tween_property(self, "position", position + velocity * 0.9, 0.45)
	#await tween.finished
	#$DashCd.start()
	#ghost_timer.stop()
	
func _input(event: InputEvent) -> void:
	var input_direction = Input.get_vector("move_left","move_right","move_up", "move_down")
		
	if input_direction:
		animation_player.play("Run")
		velocity = input_direction * PlayerGlobals.player_move_speed
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
	var SFX = get_node("../../../SFX_PLAYER")
	SFX.stream = PLAYER_GOT_HIT
	SFX.play()
	update_player_healthbar(value)
	
func _player_death():
	var SFX = get_node("../../../SFX_PLAYER")
	var showDead = get_node('../../../CanvasLayer/DEAD')
	showDead.visible = true
	get_tree().paused = true
	


func _on_ghost_timer_timeout() -> void:
	set_collision_layer_value(3,true)
	#add_ghost()
	


func _on_dash_cd_timeout() -> void:
	dash_on_cd = false
	
	
var new_pattern: PatternLine = PatternLine.new()
var pattern_two : PatternOne = PatternOne.new()
var pattern_three : PatternOne = PatternOne.new()

func attack_spawn():
	var SFX = get_node("../../../SFX_PLAYER")
	SFX.stream = ATTACK_PLAYER
	SFX.play()
	new_pattern.offset = Vector2i(0,0)
	new_pattern.bullet = "2"
	new_pattern.nbr = 1
	new_pattern.forced_target = NodePath("../../WeaponMarker/Target")
	Spawning.new_pattern("pattern_id", new_pattern)
	
	Spawning.spawn({"position": $WeaponMarker/FromTarget.global_position, "rotation": $WeaponMarker.rotation}, "pattern_id", "player")
	
	if PlayerGlobals.player2ndShoot:
		pattern_two.bullet = "111"
		pattern_two.nbr = 1
		pattern_two.forced_target = NodePath("../../WeaponMarker/Target/Target2")
		Spawning.new_pattern("pattern_ids", pattern_two)


		Spawning.spawn({"position": $WeaponMarker/FromTarget2.global_position, "rotation": $WeaponMarker.rotation}, "pattern_ids", "player")
	
	if PlayerGlobals.player3rdShoot:
		pattern_three.bullet = "112"
		pattern_three.nbr = 1
		pattern_three.forced_target = NodePath("../../WeaponMarker/Target/Target3")
		Spawning.new_pattern("pattern_idss", pattern_three)

		Spawning.spawn({"position": $WeaponMarker/FromTarget3.global_position, "rotation": $WeaponMarker.rotation}, "pattern_idss", "player")



