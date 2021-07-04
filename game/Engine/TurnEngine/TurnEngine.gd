extends Node
class_name TurnEngine


var current_player_index : int = -1
var turn : int = 0


onready var state_machine : StateMachine = $StateMachine


func _ready():
	state_machine.start()
	GameContext.connect("setup_completed", self, "_on_setup_completed")


func end_turn():
	state_machine.start_by_name("End")


func next_turn():
	if state_machine.get_current_state_name() != "End":
		state_machine.start_by_name("StartTurn")


func _on_StateMachine_state_changed(old_state, new_state):
	print("Turn Engine %s > %s" % [old_state, new_state])


func _on_setup_completed():
	state_machine.start_by_name("Init")
