extends RichTextLabel

func _process(delta):
	text = str(Game.points / 3) + "/7"