# GameContext
extends Node

signal setup_completed()


var players = []
var current_player_index = 0
var turn_engine = null
var ready : bool = false
var limit_turns : bool = true
var max_turns : int = 5


func create_new_game():
	create_players()


func setup(turn_engine):
	self.turn_engine = turn_engine
	create_players()
	emit_signal("setup_completed")


func create_players():
	for i in Globals.MAX_PLAYERS:
		var player = Player.new()
		player.setup("Player-%d" % i, Globals.PLAYER_TYPE.HUMAN)
		players.append(player)


func init_player(index:int, player_name:String, player_type:int):
	players[index].setup(player_name, players[index].player_type)


func get_current_player():
	if players != null and players.size() > 0 and players.size() < current_player_index:
		return players[current_player_index]
	else:
		return null


func select_next_player():
	if get_current_player().has_turn_ended():
		current_player_index += 1
		if not _valid_player():
			current_player_index = 0


func _valid_player() -> bool:
	return current_player_index >= 0 and current_player_index < players.size()
