extends Node2D



func _on_final_boss_finalboss_died() -> void:
	$Pattern1.queue_free()
	$Pattern2.queue_free()
	$Pattern3.queue_free()
	$Pattern4.queue_free()
	$Pattern5.queue_free()
	$Pattern6.queue_free()
	$Pattern7.queue_free()
	$Pattern8.queue_free()
	$Pattern9.queue_free()
	$Pattern10.queue_free()
	$Pattern11.queue_free()
	Spawning.reset_bullets()
	$GPUParticles2D.emitting = true
	await get_tree().create_timer(2).timeout
	$GPUParticles2D.emitting = false
	var won = get_node("/root/MainScene/CanvasLayer/WON")
	won.visible = true
	get_tree().paused = true
	
	
	
