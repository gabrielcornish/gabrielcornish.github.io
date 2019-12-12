extends Node2D
var started = false
var to_be_destroyed = false

func _process(delta):
	if to_be_destroyed == true:
		get_node("AnimatedSprite").speed_scale = 3
		pass
	if visible and not started:
		started = true
		get_node("AnimatedSprite").play("default")

func _on_AnimatedSprite_animation_finished():
	visible = false
	started = false
	if to_be_destroyed == true:
		queue_free()
	pass 
