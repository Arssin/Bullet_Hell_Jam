extends Node


var positive_text: String
var negative_text: String
	
func create_positive_text(number):
	var positivo_number = number
	if positivo_number == 0 && PlayerGlobals.additional_dmg == PlayerGlobals.max_dmg_add:
		positivo_number =+ 1
	elif positivo_number == 1 && PlayerGlobals.player_move_speed == PlayerGlobals.max_speed:
		positivo_number =+ 1
	elif positivo_number == 2 && PlayerGlobals.player3rdShoot:
		positivo_number =+ 1
	else: positivo_number
	
	
	if positivo_number == 0:
		positive_text = "DEAL MORE DMG"
	elif positivo_number == 1:
		positive_text = "MORE SPEED"
	elif positivo_number == 2: 
		positive_text = "BULLET + 1"
	elif positivo_number == 3:
		positive_text = "HEAL A BIT"
	elif positivo_number == 4:
		positive_text = "NO BONUS FOR YOU!"
	else:
		positive_text = 'AYAY NO BOOST'
	return positive_text


func create_negative_text(number):
	var number_negativo = number
	if number_negativo == 0 && PlayerGlobals.additional_dmg <= 0:
		number_negativo += 1
	elif number_negativo == 1 && PlayerGlobals.player_move_speed <= 60:
		number_negativo += 1
	elif number_negativo == 2 && !PlayerGlobals.player2ndShoot:
		number_negativo += 1
	elif number_negativo == 3 && PlayerGlobals.invertet_inputs:
		number_negativo -= 1
	else: number_negativo
	
	var negative_text: String
	
	if number_negativo == 0:
		negative_text = "LESS DMG"
	elif number_negativo == 1:
		negative_text = "LESS SPEED"
	elif number_negativo == 2:
		negative_text = "BULLET - 1"
	elif number_negativo == 3:
		negative_text = "INVERTED INPUTS"
	elif number_negativo == 4:
		negative_text = "-1 HEALTH"
	else:
		negative_text = 'AYAY NO BOOST'
	return negative_text
		
		
func create_positive_bonus(text):
	if text == "DEAL MORE DMG":
		PlayerGlobals.additional_dmg += 5
	elif text == "MORE SPEED":
		PlayerGlobals.player_move_speed += 20
	elif text == "BULLET + 1":
		if PlayerGlobals.player2ndShoot:
			PlayerGlobals.player3rdShoot = true
		else:
			PlayerGlobals.player2ndShoot = true
	elif text == "HEAL A BIT":
		PlayerGlobals.player_health += 2
	elif text == "NO BONUS FOR YOU!":
		pass
	else: pass
	
	
func create_negative_bonus(neg_text):
	if neg_text == "LESS DMG":
		PlayerGlobals.additional_dmg -= 5
	elif neg_text == "LESS SPEED":
		PlayerGlobals.player_move_speed -= 20
	elif neg_text == "INVERTED INPUTS":
		PlayerGlobals.invertet_inputs = true
	elif neg_text == "BULLET - 1":
		if PlayerGlobals.player3rdShoot:
			PlayerGlobals.player3rdShoot = false
		else: PlayerGlobals.player2ndShoot = false
	elif neg_text == "-1 HEALTH":
		PlayerGlobals.player_health -= 1
	else: pass




