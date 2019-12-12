extends Area2D


func _ready():
	pass # Replace with function body.

func _on_Area2D_area_entered(area):
	if area.get_parent().name == "Player" and area.get_parent().has_sword:
		get_parent().get_parent()._spawn_win()
		queue_free()
	else:
		area.get_parent().queue_free()
		get_parent().get_parent()._spawn_lose()
		pass # Replace with function body.
