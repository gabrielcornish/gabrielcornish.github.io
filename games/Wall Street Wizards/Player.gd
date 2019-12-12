extends Sprite

export var id = 0
export var first = false
export var last = false

var is_clicking = false
var active = false

var completed = false

var triggered_camera_move = false
var reset_scale = false

var wait = false

func _ready():
	scale = Vector2(0.25,0.25)

func _input(event):
	if event.is_action_pressed("click") and not wait:
		is_clicking = true

		if first:
			game.timer_started = true
		
		if game.current_score >= 10:
			reset_camera()
		
	if event.is_action_released("click") and not wait:
		is_clicking = false
		
		if active:
			completed = true
			check_score()
		
func _process(delta):
	if id == game.current_score:
		active = true
	else:
		active = false
		
	if reset_scale:
		if scale.x > 0.25:
			scale -= Vector2(0.01,0.01)
		else:
			scale = Vector2(0.25,0.25)
			reset_scale = false
			wait = false
	# If player is clicking and the circle is active and not completed, we scale the circle up
	if is_clicking and not completed and active and not wait:
		scale += Vector2(0.01,0.01)
		
		# If the scale is max size we reset everything.	
		if scale.x >= 1 and not last:
			completed = true
			reset_camera()
			
		elif scale.x >= 1 and last:
			
			game.timer_stopped = true
			is_clicking = false
			completed = true
			check_score()

func reset_self():
	is_clicking = false
	completed = false
	triggered_camera_move = false
	reset_scale = true
	get_tree().call_group("circle","turn_on_wait")
	
func turn_off_wait():
	wait = false

func turn_on_wait():
	wait = true

func check_score():
	if game.current_score >= 9:
		game.current_score += 1
		game.timer_stopped = true
		move_over_right()
		return
		
	if first and scale.x < 1:
		game.last_x_scale = scale.x
	
	if scale.x >= game.last_x_scale:
		print(str(scale.x)+" / " + str(game.last_x_scale))
		game.current_score += 1
		game.last_x_scale = scale.x
		move_over_right()
		
	else:
		reset_camera()


func move_over_right():
	get_tree().call_group("circle","turn_on_wait")
	get_owner().get_node("Camera2D").move_over(192)
	
func reset_camera():
	get_tree().call_group("circle","turn_on_wait")
	get_tree().call_group("camera","reset_camera")
