class_name PlayerController


var turn_ended = false


func start_turn():
	turn_ended = false


func end_turn():
	turn_ended = true


func has_turn_ended():
	return turn_ended

