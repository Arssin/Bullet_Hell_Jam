extends Node2D

var time: float = 1000000.00
var minutes: int = 0
var seconds: int = 0

var time_still_count = true
var showed_all = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var enemy = $Enemies4
	
	if time_still_count && time >= 0:
		print('halpo')
		time -= delta
		seconds = fmod(time,60)
		minutes = fmod(time,3600) / 60
		var formatedSec = "%02d" % seconds
		%TimerLvl4.text = "TIME " + str(minutes) + ":" + formatedSec
		time_still_count = false
	elif !showed_all && !time_still_count:
		$Doors.show()
		%TimerLvl4.text = "LVL END!"
		showed_all = true
		
	if showed_all && enemy:
		enemy.queue_free()

