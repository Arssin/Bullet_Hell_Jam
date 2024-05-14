extends CharacterBody2D

var max_health = 100
var health = 100

func _ready():
	$HealthBar.max_value = max_health
	$HealthBar.value = health
	

func get_hit(value):
	health = health - (value + PlayerGlobals.additional_dmg)
	$HealthBar.update_healthbar(health)
	if health <= 0:
		die()
		
		
func die():
	emit_signal('totem_died')
	queue_free()
	
signal totem_died
