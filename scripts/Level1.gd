extends Node2D

@onready var totem: Enemy = $Totem
@onready var label_test: Label = $LabelTest
@onready var doors: Node = $Doors

func _ready():
	pass
	
func _on_totem_boss_died() -> void:
	$Node.queue_free()
	label_test.show()
	show_doors()

func show_doors():
	var doorsChildren = $Doors.get_children()
	
	for door in doorsChildren:
		print(door.is_colliding)
		door.colide_on()
		print(door.is_colliding)
	
	print($Doors/Doors.is_colliding)
	$Doors.show()
