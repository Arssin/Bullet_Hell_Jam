extends CharacterBody2D

var max_health = 100
var health = 100

func _ready():
	$HealthBar.max_value = max_health
	$HealthBar.value = health
	$AnimatedSprite2D.play("static")
	

func get_hit(value,props):
	var propsId = props["__ID__"]
	var additional = 0
	if int(propsId) == 112 or int(propsId) == 111:
		additional += 0
	if int(propsId) == 2:
		additional += PlayerGlobals.additional_dmg
	health = health - (value + additional)
	$AnimatedSprite2D.play("get_hit")
	$HealthBar.update_healthbar(health)
	if health <= 0:
		die()
		
		
func die():
	emit_signal('totem_died')
	queue_free()
	
signal totem_died


func _on_animated_sprite_2d_animation_finished() -> void:
	var anim = $AnimatedSprite2D.get_animation()
	if anim == "get_hit":
		$AnimatedSprite2D.play("static")
