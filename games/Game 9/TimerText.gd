extends RichTextLabel

func _process(delta):
	text = str(round(get_node("Timer").time_left))