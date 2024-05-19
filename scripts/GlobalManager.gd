extends Node

const MENUSONG = preload("res://music/menusong.wav")
var level_instance

func unload_level():
	if (is_instance_valid(level_instance)):
		level_instance.queue_free()
	level_instance = null

func load_level(level_name: String):
	unload_level()
	var level_path := "res://scenes/%s.tscn" % level_name
	var level_resource := load(level_path)
	if (level_resource):
		var childrens = get_tree().root.get_children()
		Spawning.reset()
		for child in childrens:
			if child.name == "MainScene":
				var main = child.get_child(2)
				SceneTransition.change_scene_to_file()
				await SceneTransition.transition_finished
				level_instance = level_resource.instantiate()
				main.add_child(level_instance)
				
				
func new_game():
	GlobalManager.load_level("Level5")

func restart_game():
	Spawning.reset()
	var mainScene = get_node('/root/MainScene')
	mainScene.menu.visible = true
	mainScene.dead.visible = false
	mainScene.music.stream = MENUSONG
	mainScene.music.play()
	PlayerGlobals.reset_all()
	unload_level()
	get_tree().paused = false
	
