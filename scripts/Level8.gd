extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_bfig_timeout() -> void:
	attack_spawn()
	
	
var new_pattern: PatternLine = PatternLine.new()
var pattern_area: PatternCircle = PatternCircle.new()
	
func attack_spawn():
	new_pattern.offset = Vector2i(0,0)
	new_pattern.bullet = "14"
	new_pattern.nbr = 10
	new_pattern.forced_pattern_lookat = true
	Spawning.new_pattern("black_knight", new_pattern)
		
		
	Spawning.spawn({"position": $Mobs/BlackFighter.global_position, "rotation": 90}, "black_knight", "two")
	Spawning.spawn({"position": $Mobs/BlackFighter.global_position, "rotation": 1.2}, "black_knight", "two")
	Spawning.spawn({"position": $Mobs/BlackFighter.global_position, "rotation": 1.6}, "black_knight", "two")
	Spawning.spawn({"position": $Mobs/BlackFighter.global_position, "rotation": 2.3}, "black_knight", "two")
	Spawning.spawn({"position": $Mobs/BlackFighter.global_position, "rotation": 0.5}, "black_knight", "two")
	Spawning.spawn({"position": $Mobs/BlackFighter.global_position, "rotation": 0.9}, "black_knight", "two")
	

func attack_spawn_two():
		
		
	Spawning.spawn({"position": $Mobs/BlackFighter.global_position, "rotation": 0}, "b_k", "two")


func _on_bfig_2_timeout() -> void:
	attack_spawn_two()
	
