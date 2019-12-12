extends AnimatedSprite

var position_to_follow = Vector2()

func _ready():
	get_node("Timer").start(rand_range(0.0,0.5))

func _on_PickParticles_animation_finished():
	 queue_free()

func _on_Timer_timeout():
	playing = true

