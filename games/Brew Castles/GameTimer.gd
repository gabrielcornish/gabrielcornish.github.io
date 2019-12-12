extends RichTextLabel

var sec_elapsed = 0
var game_over = false

func _ready():
	visible = false
	pass 
	
func _process(delta):
	if not game_over:
		sec_elapsed += 1
		var miliseconds = sec_elapsed % 60
		var seconds = sec_elapsed % 3600 / 60
		var minutes = sec_elapsed % 216000 / 60 / 60
		
		text = "%02d : %02d : %02d" % [minutes, seconds, miliseconds]
		
	if game_over == true:
		visible = true