extends TextureProgress
var drain = false


func _process(delta):
	if drain:
		value -= 1
		


func _input(event):
	
	if event.is_action_pressed("click"):
		drain = true
		
	if event.is_action_released("click"):
		drain = false
