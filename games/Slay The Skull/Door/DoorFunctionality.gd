extends Area2D

onready var animation = get_node("AnimatedSprite")

func _on_Area2D_area_entered(area):
	if area.get_parent().name == "Player" and area.get_parent().has_key:
		get_parent().get_parent()._build_the_door()
		get_parent().get_parent().get_node("Player/Area2D").get_children()[2].queue_free()
		area.get_parent().has_key = false
		queue_free()
	if area.get_parent().name == "Player" and !area.get_parent().has_key and animation.animation == "open":
		get_parent().get_parent()._spawn_skull()
		get_parent().get_parent()._spawn_sword()
		queue_free()

func _process(delta):
	if animation.animation == "open":
		get_node("AnimatedSprite/Info").animation = "open_text"
		

