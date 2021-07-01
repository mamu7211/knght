extends Node


var players = []
var cities = []


func create_new_game():
	pass


func get_statistics():
	return {
		"turn": 0,
		"players": {},
		"cities": {
			"count" : cities.size()
		}
	}
