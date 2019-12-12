extends Node2D
var ready_to_start = false
var game_loaded = false
var main_game = load("res://Main Menu.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ready_to_start:
		GameLogic.game_has_begun = true
		get_tree().change_scene("res://Main Game.tscn")
		
#	pass
