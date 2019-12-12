extends Node2D
var speed = 10
var ready = false
var should_stop = false
onready var fire = get_node("Fire")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not should_stop:
		position.y += speed * delta
#	pass
func _input(event):
	if event.is_action_pressed("left_mouse") and ready:
		get_node("AudioStreamPlayer2D").playing = true
		fire.visible = true
		speed = 30
	if event.is_action_released("left_mouse") and ready:
		get_node("AudioStreamPlayer2D").playing = false
		fire.visible = false
		speed = 100
	pass

func _on_ReadyUp_timeout():
	ready = true
	pass # Replace with function body.
