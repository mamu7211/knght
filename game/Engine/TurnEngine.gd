extends Node
class_name TurnEngine


var current_player_index : int = -1


func _ready():
	pass # Replace with function body.


func _process(delta):
	pass


func current_player_done():
	GameContext.select_next_player()

