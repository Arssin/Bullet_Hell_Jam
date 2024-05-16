extends CharacterBody2D

@export var detonation_dmg = 10
var player: Player
var chase = true

func _physics_process(delta: float) -> void:
	if chase && player:
		velocity = (player.global_position - position) * 10


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
