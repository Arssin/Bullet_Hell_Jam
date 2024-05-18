extends Node2D

var taken = false

func ready():
	taken = false
	$Sprite2D.visible = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	$AnimationPlayer.play("fly")
	taken = true
