extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var mob_scene: PackedScene = preload("res://scenes/small_runing_mob.tscn")
var pool_size: int = 10
var mob_pool: Array = []
@onready var timer: Timer = get_node("Timer")

func _ready() -> void:
	timer.wait_time = randi_range(1,3)
	animated_sprite_2d.play("portal_resp")
	for i in range(pool_size):
		var mobTemp: Node = mob_scene.instantiate()
		mobTemp.hide()
		mob_pool.append(mobTemp)
		add_child(mobTemp)



func _on_animated_sprite_2d_animation_finished() -> void:
	animated_sprite_2d.play("portal_standing")
	
func get_mob()-> Node:
	for mob in mob_pool:
		if not mob.visible:
			return mob
			
	var new_mob: Node = mob_scene.instantiate()
	new_mob.hide()
	mob_pool.append(new_mob)
	add_child(new_mob)
	return new_mob
	
func reset_mob(mob:Node) -> void:
	mob.position = self.position
	mob.get_node("CollisionShape2D").disabled = false
	mob.isAlive = false
	mob.hide()

func _respawn_mob():
	pass


func _on_timer_timeout() -> void:
	var mobTemp: Node = get_mob()
	mobTemp.global_position = self.global_position
	mobTemp.show()
