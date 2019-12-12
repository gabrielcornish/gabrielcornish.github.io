extends Sprite
var speed = 10

func _ready():
	randomize()
	get_node("Timer").start(rand_range(0.0,0.2))
	speed = (randi() % 60) + 10

func _process(delta):
	position.y -= speed * delta
	

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()


func _on_Timer_timeout():
	get_node("AnimationPlayer").play("default")

