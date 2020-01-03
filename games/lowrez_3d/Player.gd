extends KinematicBody

var camera_angle = 0
var mouse_sensitivity = 0.3

var velocity = Vector3()
var direction = Vector3()

#fly variables
const FLY_SPEED = 20
const FLY_ACCEL = 4

var gravity = -9.8 * 3
const MAX_SPEED = 5
const MAX_RUNNING_SPEED = 30
const ACCEL = 2
const DEACCEL = 6

var jump_height = 15


func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	walk(delta)
	pass

func walk(delta):
	direction = Vector3()
	
	var aim = $Head/Camera.global_transform.basis
	
	if Input.is_action_pressed("forward"):
		direction -= aim.z
	if Input.is_action_pressed("backwards"):
		direction += aim.z
	if Input.is_action_pressed("left"):
		direction -= aim.x
	if Input.is_action_pressed("right"):
		direction += aim.x
		
	direction = direction.normalized()
	
	velocity.y += gravity * delta
	
	var temp_velocity = velocity
	temp_velocity.y = 0
	
	var speed
	if Input.is_action_pressed("sprint"):
		speed = MAX_RUNNING_SPEED
	else:
		speed = MAX_SPEED
		pass
	
	# How fast the player can go
	var target = direction * speed
	
	var acceleration
	if direction.dot(temp_velocity) > 0:
		acceleration = ACCEL
	else:
		acceleration = DEACCEL
	
	temp_velocity = temp_velocity.linear_interpolate(target, acceleration * delta)
	
	velocity.x = temp_velocity.x
	velocity.z = temp_velocity.z
	
	velocity = move_and_slide(velocity, Vector3(0,1,0)) 
	
	if Input.is_action_just_pressed("jump"):
		velocity.y = jump_height
	pass

func _input(event):
	if event is InputEventMouseMotion:
		$Head.rotate_y(deg2rad(-event.relative.x * mouse_sensitivity))
		
		var change = -event.relative.y * mouse_sensitivity
		if change + camera_angle < 90 and change + camera_angle > -90:
			$Head/Camera.rotate_x(deg2rad(change))
			camera_angle += change

func fly(delta):
	direction = Vector3()
	
	var aim = $Head/Camera.global_transform.basis
	
	if Input.is_action_pressed("forward"):
		direction -= aim.z
	if Input.is_action_pressed("backwards"):
		direction += aim.z
	if Input.is_action_pressed("left"):
		direction -= aim.x
	if Input.is_action_pressed("right"):
		direction += aim.x
		
	direction = direction.normalized()
	
	# How fast the player can go
	var target = direction * FLY_SPEED
	
	velocity = velocity.linear_interpolate(target, FLY_ACCEL * delta)
	
	move_and_slide(velocity)