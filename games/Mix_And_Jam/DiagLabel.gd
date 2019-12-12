extends RichTextLabel
var diag_index = 0

func _ready():
	get_node("Timer").start(7)

func _on_Timer_timeout():
	if diag_index == 0:
		text = ""
	pass # Replace with function body.

func update_text(text_update):
	get_node("Timer").start(7)
	text = text_update