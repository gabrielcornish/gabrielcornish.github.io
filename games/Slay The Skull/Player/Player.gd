extends Node2D
var has_key = false
var has_sword = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if has_key:
		if get_node("Area2D/@Key@2/Area2D/Sprite/Info") != null:
			get_node("Area2D/@Key@2/Area2D/Sprite/Info").queue_free()
	pass
