extends Node


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
		for child in childrens:
			if child.name == "MainScene":
				var main = child.get_child(2)
				level_instance = level_resource.instantiate()
				main.add_child(level_instance)
				
				
func new_game():
	GlobalManager.load_level("Level1")
