extends CanvasLayer


var labels = {}

onready var label_container = $Control/HBoxContainer/VBoxContainer
onready var cities_label = $Control/HBoxContainer/VBoxContainer/CitiesLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	add_info("turn", "Turn: %d", 0)
	add_info("turn1", "Turn: %s", "n/a")
	add_info("turn2", "Turn: %s", null)


func _process(delta):
	update_info("turn",0)


func update_info(key, value):
	labels[key].label.text = labels[key].label_text % value


func add_info(key, label_text, default_value):
	var label = Label.new();
	label.text = label_text % default_value;
	label_container.add_child(label);
	labels[key] = {
		"default_value" : default_value,
		"label_text" : label_text,
		"label" : label
		}
	
