extends Node


signal turn_completed()
signal next_player()


var players = []
var current_player_index = 0
var turn = 0


func create_new_game():
	create_players()


func create_players():
	for i in 8:
		var player = Player.new()
		player.player_name = "PLAYER_NAME_%d" % i
		players.append(player)


func get_current_player():
	return players[current_player_index]


func select_next_player():
	current_player_index += 1
	
	if not _valid_player():
		emit_signal("turn_completed")
		current_player_index = 0
		turn += 1
	
	emit_signal("next_player")


func _valid_player() -> bool:
	return current_player_index >= 0 and current_player_index < players.size()
