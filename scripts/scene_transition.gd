extends CanvasLayer


func change_scene_to_file() -> void:
	$".".visible = true
	$AnimationPlayer.play("dissolve")
	await $AnimationPlayer.animation_finished
	$AnimationPlayer.play("dissolve",-1,-1.0,true)
	$".".visible = false
	emit_signal("transition_finished")

signal transition_finished
