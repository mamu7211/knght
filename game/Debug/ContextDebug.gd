extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var cities_label = $Control/HBoxContainer/VBoxContainer/CitiesLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	var context = GameContext.get_statistics()
	cities_label.text = "Cities: %d" % context.cities.count
