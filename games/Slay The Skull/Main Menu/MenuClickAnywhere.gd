extends Area2D

var mouse_over = false

func _ready():
	pass # Replace with function body.

func _input(event):
	if mouse_over and event.is_pressed() and event.button_index == BUTTON_LEFT:
		get_tree().change_scene("res://Main Game.tscn")
	
func _on_Area2D_mouse_entered():
	mouse_over = true

func _on_Area2D_mouse_exited():
	mouse_over = false
