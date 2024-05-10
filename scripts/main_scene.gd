extends Control

@onready var hud: Control = %HUD
@onready var menu: Control = %Menu
@onready var main: Node2D = %Main




func _on_start_game_pressed() -> void:
	GlobalManager.new_game()
	%Menu.hide()
