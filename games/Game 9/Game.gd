extends Node

var points = 0
var game_won = false
var win_condition = 7

func _process(delta):
	if points >= 3 * win_condition:
		game_won = true