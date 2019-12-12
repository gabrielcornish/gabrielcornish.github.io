extends RigidBody2D

var speed = 4
var moving_right = false
var moving_left = false
export var level = 1

func _input(event):
	if not Game.game_over_door:
		if event.is_action_pressed("move_left"):
			moving_left = true		
		if event.is_action_released("move_left"):
			moving_left = false
			
		if event.is_action_pressed("move_right"):
			moving_right = true
		if event.is_action_released("move_right"):
			moving_right = false
		
func _physics_process(delta):
	if moving_left:
		apply_impulse(Vector2(), Vector2(-1,0) * speed)
		
	if moving_right:
		apply_impulse(Vector2(), Vector2(1,0) * speed)

func _process(delta):
	if Game.num_collected >= 2:
		level = 2
		
	if Game.num_collected >= 4:
		level = 3
		
	if Game.num_collected >= 6:
		level = 4
		
	if Game.num_collected >= 10:
		level = 5