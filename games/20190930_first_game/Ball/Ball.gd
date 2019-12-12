extends KinematicBody2D

var speed = 400
var velocity = Vector2()
onready var parent = get_parent()
onready var camera = get_parent().get_parent().get_node("Camera2D")
onready var shake_timer = $Timer
var holding = true
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	print(camera.name)
	pass # Replace with function body.
	
func _process(delta):
	# print(get_position().y)
	if holding:
		if GlobalScript.game_has_begun:
			velocity = Vector2(speed,speed)
			holding = false
	if get_position().y > 600:
		# print(get_position().y)
		GlobalScript.game_has_begun = false
		get_tree().reload_current_scene()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		var reflect = collision.remainder.bounce(collision.normal)
		velocity = velocity.bounce(collision.normal)
		move_and_collide(reflect)
		if collision.collider.has_method("got_hit"):
			shake_timer.start(0.25)
			camera.needs_shake = true
			collision.collider.got_hit()
	pass


func _on_Timer_timeout():
	camera.needs_shake = false
	pass # Replace with function body.
