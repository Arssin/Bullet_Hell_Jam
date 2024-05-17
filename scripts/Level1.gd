extends Node2D

@onready var totem: Enemy = $Totem
@onready var label_test: Label = $LabelTest
@onready var doors: Node = $Doors

func _ready():
	pass
	
func _process(delta: float) -> void:
	if doors.visible:
		var doorsChildren = $Doors.get_children()
		for door in doorsChildren:
			door.colide_on()
	
func _on_totem_boss_died() -> void:
	var doorsChildren = $Doors.get_children()
	 
	for door in doorsChildren:
		door.colide_on()
	$Node.queue_free()
	label_test.show()
	show_doors()

func show_doors():
	$Doors.show()
