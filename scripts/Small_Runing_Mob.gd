extends CharacterBody2D

class_name RunningMob

var isAlive: bool = true
var speed: int = 30
@onready var player: Node = get_node("../../Player")
@onready var sprite = get_node("AnimatedSprite2D")
@onready var agent: NavigationAgent2D = get_node("NavigationAgent2D")
@onready var attack_cd: Timer = $AttackCd
var max_health = 50
var health = max_health
@onready var health_bar: TextureProgressBar = $HealthBar


var players = null

var move_direction: Vector2
var home_position: Vector2

func _ready() -> void:
	attack_cd.wait_time = randf_range(0.4, 2)
	home_position = self.global_position
	health_bar.max_value = max_health
	health_bar.value = health
	if isAlive:
		sprite.play("run")
		new_wander_pos()

func _physics_process(delta: float) -> void:

	if isAlive:
		var target_pos = agent.get_next_path_position()
		var move_dir = global_position.direction_to(target_pos)
		move_dir = move_dir.normalized()

		if agent.is_navigation_finished():
			move_dir = Vector2.ZERO
		
		velocity.x = move_dir.x * speed
		velocity.y = move_dir.y * speed
		move_and_slide()
		#if direction.x < 0:
			#sprite.flip_h = false
		#else:
			#sprite.flip_h = true


func _on_navigation_agent_2d_target_reached() -> void:
	var wait_time = randf_range(0.1, 1.0)
	await get_tree().create_timer(wait_time).timeout
	
	new_wander_pos()

	
func new_wander_pos():
	var pos = home_position + random_offset() * randf_range(0, 300)
	move_to_position(pos)
	
func move_to_position (to_position: Vector2, adjust_pos: bool = true):
	if not agent:
		agent = get_node("NavigationAgent2D")
	

	var map = get_world_2d().navigation_map

	agent.target_position = NavigationServer2D.map_get_closest_point(map,to_position)
		
func random_offset () -> Vector2:
	var offset = Vector2(randf_range(-10, 10),randf_range(-10, 10))
	return offset.normalized()
	

var new_pattern: PatternLine = PatternLine.new()


func attack_spawn():
	var get_player = get_node("../../Player")
	if get_player:
		$Marker_1.look_at(get_player.global_position)
		new_pattern.offset = Vector2i(0,0)
		new_pattern.bullet = "3"
		new_pattern.nbr = 1
		new_pattern.forced_pattern_lookat = true
		new_pattern.forced_target = NodePath("../../Marker_1/Marker_2:global_position")
		Spawning.new_pattern("small_mobs", new_pattern)
		
		
		Spawning.spawn({"position": %Marker_2.global_position, "rotation": $Marker_1.rotation}, "small_mobs", "small_mob")


func _on_attack_cd_timeout() -> void:
	attack_spawn()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		players = body
	

func die():
	queue_free()
		
func get_hit(value):
	health = health - (value + PlayerGlobals.additional_dmg)
	if health <= 0:
		die()
	else:
		health_bar.update_healthbar(health)
