extends Node2D

var time: float = 10.00
var minutes: int = 0
var seconds: int = 0

var time_still_count = true
var showed_all = false



func _process(delta: float) -> void:
	var enemy = $Enemies4
	
	if time_still_count && time >= 0:
		time -= delta
		seconds = fmod(time,60)
		minutes = fmod(time,3600) / 60
		var formatedSec = "%02d" % seconds
		%TimerLvl4.text = "TIME " + str(minutes) + ":" + formatedSec
	elif time <= 0 && time_still_count:
		time_still_count = false
	elif !showed_all && !time_still_count:
		var doorsChildren = $Doors.get_children()
	
		for door in doorsChildren:
			door.colide_on()
			
		$Doors.show()
		%TimerLvl4.text = "LVL END!"
		showed_all = true
		
	if showed_all && enemy:
		enemy.queue_free()

