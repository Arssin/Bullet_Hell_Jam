extends TextureProgressBar

@export var max_healthbar: float
@export var value_healthbar: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.max_value = max_healthbar
	self.value = value_healthbar

func update_healthbar(newValue):
	self.value = newValue
