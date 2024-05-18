extends CharacterBody2D
@export var max_health = 100
@export var hp = 100
@export var emite_signal = false

const ENEMY_DEAD = preload("res://music/enemy_dead.wav")
const GET_HIT_ENEMY = preload("res://music/get_hit_enemy.wav")

func _ready():
	$HealthBar.max_value = max_health
	$HealthBar.value = hp
	$AnimatedSprite2D.play("Idle")

func get_hit(value,props):
	var propsId = props["__ID__"]
	var additional = 0
	if int(propsId) == 112 or int(propsId) == 111:
		additional += 0
	if int(propsId) == 2:
		additional += PlayerGlobals.additional_dmg
	hp = hp - (value + additional)
	$HealthBar.update_healthbar(hp)
	$AnimatedSprite2D.play("get_hit")
	var sound = get_node('../../../SFX_ENEMY')
	sound.stream = GET_HIT_ENEMY
	sound.play()
	if hp <= 0:
		die()
		
		
func die():
	if emite_signal:
		var sound = get_node('../../../SFX_ENEMY')
		sound.stream = ENEMY_DEAD
		sound.play()
		emit_signal('black_knight_die')
	queue_free()
	
signal black_knight_die


func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation == "get_hit":
		$AnimatedSprite2D.play("Idle")
	



