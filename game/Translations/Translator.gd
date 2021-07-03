# Translator

extends Node


func get_player_type(player_type):
	match player_type:
		Globals.PLAYER_TYPE.HUMAN:
			return "Human"
		Globals.PLAYER_TYPE.COMPUTER:
			return "Computer"
		_ :
			return "n/a"
