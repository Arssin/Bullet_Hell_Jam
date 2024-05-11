extends CharacterBody2D
class_name Enemy

@export var max_health = 100
@export var health = max_health
@onready var boss_bar: TextureProgressBar = $CanvasLayer/BossBar
@onready var health_bar: TextureProgressBar = $CanvasLayer/HealthBar

func _ready() -> void:
	health_bar.max_value = max_health
	health_bar.value = health

func die():
	queue_free()
		
func get_hit(value):
	print(value)
	health = health - value
	if health <= 0:
		die()
	else:
		health_bar.update_healthbar(health)
	
