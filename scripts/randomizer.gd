extends Node

#DODAJ ULECZ SIĘ -> ALE!

func bonusGenerator(number_good, number_bad):
	create_positive_bonus(number_good)
	create_negative_bonus(number_bad)
	
	
func create_positive_text(number):
	if number == 0 && PlayerGlobals.additional_dmg == PlayerGlobals.max_dmg_add:
		number + 1
	elif number == 1 && PlayerGlobals.player_move_speed == PlayerGlobals.max_speed:
		number + 1
	elif PlayerGlobals.player3rdShoot:
		number - 1
	
	var positive_text: String
	if number == 0:
		positive_text = "DEAL MORE DMG"
	elif number == 1:
		positive_text = "MORE SPEED"
	elif number == 2: 
		positive_text = "BULLET + 1"
	else:
		positive_text = 'AYAY NO BOOST'
	return positive_text


func create_negative_text(number):
	if number == 0 && PlayerGlobals.additional_dmg <= 0:
		number + 1
	elif number == 1 && PlayerGlobals.player_move_speed <= 60:
		number + 1
	elif !PlayerGlobals.player2ndShoot:
		number - 1
	var negative_text: String
	if number == 0:
		negative_text = "LESS DMG"
	elif number == 1:
		negative_text = "LESS SPEED"
	elif number == 2:
		negative_text = "BULLET - 1"
	else:
		negative_text = 'AYAY NO BOOST'
	return negative_text
		

func create_positive_bonus(number):
	if number == 0 && PlayerGlobals.additional_dmg >= PlayerGlobals.max_dmg_add:
		number + 1
	elif number == 1 && PlayerGlobals.player_move_speed >= PlayerGlobals.max_speed:
		number + 1
	elif PlayerGlobals.player3rdShoot:
		number - 1
	
	if number == 0:
		PlayerGlobals.additional_dmg += 5
	elif number == 1:
		PlayerGlobals.player_move_speed += 20
	elif number == 2: 
		if !PlayerGlobals.player2ndShoot:
			PlayerGlobals.player2ndShoot = true
		elif PlayerGlobals.player2ndShoot && !PlayerGlobals.player3rdShoot:
			PlayerGlobals.player3rdShoot = true
		else: pass
	else: pass
		
func create_negative_bonus(number):
	if number == 0 && PlayerGlobals.additional_dmg >= PlayerGlobals.max_dmg_add:
		number + 1
	elif number == 1 && PlayerGlobals.player_move_speed >= PlayerGlobals.max_speed:
		number + 1
	elif !PlayerGlobals.player2ndShoot:
		number - 1
	if number == 0:
		PlayerGlobals.additional_dmg -= 5
	elif number == 1:
		PlayerGlobals.player_move_speed -= 20
	elif number == 2:
		if PlayerGlobals.player3rdShoot:
			PlayerGlobals.player3rdShoot = false
		elif !PlayerGlobals.player3rdShoot && PlayerGlobals.player2ndShoot:
			PlayerGlobals.player2ndShoot = false
		else: pass
	else: pass
		



