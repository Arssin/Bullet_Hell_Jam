extends Node2D

var dead = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_bfig_timeout() -> void:
	attack_spawn()
	
	
var new_pattern: PatternLine = PatternLine.new()
var pattern_area: PatternCustomArea = PatternCustomArea.new()
	
func attack_spawn():
	if !dead:
		new_pattern.offset = Vector2i(0,0)
		new_pattern.bullet = "14"
		new_pattern.nbr = 10
		new_pattern.forced_pattern_lookat = true
		Spawning.new_pattern("black_knight", new_pattern)
			
			
		Spawning.spawn({"position": $BlackFighter.global_position, "rotation": 90}, "black_knight", "two")
		Spawning.spawn({"position": $BlackFighter.global_position, "rotation": 1.2}, "black_knight", "two")
		Spawning.spawn({"position": $BlackFighter.global_position, "rotation": 1.6}, "black_knight", "two")
		Spawning.spawn({"position": $BlackFighter.global_position, "rotation": 2.3}, "black_knight", "two")
		Spawning.spawn({"position": $BlackFighter.global_position, "rotation": 0.5}, "black_knight", "two")
		Spawning.spawn({"position": $BlackFighter.global_position, "rotation": 0.9}, "black_knight", "two")
	

func attack_spawn_two():
	pass

func _on_bfig_2_timeout() -> void:
	attack_spawn_two()
	


func _on_black_fighter_black_knight_die() -> void:
	$Mobs/BFIG2.stop()
	$Mobs/BFIG.stop()
	dead = true
	$Barrier.queue_free()



func _on_black_fighter_2_black_knight_die() -> void:
	$BF22.queue_free()
	Spawning.reset_bullets()
