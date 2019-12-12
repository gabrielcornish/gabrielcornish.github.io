extends Sprite

func _process(delta):
	frame = get_parent().frame
	
	if get_parent().activated:
		visible = false
