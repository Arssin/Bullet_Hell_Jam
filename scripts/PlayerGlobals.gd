extends Node2D

var player_max_health = 200
var player_attack_speed = 200
var player_range_time = 1
var player_move_speeds = 100
var additional_dmgs = 10
var additional_time = 0

var player2ndShoot = false
var player3rdShoot = false

var player_alive = true


@export var player_health = player_max_health:
	get:
		return player_health
	set(value):
		emit_signal("player_get_dmg", value)
		player_health = value
		
		if player_health <= 0:
			player_alive = false
			emit_signal("player_dead")

@export var additional_dmg = additional_dmgs:
	get:
		return additional_dmg
	set(value):
		if value <= 0:
			additional_dmg = 0
		else:
			additional_dmg = value
			
@export var player_move_speed = player_move_speeds:
	get:
		return player_move_speed
	set(value):
		if value <= 60:
			player_move_speed = 60
		else:
			player_move_speed = value

signal player_get_dmg(value)
signal player_dead
