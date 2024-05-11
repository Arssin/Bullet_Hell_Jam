extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	animated_sprite_2d.play("portal_resp")



func _on_animated_sprite_2d_animation_finished() -> void:
	animated_sprite_2d.play("portal_standing")

func _respawn_mob():
	pass
