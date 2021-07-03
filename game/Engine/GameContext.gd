# GameContext
extends Node


var player_scene = load("res://Data/Player.tscn")


signal setup_completed()


var players = []
var current_player_index = 0
var turn_engine = null
var ready : bool = false
var limit_turns : bool = true
var max_turns : int = 50000


func setup(turn_engine, data_root:Node):
	self.turn_engine = turn_engine
	for c in data_root.get_children():
		c.queue_free()
	create_players(data_root)
	emit_signal("setup_completed")


func create_players(data_root):
	var player_node = Node2D.new()
	player_node.name = "Players"
	data_root.add_child(player_node)
	for i in Globals.MAX_PLAYERS:
		var player = player_scene.instance()
		player.setup("Player-%d" % i, Globals.PLAYER_TYPE.HUMAN)
		players.append(player)
		player_node.add_child(player)


func init_player(index:int, player_name:String, player_type:int):
	players[index].setup(player_name, players[index].player_type)


func select_first_player():
	current_player_index = 0


func get_current_player():
	if players != null and is_valid_player():
		return players[current_player_index]
	else:
		return null


func select_next_player():
	current_player_index += 1
	print("PLAYER > %d" % current_player_index)


func is_valid_player() -> bool:
	return current_player_index >= 0 and current_player_index < players.size()
