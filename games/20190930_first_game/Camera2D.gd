extends Camera2D
var shake_amount = 5.0
var needs_shake = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	make_current()
	pass # Replace with function body.

func shake():
	self.set_offset(Vector2(rand_range(-1.0,1.0)*shake_amount,rand_range(-1.0,1.0)*shake_amount))
	# print("shook")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if needs_shake:
		shake()
#	pass
