extends Control

@onready var hud: Control = %HUD
@onready var menu: Control = %Menu
@onready var main: Node2D = %Main



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_game_pressed() -> void:
	GlobalManager.new_game()
