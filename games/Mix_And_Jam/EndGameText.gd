extends RichTextLabel

var once = "first"
var triggered = false
func _process(delta):
	if Game.game_over_door and not triggered:
		triggered = true
		get_node("Timer").start(5)

func _on_Timer_timeout():
	if once == "first":
		text = "HE WAS IN THERE FOR A REASON YOU KNOW?"
		once = "second"
		get_node("Timer").start(3)
		return
		
	if once == "second":
		text = "JUST LOOK AT THIS MESS! DID YOU EVEN STOP TO THINK WHO HAS TO CLEAN THIS??"
		once = "third"
		get_node("Timer").start(5)
		return
		
	if once == "third":
		text = "THANKS A LOT! - @GABRIELCORNISH"
	pass # Replace with function body.
