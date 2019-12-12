extends Node2D
var goal_reached = false
export var horizontal = true
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if goal_reached:
		get_node("Draggable").goal_reached = true
		pass
#	pass