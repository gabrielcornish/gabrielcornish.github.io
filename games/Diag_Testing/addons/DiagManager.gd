extends Node

var player_name = "Player"

func player():
	return MSG.level_root().get_node("main/Player")

func can_talk(b):
	get_node("/root/Test_Scene/buttons").visible = b