extends Node2D




func _ready():
	GameContext.create_new_game();


func _process(delta):
	pass


func _on_Button_button_down():
	$TurnEngine.current_player_done()
