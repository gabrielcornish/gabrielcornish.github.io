extends Node2D
onready var border = get_node("Border")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if GameLogic.is_game_won:
		border.visible = true
		get_node("YouWin").visible = true
	if GameLogic.is_game_lost:
		border.visible = true
		get_node("YouLost").visible = true
