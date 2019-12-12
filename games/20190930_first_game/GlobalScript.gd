extends Node
var game_has_begun = false
var is_game_over = false
var number_of_bricks = 10
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event is InputEventKey:
		if event.pressed:
			start_game()
			
func start_game():
	game_has_begun = true

func _process(delta):
	if number_of_bricks <= 0:
		print("GAME HAS BEEN WON")
	pass
