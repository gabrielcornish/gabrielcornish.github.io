extends RichTextLabel

func _process(delta):
	var miliseconds = game.time % 60
	var seconds = game.time % 3600/60
	var minutes = game.time % 216000/60/60
	var time_string = "%02d:%02d:%02d" % [minutes,seconds, miliseconds]
	text = str(time_string)