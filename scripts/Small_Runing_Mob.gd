extends CharacterBody2D


var isAlive: bool = true
var speed: int = 20
@onready var player: Node = get_node("../../Player")
@onready var sprite = get_node("AnimatedSprite2D")
@onready var agent: NavigationAgent2D = get_node("NavigationAgent2D")
var move_direction: Vector2
var home_position: Vector2

func _ready() -> void:
	home_position = self.global_position
	if isAlive:
		sprite.play("run")
		new_wander_pos()

func _physics_process(delta: float) -> void:
	if isAlive:
		var target_pos = agent.get_next_path_position()
		var move_dir = global_position.direction_to(target_pos)
		move_dir = move_dir.normalized()
		#var direction: Vector2 = (player.global_position - self.global_position).normalized()
		#velocity = speed * direction
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
	print('reacz')
	var wait_time = randf_range(1, 4)
	await get_tree().create_timer(wait_time).timeout
	
	new_wander_pos()

	
func new_wander_pos():
	var pos = home_position + random_offset() * randf_range(0, 200)
	print('POZYCJA', pos)
	print('pozycja globalna', global_position)
	move_to_position(pos)
	
func move_to_position (to_position: Vector2, adjust_pos: bool = true):
	print(to_position)
	if not agent:
		agent = get_node("NavigationAgent2D")
	
	#if adjust_pos:
		#var map = get_world_2d().navigation_map
		#NavigationSer
		#var adjusted_pos = NavigationServer2D.map_get_closest_point(map, to_position)
		#print('ADJK', adjusted_pos)
		#agent.target_position = adjusted_pos
	#else:
	agent.target_position = to_position
		
func random_offset () -> Vector2:
	var offset = Vector2(randf_range(-1, 1),randf_range(-1, 1))
	return offset.normalized()
