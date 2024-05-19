extends Node2D

const DOORS_OPEN = preload("res://music/doors_open.wav")

var dead = false
var coins_taken = false
var coin_took = false
var coin2_took = false
var coin3_took = false

var coin
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
		new_pattern.nbr = 1
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
	$Barrier2.queue_free()
	$GPUParticles2D.emitting = true
	await get_tree().create_timer(2).timeout
	$GPUParticles2D.emitting = false


func _on_black_fighter_2_black_knight_die() -> void:
	$BF22.queue_free()
	Spawning.reset_bullets()
	$GPUParticles2D2.emitting = true
	await get_tree().create_timer(2).timeout
	$GPUParticles2D2.emitting = false


func _on_coin_coin_took() -> void:
	coin_took = true
	if coin3_took && coin2_took && coin_took:
		open_doors()

func _on_coin_2_coin_took() -> void:
	coin2_took = true
	if coin3_took && coin2_took && coin_took:
		open_doors()

func _on_coin_3_coin_took() -> void:
	coin3_took = true
	if coin3_took && coin2_took && coin_took:
		open_doors()
		
func open_doors():
	$Doors.visible = true
	var sound = get_node('/root/MainScene/SFX')
	sound.stream = DOORS_OPEN
	sound.play()
	var doorsChildren = $Doors.get_children()
	for door in doorsChildren:
		door.colide_on()
