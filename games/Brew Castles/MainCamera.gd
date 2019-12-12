extends Camera2D

var shake = false
export var shake_time = 1
var shake_amount = 1.5
var time = 0

func _ready():
	shake_time *= 60

func _process(delta):
	if shake:
		time += 1
		set_offset(Vector2(rand_range(-1.0,1.0)*shake_amount,rand_range(-1.0,1.0)*shake_amount))
		
	if time >= shake_time:
		time = 0
		shake = false
		
	if not shake:
		set_offset(Vector2())
		
func trigger_camera_shake(t):
	t *= 60
	shake_time = t
	shake = true