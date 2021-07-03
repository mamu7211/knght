extends Node2D


func _ready():
	GameContext.setup($TurnEngine, $DataRoot);
	GameContext.init_player(0, "First Human", Globals.PLAYER_TYPE.HUMAN)
	GameContext.init_player(1, "First Computer", Globals.PLAYER_TYPE.COMPUTER)
	GameContext.init_player(2, "Second Human", Globals.PLAYER_TYPE.HUMAN)
	GameContext.init_player(3, "Second Computer", Globals.PLAYER_TYPE.COMPUTER)
	GameContext.init_player(4, "Third Computer", Globals.PLAYER_TYPE.HUMAN)
	GameContext.init_player(5, "Fourth Computer", Globals.PLAYER_TYPE.COMPUTER)
	GameContext.init_player(6, "Fifth Computer", Globals.PLAYER_TYPE.COMPUTER)
	GameContext.init_player(5, "Third Human", Globals.PLAYER_TYPE.HUMAN)


func _process(_delta):
	pass


func _on_EndTurn_pressed():
	GameContext.turn_engine.end_turn()


func _on_StartTurn_pressed():
	GameContext.turn_engine.next_turn()
