extends CanvasLayer


var labels = {}


onready var label_container = $Control/HBoxContainer/VBoxContainer
onready var cities_label = $Control/HBoxContainer/VBoxContainer/CitiesLabel


func _ready():
	add_info("turn", "Turn: %d", 0)
	add_info("current_player", "Player: %s - %s", ["-none-", "-1"])
	$Timer.start(0.1)


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
	update_info("turn", GameContext.turn)
	update_info("current_player", [GameContext.get_current_player().player_name, GameContext.current_player_index])
