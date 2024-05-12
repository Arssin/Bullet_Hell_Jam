extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var mob_scene: PackedScene = preload("res://scenes/small_runing_mob.tscn")
var pool_size: int = 10
var mob_pool: Array = []
@onready var timer: Timer = get_node("Timer")
var portal_spawn_count = 0

func _ready() -> void:
	timer.wait_time = randf_range(0.3, 1)
	animated_sprite_2d.play("portal_resp")


func _on_animated_sprite_2d_animation_finished() -> void:
	animated_sprite_2d.play("portal_standing")
	

func _on_timer_timeout() -> void:
	if portal_spawn_count <= 10:
		portal_spawn_count += 1
		var new_mob: Node = mob_scene.instantiate()
		add_child(new_mob)

