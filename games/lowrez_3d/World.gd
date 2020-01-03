extends Spatial
var mouse_off = true
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_just_pressed("ui_cancel")):
		if mouse_off:
			mouse_off = false
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			mouse_off = true
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		#get_tree().quit()
	if (Input.is_action_just_pressed("restart")):
		get_tree().reload_current_scene()
#	pass
