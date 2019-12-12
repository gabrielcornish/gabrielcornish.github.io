extends AnimationPlayer

func _ready():
	playback_speed = rand_range(1.0,2.0)
	play("blow_up")
