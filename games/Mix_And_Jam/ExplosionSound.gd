extends AudioStreamPlayer
var triggered = false

func _ready():
	pass

func _process(delta):
	if Game.game_over_door and not triggered:
		triggered = true
		get_node("Timer").start(rand_range(0.0,0.1))



func _on_Timer_timeout():
	playing = true
	get_node("Timer").start(rand_range(0.1,0.3))

