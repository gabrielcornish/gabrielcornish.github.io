extends StaticBody2D

var health = 2
onready var anim = $AnimatedSprite
onready var audio = $AudioStreamPlayer2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func got_hit():
	audio.play()
	health -= 1

	if anim.animation != "sad":
		anim.animation = "hit"
		set_position(Vector2(-11.883,-43.573))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if anim.animation == "hit":
		if anim.get_frame() == 59:
			set_position(Vector2(0,0))
			anim.animation = "sad"
	if health <= 0:
		anim.animation = "hit"
		set_position(Vector2(-11.883,-43.573))
		if !audio.is_playing():
			self.queue_free()
			GlobalScript.number_of_bricks -= 1
	pass
