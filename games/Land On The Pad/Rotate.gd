extends AnimatedSprite
var rotation_speed = 50
onready var platform = get_node("Landing Pad/AnimatedSprite/Area2D")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not platform.should_stop and not get_node("Area2D").should_stop:
		rotation_degrees += rotation_speed * delta
	if GameLogic.game_has_begun:
		get_node("Sprite").visible = false
#	pass
