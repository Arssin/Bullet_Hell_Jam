extends CharacterBody2D

@export var health = 50

func _physics_process(delta: float) -> void:
	pass

func die():
	if health <= 0:
		queue_free()
