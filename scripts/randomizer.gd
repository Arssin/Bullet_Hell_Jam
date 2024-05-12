extends Node

var positive_text: String
var negative_text: String

func bonusGenerator(number_good, number_bad):
	create_positive_bonus(number_good)
	create_negative_bonus(number_bad)
	

func create_positive_bonus(number):
	if number == 0:
		PlayerGlobals.additional_dmg = 40
		positive_text = "More DMG!"
	elif number == 1:
		PlayerGlobals.player_move_speed += 500
		positive_text = "MORE SPEED"
		
func create_negative_bonus(number):
	if number == 0:
		PlayerGlobals.additional_dmg -= 40
		negative_text = "LESS DMG"
	elif number == 1:
		PlayerGlobals.player_move_speed -= 150
		negative_text = "LESS SPEED"



