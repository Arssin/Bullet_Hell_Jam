extends Node


#DODAJ ULECZ SIĘ -> ALE!

func bonusGenerator(number_good, number_bad):
	create_positive_bonus(number_good)
	create_negative_bonus(number_bad)
	
	
func create_positive_text(number):
	var positive_text: String
	if number == 0:
		positive_text = "DEAL MORE DMG"
	elif number == 1:
		positive_text = "MORE SPEED"
	elif number == 2: 
		positive_text = "BULLET + 1"
	return positive_text


func create_negative_text(number):
	var negative_text: String
	if number == 0:
		negative_text = "LESS DMG"
	elif number == 1:
		negative_text = "LESS SPEED"
	elif number == 2:
		negative_text = "BULLET - 1"
	return negative_text
		

func create_positive_bonus(number):
	if number == 0:
		PlayerGlobals.additional_dmg += 5
	elif number == 1:
		PlayerGlobals.player_move_speed += 50
	elif number == 2: 
		if !PlayerGlobals.player2ndShoot:
			PlayerGlobals.player2ndShoot = true
		elif PlayerGlobals.player2ndShoot && !PlayerGlobals.player3rdShoot:
			PlayerGlobals.player3rdShoot = true
		else: pass
		
func create_negative_bonus(number):
	if number == 0:
		PlayerGlobals.additional_dmg -= 5
	elif number == 1:
		PlayerGlobals.player_move_speed -= 50
	elif number == 2:
		if PlayerGlobals.player3rdShoot:
			PlayerGlobals.player3rdShoot = false
		elif !PlayerGlobals.player3rdShoot && PlayerGlobals.player2ndShoot:
			PlayerGlobals.player2ndShoot = false
		else: pass
		



