class_name Player


var player_name : String = "n/a"
var player_type = Globals.PLAYER_TYPE.HUMAN
var controller : PlayerController = null


func _ready():
	pass # Replace with function body.


func setup(player_name, player_type):
	self.player_name = player_name
	self.player_type = player_type


func as_text():
	return "%s, %s" % [ player_name, Translator.get_player_type(player_type) ]


func end_turn():
	pass


func has_turn_ended() -> bool:
	return false
