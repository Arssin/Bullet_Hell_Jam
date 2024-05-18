extends CharacterBody2D

@export var move_on_path: PathFollow2D
@export var movement_speed = 10
@export var isDestructable:bool = false

var previous_global_position = Vector2.ZERO

@onready var player = get_node('../../Player')
@onready var attack: Timer = $Attack

@onready var static_lvl = get_parent().name == "Enemies4"
@export var max_health = 30
@export var val_health = 30

func _ready() -> void:
	Spawning.create_pool("4","two", 150)
	Spawning.create_pool("5","two", 150)
	if isDestructable:
		$HealthBar.show()
		$HealthBar.max_healthbar = max_health
		$HealthBar.value = val_health
		attack.wait_time = randf_range(4,9)
		$Attack.start()
	else:
		attack.wait_time = randf_range(0.7,1.5)
	$Attack.start()
	$AnimatedSprite2D.play("cristal")
	previous_global_position = global_position

func _physics_process(delta: float) -> void:
	if !static_lvl:
		move_on_path.progress += movement_speed
		position = move_on_path.position
		var current_global_position = global_position
		previous_global_position = current_global_position
		$PlayerMarker.look_at(get_node('../ShootMarker').global_position)
		
var new_pattern: PatternLine = PatternLine.new()

func attack_spawn():
	if player && !static_lvl:
		new_pattern.offset = Vector2i(0,0)
		new_pattern.bullet = "4"
		new_pattern.nbr = 1
		new_pattern.forced_lookat_mouse = false
		new_pattern.forced_pattern_lookat = true
		Spawning.new_pattern("cristal", new_pattern)
	
		Spawning.spawn({"position": global_position, "rotation": $PlayerMarker.rotation}, "cristal", "two")		
	
	if player && static_lvl:
		new_pattern.offset = Vector2i(0,0)
		new_pattern.bullet = "5"
		new_pattern.nbr = 1
		new_pattern.forced_lookat_mouse = false
		new_pattern.forced_pattern_lookat = false
		Spawning.new_pattern("cristal_2", new_pattern)

		Spawning.spawn({"position": global_position, "rotation": 0}, "cristal_2", "two")


func _on_attack_timeout() -> void:
	attack_spawn()
	
	
func get_hit(value,props):
	if isDestructable:
		var propsId = props["__ID__"]
		var additional = 0
		if int(propsId) == 112 or int(propsId) == 111:
			additional += 0
		if int(propsId) == 2:
			additional += PlayerGlobals.additional_dmg
		val_health = val_health - (value + additional)
		$HealthBar.update_healthbar(val_health)
		if val_health <= 0:
			die()

	else:
		pass
		
		
func die():
	$Shoot.queue_free()
	queue_free()
	
	
		
	
