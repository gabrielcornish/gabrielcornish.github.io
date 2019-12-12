extends Node2D

func _process(delta):
	if Game.game_over_door:
		visible = true
	pass