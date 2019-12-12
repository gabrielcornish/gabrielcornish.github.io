extends AnimatedSprite


func _process(delta):
	if not flip_h:
		position = get_parent().get_node("Player").position - Vector2(55,20)
	if flip_h:
		position = get_parent().get_node("Player").position + Vector2(55,-20)
	
func _input(event):
	if event.is_action_pressed("move_left"): 
		visible = true
		flip_h = true
		
	if event.is_action_pressed("move_right"):
		visible = true
		flip_h = false
		
	if event.is_action_released("move_left") or event.is_action_released("move_right"):
		visible = false