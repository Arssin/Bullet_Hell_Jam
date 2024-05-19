extends Node2D

@onready var totem: Enemy = $Totem
@onready var label_test: Label = $LabelTest
@onready var doors: Node = $Doors
var level_end = false
@onready var label: Label = $MarginContainer/Label


var doors_sound = load("res://music/doors_open.wav")

func _ready():
	pass
	
func _process(delta: float) -> void:
	if !level_end:
		if doors.visible:
			var doorsChildren = $Doors.get_children()
			for door in doorsChildren:
				door.doorsShape.disabled = false
			level_end = true
	
func _on_totem_boss_died() -> void:
	$GPUParticles2D.emitting = true
	var doorsChildren = $Doors.get_children()
	Spawning.reset_bullets()
	for door in doorsChildren:
		door.colide_on()
	$Node.queue_free()
	label_test.show()
	show_doors()

func show_doors():
	var sfx = get_node('../../SFX')
	sfx.stream = doors_sound
	sfx.play()
	$Doors.show()
	await get_tree().create_timer(2).timeout
	$GPUParticles2D.emitting = false
	



	
