extends Node2D

@onready var totem: Enemy = $Totem
@onready var label_test: Label = $LabelTest
@onready var doors: Node = $Doors


func _on_totem_boss_died() -> void:
	$Node.queue_free()
	label_test.show()
	show_doors()

func show_doors():
	var doorsChildren = doors.get_children()
	$Doors.show()
