extends AnimatedSprite

func _ready():
	playing = true


func _on_Particles_animation_finished():
	queue_free()

