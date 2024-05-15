extends CharacterBody2D
@export var max_health = 100
@export var hp = 100
@export var emite_signal = false

func _ready():
	$HealthBar.max_value = max_health
	$HealthBar.value = hp

func get_hit(value):
	hp = hp - (value + PlayerGlobals.additional_dmg)
	$HealthBar.update_healthbar(hp)
	if hp <= 0:
		die()
		
		
func die():
	if emite_signal:
		emit_signal('black_knight_die')
	queue_free()
	
signal black_knight_die
