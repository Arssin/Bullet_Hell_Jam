extends Node2D

@onready var totem: Enemy = $Totem
@onready var label_test: Label = $LabelTest

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _on_totem_boss_died() -> void:
	label_test.show()
	show_doors()

func show_doors():
	pass
