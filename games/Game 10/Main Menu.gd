extends Node2D

func _input(event):
	if event.is_action_pressed("click"):
		get_tree().change_scene("res://MainNarrative.tscn")
		pass