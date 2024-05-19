extends Control

@onready var hud: Control = %HUD
@onready var menu: Control = %Menu
@onready var main: Node2D = %Main
@onready var music: AudioStreamPlayer2D = $MUSIC
var menu_song = load("res://music/menusong.wav")
var game_song = load("res://music/BulletHellMainSong.wav")

@onready var time_label: Label = %TimeLabel
@onready var time: Panel = %Time

var timee: float = 0.0
var minutes: int = 0
var seconds: int = 0

@onready var dead: Control = $CanvasLayer/DEAD
@onready var won: Control = $CanvasLayer/WON
@onready var pause: Control = $CanvasLayer/PAUSE



@onready var MUSIC_OFF = preload("res://assets/music off.png")
@onready var MUSIC_ON = preload("res://assets/music on.png")

var isMusicOn = true
var sfxIsOn = true

func _ready():
	music.stream = menu_song
	music.play()
	
	if isMusicOn:
		%ms.icon = MUSIC_ON
	else:
		%ms.icon = MUSIC_OFF
		
	if sfxIsOn:
		%sfx2.icon = MUSIC_ON
	else:
		%sfx2.icon = MUSIC_OFF


func _process(delta: float) -> void:
	
	if !%Menu.visible:
		%Time.visible = true
	else:
		%Time.visible = false
		
	if %Time.visible:
		timee += delta
		seconds = fmod(timee,60)
		minutes = fmod(timee,3600) / 60
		var formatedSec = "%02d" % seconds
		%TimeLabel.text = "TIME " + str(minutes) + ":" + formatedSec
		$CanvasLayer/WON/Panel/VBoxContainer/Label.text = "YOU WON WITH A TIME:" + " " + str(minutes) + ":" + formatedSec


func _on_start_game_pressed() -> void:
	GlobalManager.new_game()
	music.stream = game_song
	music.play()
	%Menu.hide()
	%Time.visible = true


func _on_restart_pressed() -> void:
	GlobalManager.restart_game()


func _on_controls_and_options_pressed() -> void:
	$Control.show()


func _on_button_pressed() -> void:
	$Control.hide()


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_button_x_pressed() -> void:
	%Credentials.hide()


func _on_credentials_pressed() -> void:
	%Credentials.show()


func _on_ms_pressed() -> void:
	if isMusicOn:
		isMusicOn = false
		%ms.icon = MUSIC_OFF
		AudioServer.set_bus_mute(AudioServer.get_bus_index("MUSIC"), true)
	else: 
		isMusicOn = true
		%ms.icon = MUSIC_ON
		AudioServer.set_bus_mute(AudioServer.get_bus_index("MUSIC"), false)


func _on_sfx_2_pressed() -> void:
	if sfxIsOn:
		sfxIsOn = false
		%sfx2.icon = MUSIC_OFF
		AudioServer.set_bus_mute(AudioServer.get_bus_index("SFX_PLAYER"), true)
		AudioServer.set_bus_mute(AudioServer.get_bus_index("SFX_ENEMY"), true)
		AudioServer.set_bus_mute(AudioServer.get_bus_index("SFX"), true)
	else: 
		sfxIsOn = true
		%sfx2.icon = MUSIC_ON
		AudioServer.set_bus_mute(AudioServer.get_bus_index("SFX_PLAYER"), false)
		AudioServer.set_bus_mute(AudioServer.get_bus_index("SFX_ENEMY"), false)
		AudioServer.set_bus_mute(AudioServer.get_bus_index("SFX"), false)


func _on_button_w_pressed() -> void:
	GlobalManager.restart_game()


func _on_return_pressed() -> void:
	$CanvasLayer/PAUSE.visible = false
	get_tree().paused = false


func _on_exitto_pressed() -> void:
	GlobalManager.restart_game()
