extends Node2D

@onready var label: Label = %Label

var rng = RandomNumberGenerator.new()

var name_doors : String
var player_in_area = false

var my_random_number_positive: int
var my_random_number_negative: int

func _ready() -> void:
	my_random_number_positive = rng.randi_range(0, 1)
	my_random_number_negative = rng.randi_range(0, 1)
	if my_random_number_positive == my_random_number_negative:
		if my_random_number_negative <= 0:
			my_random_number_negative += 1
		else:
			my_random_number_negative -= 1
	var positve_text = Randomizer.create_positive_text(my_random_number_positive)
	var negative_text = Randomizer.create_negative_text(my_random_number_negative)
	%Label.text = positve_text + " " + "BUT" + " " + negative_text

	

func _input(event):
	if Input.is_action_just_pressed("player_action") && player_in_area:
		Randomizer.create_positive_bonus(my_random_number_positive)
		Randomizer.create_negative_bonus(my_random_number_negative)
		var lvlName = get_parent().get_parent().name
		var lastChar = int(lvlName.substr(5, 1))
		
		GlobalManager.load_level("Level" + str(lastChar + 1))
	#


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		player_in_area = true
		%Label.show()


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player:
		player_in_area = false
		%Label.hide()
		
func colide_on():
	$StaticBody2D/CollisionShape2D.disabled = false
