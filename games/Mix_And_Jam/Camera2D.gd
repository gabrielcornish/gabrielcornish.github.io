extends Camera2D
var shake_amount = 1.0
var shake = false

func _process(delta):
	position.x = get_parent().get_node("Player").position.x
	
	if Game.needs_shake == true and not Game.game_over_door:
		Game.needs_shake = false
		shake_camera(0.5)
	elif Game.needs_shake == true and Game.game_over_door:
		Game.needs_shake = false
		shake_camera(5)
	
	if shake:
		set_offset(Vector2(rand_range(-1.0, 1.0) * shake_amount,rand_range(-1.0, 1.0) * shake_amount))

func shake_camera(t):
	shake = true
	get_node("ShakeTimer").start(t)

func _on_ShakeTimer_timeout():
	shake = false
