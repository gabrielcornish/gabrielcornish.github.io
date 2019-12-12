extends Sprite

var mouse_hover = false
var is_clicking = false
var going_up = true
var stopped = false


func _input(event):
	if event.is_action_pressed("click") and mouse_hover:
		stopped = true
		is_clicking = true
		
	if event.is_action_released("click"):
		is_clicking = false
		
func _process(delta):
	if !stopped:
		if going_up:
			scale.x += 0.02
			scale.y += 0.02
		else:
			scale.x -= 0.02
			scale.y -= 0.02
				
		if scale.x >= 1:
			going_up = false
			
		if scale.x <= 0.25:
			going_up = true
		

func _on_Area2D_mouse_entered():
	mouse_hover = true

func _on_Area2D_mouse_exited():
	mouse_hover = false

