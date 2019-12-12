extends Area2D
var entered = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(event):
	if event.is_action_pressed("left_mouse") and entered:
		print("Replay Pressed")
		GameLogic.is_game_won = false
		GameLogic.is_game_lost = false
		get_tree().reload_current_scene()


func _on_Area2D_mouse_entered():
	entered = true

func _on_Area2D_mouse_exited():
	entered = false
	pass # Replace with function body.
