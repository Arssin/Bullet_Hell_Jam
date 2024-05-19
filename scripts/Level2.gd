extends Node2D


var completeLvl = false
@onready var bullet_pattern: Path2D = $BulletPattern

const MENUSONG = preload("res://music/doors_open.wav")

func _ready() -> void:
	
	if bullet_pattern:
		Spawning.create_pool("3", "small_mob", 100)

func check_portal():
	var mobs = $mobs
	
	if mobs.get_children().size() <= 0:
		completeLvl = true
		
	return completeLvl
	

func _on_timer_timeout() -> void:
	
	var lvl_comp = check_portal()
		
	if completeLvl:
		$Timer.stop()
		var sound = get_node('../../SFX')
		sound.stream = MENUSONG
		sound.play()
		$Label.show()
		show_doors()
		Spawning.reset_bullets()
		
func show_doors():
	var doorsChildren = %Doors.get_children()
	
	for door in doorsChildren:
		door.colide_on()
		
	$Doors.show()

