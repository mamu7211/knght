extends Node
class_name Player


var player_name : String = "n/a"
var player_type = Globals.PLAYER_TYPE.HUMAN


onready var state_machine : StateMachine = $StateMachine


func _ready():
	state_machine.start()


func setup(player_name, player_type):
	self.player_name = player_name
	self.player_type = player_type


func start_turn():
	state_machine.start_by_name("StartTurn")


func as_text():
	return "%s [%s]" % [ player_name, Translator.get_player_type(player_type) ]


func _on_StateMachine_state_changed(old_state, new_state):
	print("Player %s : '%s' > '%s'" % [as_text(), old_state, new_state])
