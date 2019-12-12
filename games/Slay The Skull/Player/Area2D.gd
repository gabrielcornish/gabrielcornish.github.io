extends Area2D

var can_grab = false
var grab_offset = Vector2()
onready var parent = get_parent()
var key_loaded = load("res://Key/Key.tscn")
var sword_loaded = load("res://Sword/Sword.tscn")

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and parent.name != "Key":
		can_grab = event.pressed
		grab_offset = position - get_global_mouse_position()

func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_grab:
		position = get_global_mouse_position() + grab_offset

func _ready():
	print(parent.name)

func _on_Area2D_area_entered(area):
	
	if area.get_parent().name == "Key" and parent.name == "Player":
		if area.get_parent().get_node("Area2D/Sprite/Info"):
			_delete_info_sprite(area.get_parent().get_node("Area2D/Sprite/Info"))
			
		var key_instance = key_loaded.instance()
		key_instance.position = Vector2(200,-80)
		parent.get_node("Area2D").add_child(key_instance)
		area.get_parent().queue_free()
		parent.has_key = true
		parent.get_node("Area2D/Sprite").scale = Vector2(1,1)
		
	if area.get_parent().name == "Sword" and parent.name == "Player":
		var sword_instance = sword_loaded.instance()
		sword_instance.position = Vector2(200,-140)
		parent.get_node("Area2D").add_child(sword_instance)
		area.get_parent().queue_free()
		parent.has_sword = true
		parent.get_node("Area2D/Sprite").scale = Vector2(1,1)

func _on_Area2D_mouse_entered():
	if parent.name == "Player" and !parent.has_key and !parent.has_sword:
		if parent.get_node("Area2D/Sprite/Info") != null:
			_delete_info_sprite(parent.get_node("Area2D/Sprite/Info"))
		parent.get_node("Area2D/Sprite").scale -= Vector2(0.25,0.25)
		pass # Replace with function body.


func _on_Area2D_mouse_exited():
	parent.get_node("Area2D/Sprite").scale = Vector2(1,1)
	pass # Replace with function body.

func _delete_info_sprite(x):
	x.queue_free()