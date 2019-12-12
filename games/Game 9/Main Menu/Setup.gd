extends RichTextLabel
var clicked = false
var click_parts = load("res://Ready Particles.tscn")

func _input(event):
	if event.is_action_pressed("click"):
		var click_parts_created = click_parts.instance()
		click_parts_created.position = get_global_mouse_position()
		click_parts_created.to_be_destroyed = true
		add_child(click_parts_created)
		
		if clicked == false:
			clicked = true
			text = "GATHER ENOUGH TO DRINK BEFORE IT'S TOO LATE. THE END OF THE WORLD IS NOT FORGIVING."
		else:
			get_tree().change_scene("res://Main Game.tscn")
			pass