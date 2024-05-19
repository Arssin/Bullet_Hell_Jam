extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_final_boss_finalboss_died() -> void:
	$Pattern1.queue_free()
	$Pattern2.queue_free()
	$Pattern3.queue_free()
	$Pattern4.queue_free()
	$Pattern5.queue_free()
	$Pattern6.queue_free()
	$Pattern7.queue_free()
	$Pattern8.queue_free()
	Spawning.reset_bullets()
	$GPUParticles2D.emitting = true
	await get_tree().create_timer(2).timeout
	$GPUParticles2D.emitting = false
	
