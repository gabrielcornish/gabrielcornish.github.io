extends AnimatedSprite
onready var border = get_parent().get_node("Border")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#	pass

func _input(event):
	if event.is_action_pressed("left_mouse"):
		border.visible = false
		queue_free()
