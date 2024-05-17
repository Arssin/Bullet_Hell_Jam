extends Control

@onready var hud: Control = %HUD
@onready var menu: Control = %Menu
@onready var main: Node2D = %Main
@onready var music: AudioStreamPlayer2D = $MUSIC
var menu_song = load("res://music/menusong.wav")
var game_song = load("res://music/BulletHellMainSong.wav")


func _ready():
	music.stream = menu_song
	music.play()


func _process(delta: float) -> void:
	$CanvasLayer/HUD/Label.text = str(PlayerGlobals.additional_dmg) + " "  + str(PlayerGlobals.player_move_speed)


func _on_start_game_pressed() -> void:
	GlobalManager.new_game()
	music.stream = game_song
	music.play()
	%Menu.hide()
