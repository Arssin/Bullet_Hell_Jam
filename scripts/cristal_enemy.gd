extends CharacterBody2D

@export var move_on_path: PathFollow2D
@export var movement_speed = 10

var previous_global_position = Vector2.ZERO

@onready var player = get_node('../../Player')
@onready var attack: Timer = $Attack

@onready var static_lvl = get_parent().name == "Enemies4"

func _ready() -> void:
	print(static_lvl, get_parent())
	attack.wait_time = randf_range(0.7,1.5)
	$AnimatedSprite2D.play("cristal")
	previous_global_position = global_position

func _physics_process(delta: float) -> void:
	if !static_lvl:
		move_on_path.progress += movement_speed
		position = move_on_path.position
		var current_global_position = global_position
		previous_global_position = current_global_position
		
var new_pattern: PatternLine = PatternLine.new()

func attack_spawn():
	if player && !static_lvl:
		$PlayerMarker.global_position = player.global_position
		Spawning.spawn({"position": global_position, "rotation": 0}, "cristal", "two")
		
	
	
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
