extends CanvasLayer


var labels = {}

onready var label_container = $Control/HBoxContainer/VBoxContainer
onready var cities_label = $Control/HBoxContainer/VBoxContainer/CitiesLabel

func _ready():
	add_info("turn", "Turn: %d", 0)
	$Timer.start(0.5)


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
	


func _on_Timer_timeout():
	update_info("turn", GameContext.get_statistics().turn)
