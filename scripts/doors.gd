extends Node2D

@onready var label: Label = %Label

var name_doors : String
var player_in_area = false


func update_doors_label(name):
	name_doors = 'TEST' + name
	

func _input(event):
	if Input.is_action_just_pressed("player_action") && player_in_area:
		GlobalManager.load_level("Level2")
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		player_in_area = true
		%Label.text = name_doors
		%Label.show()


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player:
		player_in_area = false
		%Label.hide()
