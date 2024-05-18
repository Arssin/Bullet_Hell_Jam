extends CharacterBody2D

@export var max_health = 300
@export var health = 300
@onready var health_bar: TextureProgressBar = $CanvasLayer/HealthBar
const GET_HIT_ENEMY = preload("res://music/get_hit_enemy.wav")
const ENEMY_DEAD = preload("res://music/enemy_dead.wav")

func _ready() -> void:
	health_bar.max_value = max_health
	health_bar.value = health


func die():
	queue_free()
		
func get_hit(value, props):
	var propsId = props["__ID__"]
	var additional = 0
	if int(propsId) == 112 or int(propsId) == 111:
		additional += 0
	if int(propsId) == 2:
		additional += PlayerGlobals.additional_dmg
	health = health - (value + additional)
	var sfx = get_node('/root/MainScene/SFX_ENEMY')
	print(sfx)
	sfx.stream = GET_HIT_ENEMY
	sfx.play() 
	#$anim.play("get_hit")
	if health <= 0:
		sfx.stream = ENEMY_DEAD
		sfx.play()
		emit_signal("finalboss_died")
		die()
	else:
		health_bar.update_healthbar(health)
		
signal finalboss_died
