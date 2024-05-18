extends Node2D

const PICKUP_COIN = preload("res://music/pickupCoin.wav")

var taken = false


func ready():
	taken = false
	$Sprite2D.visible = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	if !taken:
		var sound_effect = get_node('/root/MainScene/SFX')
		sound_effect.stream = PICKUP_COIN
		sound_effect.play()
		print(sound_effect)
		$AnimationPlayer.play("fly")
		taken = true
		
	
