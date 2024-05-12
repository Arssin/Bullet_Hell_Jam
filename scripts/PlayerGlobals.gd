extends Node2D

var player_max_health = 200
var player_attack_speed = 200
var player_range_time = 1
var player_move_speed = 200
var additional_dmg = 40

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


signal player_get_dmg(value)
signal player_dead
