extends Node


var players = []
var turn = 0

func create_new_game():
	create_players()


func create_players():
	for i in 10:
		players.append("Player %d" % i)


func get_statistics():
	return {
		"turn": turn,
		"players": {
			
		},
	}
