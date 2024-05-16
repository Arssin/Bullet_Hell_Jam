extends CharacterBody2D

@export var detonation_dmg = 10
var player: Player
var chase = true
var stop = false

func _physics_process(delta: float) -> void:
	if player:
		var distance_player = global_position.distance_to(player.global_position)
		if chase && player && !stop:
			print(distance_player)
			velocity = (player.global_position - position).normalized() * 10
		elif stop:
			velocity = Vector2.ZERO
			
		if distance_player <= 12:
			stop = true
		else:
			stop = false
	
	move_and_slide()


func _on_chase_area_body_entered(body: Node2D) -> void:
	if body is Player:
		player = body
		chase = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_chase_area_body_exited(body: Node2D) -> void:
	if body is Player:
		player = null
		chase = false
