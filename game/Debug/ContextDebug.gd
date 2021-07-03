extends CanvasLayer


var labels = {}


onready var label_container = $Control/HBoxContainer/VBoxContainer


func _ready():
	add_info("te_turn", "Turn: %d", 0)
	add_info("te_state", "TurnEngine state: %s", "n/a")
	add_info("current_player", "Player: %s", "n/a")
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
	if GameContext.turn_engine != null:
		update_info("te_turn", GameContext.turn_engine.turn)
		update_info("te_state", GameContext.turn_engine.state_machine.get_current_state_name())
	else:
		update_info("te_turn", -1)
		update_info("te_state", "<null>")
		
	if GameContext.get_current_player() != null:
		update_info("current_player", GameContext.get_current_player().as_text())
	else:
		update_info("current_player", "n/a")
